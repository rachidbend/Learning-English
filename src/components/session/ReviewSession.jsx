/**
 * ReviewSession.jsx
 *
 * Main component for conducting a review session with interleaved questions.
 *
 * FLOW:
 * 1. Build session from current progress
 * 2. Loop through interleaved question queue
 * 3. For each question:
 *    - Show word card first if needed (learning/low confidence)
 *    - Show quiz question
 *    - Record result
 *    - If all questions for word done: calculate quality, update schedule
 * 4. When all questions done: show session summary
 *
 * TODO UX: Current flow is functional but technical. Future improvements:
 * - Better onboarding for new users
 * - Animated transitions between questions
 * - Celebration animations for good performance
 * - Sound effects (optional, user toggle)
 * - Haptic feedback on mobile
 * - Spaced encouragement ("You're halfway there!")
 * - End-of-session insights ("Your speed improved 15%!")
 */

import React, { useState, useEffect, useRef, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';

// Existing components
import WordCard from '../WordCard';
import Quiz from '../Quiz';

// Session components
import SessionProgress from './SessionProgress';
import SessionComplete from './SessionComplete';
import WordReviewTransition from './WordReviewTransition';
import WrongAnswersReview from '../WrongAnswersReview';

// Engine
import { buildSession } from '../../engine/sessionBuilder';
import { calculateAnswerQuality } from '../../engine/qualityCalculator';
import { processAnswer } from '../../engine/scheduler';

// Data
import { loadProgress, saveProgress, getWordProgress } from '../../data/progressManager';
import { getWordById, loadBatch } from '../../data/wordData';
import { generateQuestion } from '../../utils/quizGenerator';

// ─────────────────────────────────────────────
// PHASES
// ─────────────────────────────────────────────
const PHASE = {
    SETUP: 'setup',
    STUDY_CARD: 'study_card',
    QUIZ: 'quiz',
    WORD_COMPLETE: 'word_complete',
    WRONG_REVIEW: 'wrong_review',
    SESSION_COMPLETE: 'session_complete',
};

const ReviewSession = ({ initialSession = null }) => {
    const navigate = useNavigate();
    // ═══════════════════════════════════════════
    // STATE
    // ═══════════════════════════════════════════

    const [phase, setPhase] = useState(PHASE.SETUP);
    const [session, setSession] = useState(initialSession);
    const [progress, setProgress] = useState(null);
    const [words, setWords] = useState([]);
    const [distractorPool, setDistractorPool] = useState([]);

    const [currentQuestionIndex, setCurrentQuestionIndex] = useState(0);
    const [currentQuestion, setCurrentQuestion] = useState(null);

    // Word being studied (for study_card phase)
    const [studyingWordId, setStudyingWordId] = useState(null);

    // Results accumulated per word (all questions for that word)
    const [wordResults, setWordResults] = useState({});

    // Final quality assignments (after all questions done)
    const [wordQualities, setWordQualities] = useState({});

    // Just-completed word info (for word_complete phase)
    const [justCompletedWord, setJustCompletedWord] = useState(null);
    const [wrongAnswers, setWrongAnswers] = useState([]);
    const [quickFlash, setQuickFlash] = useState(null);

    // Session metadata
    const [sessionStartTime] = useState(Date.now());
    const [confirmExit, setConfirmExit] = useState(false);

    // Answer timing
    const questionStartTime = useRef(null);
    const quickAdvanceTimer = useRef(null);

    useEffect(() => {
        return () => {
            if (quickAdvanceTimer.current) {
                clearTimeout(quickAdvanceTimer.current);
            }
        };
    }, []);

    // ═══════════════════════════════════════════
    // SETUP: Load data and build session
    // ═══════════════════════════════════════════

    useEffect(() => {
        const setup = async () => {
            try {
                // Load progress
                const prog = loadProgress();
                setProgress(prog);

                // Build or use provided session
                const sess = initialSession || buildSession(prog, {
                    newCardsLimit: prog.settings?.new_cards_per_day,
                });
                setSession(sess);

                // Load word data for all words in the session
                const wordIds = [
                    ...new Set([...sess.review_words, ...sess.new_words]),
                ];
                const wordPromises = wordIds.map(id => getWordById(id));
                const loadedWords = (await Promise.all(wordPromises)).filter(Boolean);
                setWords(loadedWords);

                // Load full batch for distractor pool so quizzes always
                // have enough options even with a single review word
                const batch = await loadBatch(1);
                const batchWords = batch ? batch.words : [];
                // Merge: batch words + any session words not already in batch
                const sessionOnlyWords = loadedWords.filter(
                    sw => !batchWords.some(bw => bw.id === sw.id)
                );
                const pool = [...batchWords, ...sessionOnlyWords];
                setDistractorPool(pool);

                // Check if there's anything to do
                if (sess.question_queue.length === 0 && sess.new_words.length === 0) {
                    setPhase(PHASE.SESSION_COMPLETE);
                    return;
                }

                // Start first question
                if (sess.question_queue.length > 0) {
                    prepareNextQuestion(sess, 0, prog, pool);
                } else {
                    setPhase(PHASE.SESSION_COMPLETE);
                }
            } catch (err) {
                console.error('[ReviewSession] Setup failed:', err);
            }
        };

        setup();
    }, []); // eslint-disable-line react-hooks/exhaustive-deps

    // ═══════════════════════════════════════════
    // QUESTION PREPARATION
    // ═══════════════════════════════════════════

    /**
     * Prepare the next question in the queue.
     * Determines if word needs study first.
     */
    const prepareNextQuestion = useCallback((sess, questionIndex, prog, pool) => {
        if (questionIndex >= sess.question_queue.length) {
            completeSession(sess, prog);
            return;
        }

        const descriptor = sess.question_queue[questionIndex];
        const wordId = descriptor.word_id;
        const wordProg = getWordProgress(prog || progress, wordId);

        // Determine if we should show study card first
        const shouldStudy = shouldShowStudyCard(wordProg);

        if (shouldStudy) {
            setStudyingWordId(wordId);
            setCurrentQuestionIndex(questionIndex);
            setPhase(PHASE.STUDY_CARD);
        } else {
            showQuestion(sess, questionIndex, pool);
        }
    }, [progress, words, wordResults]); // eslint-disable-line react-hooks/exhaustive-deps

    /**
     * Determine if word needs study card shown before quiz.
     *
     * Show card only if word is in learning/relearning.
     * Review cards should go directly to quiz.
     */
    const shouldShowStudyCard = (wordProg) => {
        // DISABLED FOR NOW
        return false;
    };

    /**
     * Transition from study card to quiz question.
     */
    const handleStudyCardComplete = useCallback(() => {
        showQuestion(session, currentQuestionIndex, distractorPool);
    }, [session, currentQuestionIndex, distractorPool]); // eslint-disable-line react-hooks/exhaustive-deps

    /**
     * Display the actual quiz question.
     */
    const showQuestion = (sess, questionIndex, pool) => {
        const descriptor = sess.question_queue[questionIndex];
        const wordPool = pool || distractorPool;
        const wordData = wordPool.find(w => w.id === descriptor.word_id)
            || words.find(w => w.id === descriptor.word_id);

        if (!wordData) {
            console.error('[ReviewSession] Word data not found:', descriptor.word_id);
            // Skip this question
            const nextIdx = questionIndex + 1;
            setCurrentQuestionIndex(nextIdx);
            prepareNextQuestion(sess, nextIdx, progress, pool);
            return;
        }

        // Use full distractor pool (100 words) for quiz generation
        const question = generateQuestion(wordData, wordPool, descriptor.question_type);

        if (!question) {
            console.warn('[ReviewSession] Failed to generate question:', descriptor);
            const nextIdx = questionIndex + 1;
            setCurrentQuestionIndex(nextIdx);
            prepareNextQuestion(sess, nextIdx, progress, wordPool);
            return;
        }

        // Attach tracking info
        question._word_id = descriptor.word_id;
        question._descriptor = descriptor;

        setCurrentQuestion(question);
        setCurrentQuestionIndex(questionIndex);
        questionStartTime.current = Date.now();
        setPhase(PHASE.QUIZ);
    };

    // ═══════════════════════════════════════════
    // ANSWER HANDLING
    // ═══════════════════════════════════════════

    const handleQuizAnswer = useCallback((isCorrect, selectedIndex) => {
        if (!currentQuestion) return;

        const timeTaken = Date.now() - (questionStartTime.current || Date.now());
        const wordId = currentQuestion._word_id;
        const descriptor = currentQuestion._descriptor;

        if (!isCorrect) {
            setWrongAnswers(prev => [
                ...prev,
                {
                    id: `${wordId}_${Date.now()}_${currentQuestion.id}`,
                    question: currentQuestion.question,
                    options: currentQuestion.options,
                    selected_index: selectedIndex,
                    correct_index: currentQuestion.correct_index,
                    question_type: descriptor.question_type,
                    explanation: currentQuestion.metadata?.original_sentence || currentQuestion.metadata?.context || null,
                }
            ]);
        }

        // Record result
        const result = {
            correct: isCorrect,
            time_ms: timeTaken,
            question_type: descriptor.question_type,
        };

        // Add to word-specific results
        const newWordResults = {
            ...wordResults,
            [wordId]: [...(wordResults[wordId] || []), result],
        };
        setWordResults(newWordResults);

        // Update session state's completed_questions for progress tracking
        const updatedSession = { ...session };
        updatedSession.state = {
            ...updatedSession.state,
            current_question_index: currentQuestionIndex + 1,
            completed_questions: [
                ...updatedSession.state.completed_questions,
                { word_id: wordId, correct: isCorrect, time_ms: timeTaken, question_type: descriptor.question_type },
            ],
            word_results: {
                ...updatedSession.state.word_results,
                [wordId]: [...(updatedSession.state.word_results[wordId] || []), result],
            },
        };
        setSession(updatedSession);

        setQuickFlash({ isCorrect });
        if (quickAdvanceTimer.current) {
            clearTimeout(quickAdvanceTimer.current);
        }

        const advanceDelay = isCorrect ? 1000 : 2000;

        quickAdvanceTimer.current = setTimeout(() => {
            setQuickFlash(null);

            // Check if all questions for this word are now complete
            const expectedCount = session.questions_per_word[wordId] || 3;
            const completedCount = newWordResults[wordId].length;

            if (completedCount >= expectedCount) {
                // All questions for this word are done
                completeWord(wordId, newWordResults[wordId], updatedSession, newWordResults);
            } else {
                showQuestion(updatedSession, currentQuestionIndex + 1);
            }
        }, advanceDelay);
    }, [session, currentQuestion, currentQuestionIndex, wordResults, progress, words, distractorPool]); // eslint-disable-line react-hooks/exhaustive-deps

    // ═══════════════════════════════════════════
    // WORD COMPLETION
    // ═══════════════════════════════════════════

    const completeWord = useCallback((wordId, results, updatedSession, newWordResults) => {
        // Get current word progress
        const wordProg = getWordProgress(progress, wordId);
        if (!wordProg) {
            console.warn('[ReviewSession] No progress for word:', wordId);
            const nextIdx = updatedSession.state.current_question_index;
            setCurrentQuestionIndex(nextIdx);
            if (nextIdx >= updatedSession.question_queue.length) {
                completeSession(updatedSession, progress);
            } else {
                prepareNextQuestion(updatedSession, nextIdx, progress, distractorPool);
            }
            return;
        }

        // Calculate answer quality from results
        const quality = calculateAnswerQuality(results, wordProg);

        // Update scheduling
        const updatedWordProg = processAnswer(wordProg, quality, results);

        // Update progress in state
        const newProgress = { ...progress };
        newProgress.wordProgress[String(wordId)] = updatedWordProg;
        setProgress(newProgress);

        // Save immediately
        saveProgress(newProgress);

        // Track quality for session summary
        const newQualities = { ...wordQualities, [wordId]: quality };
        setWordQualities(newQualities);

        // Update session's word_quality
        updatedSession.state.word_quality = {
            ...updatedSession.state.word_quality,
            [wordId]: quality,
        };
        setSession({ ...updatedSession });

        // Auto-advance without stopping on per-word feedback
        const nextIdx = updatedSession.state.current_question_index;
        setCurrentQuestionIndex(nextIdx);
        if (nextIdx >= updatedSession.question_queue.length) {
            completeSession(updatedSession, newProgress);
        } else {
            prepareNextQuestion(updatedSession, nextIdx, newProgress, distractorPool);
        }
    }, [progress, wordQualities, distractorPool]); // eslint-disable-line react-hooks/exhaustive-deps

    /**
     * Called after word_complete phase ends (auto-advance or tap).
     */
    const handleWordCompleteAdvance = useCallback(() => {
        setJustCompletedWord(null);
        const nextIdx = currentQuestionIndex + 1;
        setCurrentQuestionIndex(nextIdx);

        if (nextIdx >= session.question_queue.length) {
            completeSession(session, progress);
        } else {
            prepareNextQuestion(session, nextIdx, progress, words);
        }
    }, [session, currentQuestionIndex, progress, words]); // eslint-disable-line react-hooks/exhaustive-deps

    // ═══════════════════════════════════════════
    // SESSION COMPLETION
    // ═══════════════════════════════════════════

    const completeSession = useCallback((sess, prog) => {
        const finalSession = sess || session;
        const finalProgress = prog || progress;

        // Mark completed
        finalSession.state.completed_at = new Date().toISOString();
        if (!finalSession.state.started_at) {
            finalSession.state.started_at = new Date(sessionStartTime).toISOString();
        }
        setSession({ ...finalSession });

        // Update streak
        if (finalProgress) {
            if (!finalProgress.stats) finalProgress.stats = {};
            const today = new Date().toISOString().split('T')[0];
            const lastStudy = finalProgress.stats.last_study_date;

            if (lastStudy !== today) {
                const yesterday = new Date();
                yesterday.setDate(yesterday.getDate() - 1);
                const yesterdayStr = yesterday.toISOString().split('T')[0];

                if (lastStudy === yesterdayStr) {
                    finalProgress.stats.current_streak_days = (finalProgress.stats.current_streak_days || 0) + 1;
                } else {
                    finalProgress.stats.current_streak_days = 1;
                }
                finalProgress.stats.last_study_date = today;
            }

            finalProgress.stats.total_sessions = (finalProgress.stats.total_sessions || 0) + 1;
            saveProgress(finalProgress);
            setProgress({ ...finalProgress });
        }

        if (wrongAnswers.length > 0) {
            setPhase(PHASE.WRONG_REVIEW);
        } else {
            setPhase(PHASE.SESSION_COMPLETE);
        }
    }, [session, progress, sessionStartTime, wrongAnswers]);

    // ═══════════════════════════════════════════
    // EXIT HANDLING
    // ═══════════════════════════════════════════

    const handleExit = useCallback(() => {
        if (phase === PHASE.SESSION_COMPLETE) {
            navigate('/');
            return;
        }

        if (confirmExit) {
            // Second tap — save and exit
            if (quickAdvanceTimer.current) {
                clearTimeout(quickAdvanceTimer.current);
            }
            if (progress) saveProgress(progress);
            navigate('/');
        } else {
            setConfirmExit(true);
            setTimeout(() => setConfirmExit(false), 3000);
        }
    }, [phase, confirmExit, progress, navigate]);

    // ═══════════════════════════════════════════
    // RENDER
    // ═══════════════════════════════════════════

    // Loading / Setup
    if (phase === PHASE.SETUP || !session) {
        return (
            <div className="min-h-screen bg-background flex items-center justify-center">
                <div className="text-center">
                    <div className="w-12 h-12 border-4 border-primary/30 border-t-primary rounded-full animate-spin mx-auto mb-4" />
                    <p className="text-gray-500 text-sm">Loading session...</p>
                </div>
            </div>
        );
    }

    // Review wrong answers before final summary
    if (phase === PHASE.WRONG_REVIEW) {
        return (
            <WrongAnswersReview
                wrongAnswers={wrongAnswers}
                onContinue={() => setPhase(PHASE.SESSION_COMPLETE)}
            />
        );
    }

    // Session Complete
    if (phase === PHASE.SESSION_COMPLETE) {
        return (
            <SessionComplete
                session={session}
                wordQualities={wordQualities}
                wordResults={wordResults}
                sessionDuration={Date.now() - sessionStartTime}
                onExit={() => navigate('/')}
            />
        );
    }

    const totalQuestions = session.question_queue.length;
    const wordsCompleted = Object.keys(wordQualities).length;
    const totalWords = session.review_words.length;
    const currentWordProgress = currentQuestion
        ? getWordProgress(progress, currentQuestion._word_id)
        : null;

    return (
        <div className="min-h-screen bg-background">
            {/* ── Header with progress ─────────────────── */}
            <header className="bg-white shadow-sm sticky top-0 z-10">
                <div className="px-4 py-4">
                    <div className="flex items-center justify-between mb-3">
                        <h1 className="text-lg font-bold text-gray-900">Review Session</h1>

                        <button
                            onClick={handleExit}
                            className="text-sm text-gray-500 hover:text-gray-700 transition-colors"
                        >
                            Exit
                        </button>
                    </div>

                    <SessionProgress
                        current={currentQuestionIndex}
                        total={totalQuestions}
                        wordsCompleted={wordsCompleted}
                        totalWords={totalWords}
                    />
                </div>
            </header>

            {/* Exit confirmation toast */}
            {confirmExit && (
                <div className="fixed top-20 left-1/2 -translate-x-1/2 z-30
                        bg-gray-900 text-white text-sm px-4 py-2 rounded-full shadow-lg
                        animate-[fadeIn_150ms_ease-out]">
                    Tap Exit again to leave session
                </div>
            )}

            {/* ── Main content ─────────────────────────── */}
            <main className="p-4 pb-20 max-w-lg mx-auto">

                {/* PHASE: STUDY CARD */}
                {phase === PHASE.STUDY_CARD && (
                    <div>
                        <div className="mb-4 p-3 bg-blue-50 rounded-xl text-center">
                            <p className="text-sm text-blue-900 font-medium">
                                📚 Study this word before the quiz
                            </p>
                        </div>

                        <WordCard
                            word={words.find(w => w.id === studyingWordId)}
                            onNext={handleStudyCardComplete}
                            onPrevious={() => { }}
                            onMarkSeen={handleStudyCardComplete}
                            isFirstWord={true}
                            isLastWord={true}
                            currentIndex={0}
                            totalWords={1}
                        />

                        <div className="mt-4 text-center">
                            <button
                                onClick={handleStudyCardComplete}
                                className="px-6 py-3 bg-primary text-white rounded-xl font-semibold
                           active:scale-95 transition-transform"
                            >
                                Ready for Quiz →
                            </button>
                        </div>
                    </div>
                )}

                {/* PHASE: QUIZ */}
                {phase === PHASE.QUIZ && currentQuestion && (
                    <div>
                        <div className="mb-4 text-center">
                            <p className="text-sm text-gray-500">
                                Question {Math.min(currentQuestionIndex + 1, totalQuestions)} of {totalQuestions}
                            </p>
                        </div>

                        {currentWordProgress?.card_state === 'relearning' && (
                            <div className="mb-3 p-3 bg-amber-50 border border-amber-200 rounded-xl text-center flex items-center justify-center gap-2">
                                <span className="text-xl">🔄</span>
                                <p className="text-sm font-medium text-amber-900">
                                    Let's quickly review this word
                                </p>
                            </div>
                        )}

                        <Quiz
                            question={currentQuestion}
                            onAnswer={handleQuizAnswer}
                            showSkipButton={false}
                            mode="quick"
                        />
                    </div>
                )}

                {/* PHASE: WORD COMPLETE (brief feedback) */}
                {phase === PHASE.WORD_COMPLETE && justCompletedWord && (
                    <WordCompleteInline
                        quality={justCompletedWord.quality}
                        wordProgress={justCompletedWord.updatedWordProg}
                        onContinue={handleWordCompleteAdvance}
                    />
                )}
            </main>



            {/* Optional: Full transition overlay for word complete */}
            {/* Uncomment if you prefer the overlay style:
      {phase === PHASE.WORD_COMPLETE && justCompletedWord && (
        <WordReviewTransition
          wordProgress={justCompletedWord.updatedWordProg}
          quality={justCompletedWord.quality}
          onContinue={handleWordCompleteAdvance}
        />
      )}
      */}
        </div>
    );
};

// ═══════════════════════════════════════════
// WORD COMPLETE INLINE FEEDBACK
// ═══════════════════════════════════════════

const QUALITY_FEEDBACK = {
    easy: { emoji: '🎯', title: 'Excellent!', message: 'You know this word well', color: 'text-success' },
    good: { emoji: '✅', title: 'Good!', message: 'Solid performance', color: 'text-primary' },
    hard: { emoji: '📚', title: 'Keep practicing', message: "You'll get there!", color: 'text-amber-600' },
    again: { emoji: '💪', title: 'Keep going', message: 'This word needs more work', color: 'text-gray-700' },
};

const WordCompleteInline = ({ quality, wordProgress, onContinue }) => {
    const fb = QUALITY_FEEDBACK[quality] || QUALITY_FEEDBACK.good;

    // Auto-advance after 1.5s
    useEffect(() => {
        const timer = setTimeout(onContinue, 1500);
        return () => clearTimeout(timer);
    }, [onContinue]);

    return (
        <div className="flex items-center justify-center min-h-[400px]" onClick={onContinue}>
            <div className="text-center">
                <div className="text-6xl mb-4">{fb.emoji}</div>
                <h2 className={`text-2xl font-bold ${fb.color} mb-2`}>{fb.title}</h2>
                <p className="text-gray-600">{fb.message}</p>

                {/* Scheduling info */}
                <div className="mt-6 p-4 bg-gray-50 rounded-xl inline-block">
                    <p className="text-sm text-gray-600">
                        Next review:{' '}
                        <span className="font-semibold text-gray-900">
                            {formatNextReview(wordProgress)}
                        </span>
                    </p>
                </div>

                <p className="text-xs text-gray-400 mt-4">Tap to continue</p>
            </div>
        </div>
    );
};

// ═══════════════════════════════════════════
// UTILITY
// ═══════════════════════════════════════════

const formatNextReview = (wordProg) => {
    const { interval, card_state } = wordProg;

    if (card_state === 'learning' || card_state === 'relearning') {
        return 'Later this session';
    }
    if (interval < 1) return 'Today';
    if (interval === 1) return 'Tomorrow';
    if (interval < 7) return `In ${Math.round(interval)} days`;
    if (interval < 30) return `In ${Math.round(interval / 7)} weeks`;
    return `In ${Math.round(interval / 30)} months`;
};

export default ReviewSession;
