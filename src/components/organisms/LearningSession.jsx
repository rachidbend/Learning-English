/**
 * LearningSession.jsx
 *
 * Handles new word introduction and learning steps.
 * Words are processed SEQUENTIALLY (one at a time per step).
 *
 * FLOW:
 * 1. Select: User picks how many words to learn
 * 2. For each word:
 *    a. Step 0 (expose): Show WordCard → immediate quiz
 *       - Pass → schedule Step 1 (5 min) → next word
 *       - Fail → restart Step 0
 * 3. Waiting: countdown for Step 1 timers
 * 4. Step 1 (recall): Quiz without card
 *    - Pass → schedule Step 2 (15 min)
 *    - Fail → back to Step 0
 * 5. Step 2 (consolidation): Quiz without card
 *    - Pass → GRADUATE to review phase
 *    - Fail → back to Step 0
 *
 * LEARNING_STEPS_MINUTES = [0, 5, 15]
 *
 * TODO UX: Enhance wait time with mini activities
 * TODO PHASE 7: Integrate into ReviewSession for unified flow
 */

import React, { useState, useEffect, useRef, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';

import StudyWordCard from './StudyWordCard';
import QuizCard from './QuizCard';
import SessionHeader from '../molecules/SessionHeader';
import ExitConfirmModal from '../molecules/ExitConfirmModal';

import { loadProgress, saveProgress, ensureWordProgress, getAvailableNewWordIds } from '../../data/progressManager';
import { loadBatch } from '../../data/wordData';
import { processFirstExposure, processAnswer } from '../../engine/scheduler';
import { LEARNING_STEPS_MINUTES, CARD_STATE, ANSWER_QUALITY } from '../../data/progressSchema';
import { generateQuestion } from '../../utils/quizGenerator';
import { calculateAnswerQuality } from '../../engine/qualityCalculator';

// ─────────────────────────────────────────────
// PHASES
// ─────────────────────────────────────────────
const PHASE = {
    SETUP: 'setup',
    SELECT: 'select',
    EXPOSE: 'expose',       // Show WordCard (Step 0)
    QUIZ: 'quiz',           // Quiz question
    WAITING: 'waiting',     // Countdown for next step
    COMPLETE: 'complete',   // Session done
};

// ─────────────────────────────────────────────
// DEV MODE (set false for production timers)
// ─────────────────────────────────────────────
const DEV_FAST_MODE = false;
const DEV_STEP_SECONDS = [0, 10, 20]; // Fast-mode timers in seconds

const getStepDelayMs = (stepIndex) => {
    if (DEV_FAST_MODE) {
        return (DEV_STEP_SECONDS[stepIndex] || 10) * 1000;
    }
    return (LEARNING_STEPS_MINUTES[stepIndex] || 5) * 60 * 1000;
};

// ─────────────────────────────────────────────
// COMPONENT
// ─────────────────────────────────────────────
const LearningSession = ({ sessionCount = 10 }) => {
    const navigate = useNavigate();

    // ═══════════════════════════════════════════
    // STATE
    // ═══════════════════════════════════════════
    const [phase, setPhase] = useState(PHASE.SETUP);
    const [progress, setProgress] = useState(null);
    const [words, setWords] = useState([]);

    // Session config
    const [maxNewWords, setMaxNewWords] = useState(10);
    const [availableNewCount, setAvailableNewCount] = useState(0);
    const [wordsToLearn, setWordsToLearn] = useState([]);
    const [currentWordIndex, setCurrentWordIndex] = useState(0);

    // Per-word learning state
    const [wordStates, setWordStates] = useState({});

    // Current question
    const [currentQuestion, setCurrentQuestion] = useState(null);
    const [lastAnswer, setLastAnswer] = useState(null);
    const questionStartTime = useRef(null);

    // Waiting list (words with timers)
    const [waitingWords, setWaitingWords] = useState([]);

    // Session timing
    const [sessionStartTime] = useState(Date.now());

    // Timer tick for countdown display
    const [, setTimerTick] = useState(0);

    // Exit confirmation
    const [confirmExit, setConfirmExit] = useState(false);

    // ═══════════════════════════════════════════
    // SETUP
    // ═══════════════════════════════════════════
    useEffect(() => {
        const setup = async () => {
            try {
                const prog = loadProgress();
                setProgress(prog);

                const batch = await loadBatch(1);
                if (!batch) {
                    console.error('[LearningSession] Failed to load batch');
                    return;
                }
                setWords(batch.words);

                // Count available new words
                const newWordIds = getAvailableNewWordIds(prog, batch.words);
                const count = newWordIds.length;
                setAvailableNewCount(count);

                if (count === 0) {
                    setPhase(PHASE.COMPLETE);
                    return;
                }

                // Skip SELECT — auto-start with sessionCount from LearnPage
                const wordCount = Math.min(sessionCount, count);
                setMaxNewWords(wordCount);
                // Auto-start: select words and begin
                const selectedIds = newWordIds.slice(0, wordCount);
                setWordsToLearn(selectedIds);
                const states = {};
                selectedIds.forEach(id => {
                    states[id] = { currentStep: 0, nextStepTime: null, results: [], graduated: false, failedSteps: 0 };
                });
                setWordStates(states);
                setCurrentWordIndex(0);
                // Start first word exposure
                ensureWordProgress(prog, selectedIds[0], 1);
                const wp = prog.wordProgress[String(selectedIds[0])];
                processFirstExposure(wp);
                saveProgress(prog);
                setProgress({ ...prog });
                setPhase(PHASE.EXPOSE);
            } catch (err) {
                console.error('[LearningSession] Setup failed:', err);
            }
        };

        setup();
    }, []);

    // Timer tick for countdown (1 second interval)
    useEffect(() => {
        if (phase !== PHASE.WAITING) return;

        const interval = setInterval(() => {
            setTimerTick(t => t + 1);

            // Check if any waiting words are ready
            const now = Date.now();
            setWaitingWords(prev => {
                const ready = prev.filter(w => w.nextStepTime <= now);
                if (ready.length > 0) {
                    // First ready word — start its quiz
                    const first = ready[0];
                    const remaining = prev.filter(w => w.wordId !== first.wordId);

                    // Trigger quiz for this word on next tick
                    setTimeout(() => {
                        startStepQuiz(first.wordId, first.step);
                    }, 0);

                    return remaining;
                }
                return prev;
            });
        }, 1000);

        return () => clearInterval(interval);
    }, [phase]); // eslint-disable-line react-hooks/exhaustive-deps

    // ═══════════════════════════════════════════
    // WORD SELECTION
    // ═══════════════════════════════════════════
    const handleStartLearning = useCallback(() => {
        // Get available new word IDs from batch
        const batch = words;
        const allNewIds = getAvailableNewWordIds(progress, batch.map(w => ({ id: w.id })));
        const selectedIds = allNewIds.slice(0, maxNewWords);

        if (selectedIds.length === 0) return;

        setWordsToLearn(selectedIds);

        // Initialize word states
        const states = {};
        selectedIds.forEach(id => {
            states[id] = {
                currentStep: 0,
                nextStepTime: null,
                results: [],
                graduated: false,
                failedSteps: 0,
            };
        });
        setWordStates(states);

        // Start with first word
        setCurrentWordIndex(0);
        startWordExposure(selectedIds[0], progress);
    }, [progress, maxNewWords]); // eslint-disable-line react-hooks/exhaustive-deps

    // ═══════════════════════════════════════════
    // STEP 0: FIRST EXPOSURE
    // ═══════════════════════════════════════════
    const startWordExposure = useCallback((wordId, prog) => {
        const currentProg = prog || progress;

        // Ensure word progress entry exists
        ensureWordProgress(currentProg, wordId, 1);
        const wordProg = currentProg.wordProgress[String(wordId)];

        // Only call processFirstExposure if word is still NEW
        if (wordProg.card_state === CARD_STATE.NEW) {
            const updated = processFirstExposure(wordProg);
            currentProg.wordProgress[String(wordId)] = updated;
            setProgress({ ...currentProg });
            saveProgress(currentProg);
        }

        setPhase(PHASE.EXPOSE);
    }, [progress]);

    // User finished viewing WordCard → quiz time
    const handleExposureComplete = useCallback(() => {
        const wordId = wordsToLearn[currentWordIndex];
        startStepQuiz(wordId, 0);
    }, [wordsToLearn, currentWordIndex]); // eslint-disable-line react-hooks/exhaustive-deps

    // ═══════════════════════════════════════════
    // QUIZ
    // ═══════════════════════════════════════════
    const startStepQuiz = useCallback((wordId, step) => {
        const wordData = words.find(w => w.id === wordId);
        if (!wordData) {
            console.error('[LearningSession] Word not found:', wordId);
            return;
        }

        // Generate question — use easier types for early steps
        const questionType = step === 0 ? 'translation_match' : null; // null = random
        const question = generateQuestion(wordData, words, questionType);

        if (!question) {
            console.warn('[LearningSession] Failed to generate question for word:', wordId);
            return;
        }

        // Track metadata
        question._word_id = wordId;
        question._step = step;

        setCurrentQuestion(question);
        questionStartTime.current = Date.now();

        // Update the active word index so LearningStep shows correctly
        const idx = wordsToLearn.indexOf(wordId);
        if (idx >= 0) setCurrentWordIndex(idx);

        setPhase(PHASE.QUIZ);
    }, [words, wordsToLearn]);

    // ═══════════════════════════════════════════
    // ANSWER HANDLING
    // ═══════════════════════════════════════════
    const handleQuizAnswer = useCallback((isCorrect, selectedIndex) => {
        if (!currentQuestion) return;

        const timeTaken = Date.now() - (questionStartTime.current || Date.now());
        const wordId = currentQuestion._word_id;
        const step = currentQuestion._step;

        // Record result
        const result = {
            step,
            correct: isCorrect,
            time_ms: timeTaken,
            question_type: currentQuestion.type,
        };

        // Update word states
        const updatedStates = {
            ...wordStates,
            [wordId]: {
                ...wordStates[wordId],
                results: [...(wordStates[wordId]?.results || []), result],
            },
        };
        setWordStates(updatedStates);

        // Advance to next step or restart
        if (isCorrect) {
            advanceWordStep(wordId, step);
        } else {
            restartWord(wordId);
        }
    }, [currentQuestion, wordStates]);

    // ═══════════════════════════════════════════
    // ADVANCE OR RESTART
    // ═══════════════════════════════════════════

    const advanceWordStep = useCallback((wordId, completedStep) => {
        const nextStep = completedStep + 1;

        if (nextStep >= LEARNING_STEPS_MINUTES.length) {
            // All steps done → GRADUATE
            graduateWord(wordId);
            return;
        }

        // Schedule next step with timer
        const delayMs = getStepDelayMs(nextStep);
        const nextStepTime = Date.now() + delayMs;

        // Update word state
        const updatedStates = {
            ...wordStates,
            [wordId]: {
                ...wordStates[wordId],
                currentStep: nextStep,
                nextStepTime,
            },
        };
        setWordStates(updatedStates);

        // Update progress via scheduler
        const wordProg = progress.wordProgress[String(wordId)];
        if (wordProg) {
            const quality = ANSWER_QUALITY.GOOD;
            const updated = processAnswer(wordProg, quality, wordStates[wordId]?.results || []);
            progress.wordProgress[String(wordId)] = updated;
            setProgress({ ...progress });
            saveProgress(progress);
        }

        // Add to waiting list if there's a delay
        if (delayMs > 0) {
            setWaitingWords(prev => [
                ...prev,
                { wordId, nextStepTime, step: nextStep },
            ]);
        }

        // If we're still introducing words (Step 0), move to next word
        if (completedStep === 0) {
            proceedToNextWord();
        } else {
            // After Step 1+, go to waiting if more words are pending
            checkForWaitingPhase();
        }
    }, [wordStates, progress]); // eslint-disable-line react-hooks/exhaustive-deps

    const restartWord = useCallback((wordId) => {
        // Failed — back to Step 0
        const updatedStates = {
            ...wordStates,
            [wordId]: {
                ...wordStates[wordId],
                currentStep: 0,
                nextStepTime: null,
                failedSteps: (wordStates[wordId]?.failedSteps || 0) + 1,
            },
        };
        setWordStates(updatedStates);

        // Remove from waiting list
        setWaitingWords(prev => prev.filter(w => w.wordId !== wordId));

        // Update scheduler — AGAIN quality
        const wordProg = progress.wordProgress[String(wordId)];
        if (wordProg) {
            const updated = processAnswer(wordProg, ANSWER_QUALITY.AGAIN, wordStates[wordId]?.results || []);
            progress.wordProgress[String(wordId)] = updated;
            setProgress({ ...progress });
            saveProgress(progress);
        }

        // Re-expose the word
        startWordExposure(wordId, progress);
    }, [wordStates, progress, startWordExposure]);

    const graduateWord = useCallback((wordId) => {
        // Update local state
        const updatedStates = {
            ...wordStates,
            [wordId]: {
                ...wordStates[wordId],
                graduated: true,
            },
        };
        setWordStates(updatedStates);

        // Graduate in scheduler
        const wordProg = progress.wordProgress[String(wordId)];
        if (wordProg) {
            const updated = processAnswer(
                wordProg,
                ANSWER_QUALITY.GOOD,
                wordStates[wordId]?.results || []
            );
            progress.wordProgress[String(wordId)] = updated;
            setProgress({ ...progress });
            saveProgress(progress);
        }

        // Check if all words are done
        const allDone = wordsToLearn.every(id =>
            id === wordId
                ? true // just graduated
                : updatedStates[id]?.graduated
        );

        const noneWaiting = waitingWords.filter(w => w.wordId !== wordId).length === 0;

        if (allDone && noneWaiting) {
            setPhase(PHASE.COMPLETE);
        } else {
            checkForWaitingPhase();
        }
    }, [wordStates, progress, wordsToLearn, waitingWords]); // eslint-disable-line react-hooks/exhaustive-deps

    // ═══════════════════════════════════════════
    // NAVIGATION BETWEEN WORDS
    // ═══════════════════════════════════════════
    const proceedToNextWord = useCallback(() => {
        const nextIdx = currentWordIndex + 1;

        if (nextIdx < wordsToLearn.length) {
            setCurrentWordIndex(nextIdx);
            startWordExposure(wordsToLearn[nextIdx], progress);
        } else {
            // All words introduced — enter waiting phase
            checkForWaitingPhase();
        }
    }, [currentWordIndex, wordsToLearn, progress, startWordExposure]);

    const checkForWaitingPhase = useCallback(() => {
        // Count how many words are still in-progress (not graduated, not waiting)
        const allGraduated = wordsToLearn.every(id => wordStates[id]?.graduated);

        if (allGraduated) {
            setPhase(PHASE.COMPLETE);
            return;
        }

        // If there are words with timers, show waiting phase
        setPhase(PHASE.WAITING);
    }, [wordsToLearn, wordStates]);

    // ═══════════════════════════════════════════
    // EXIT
    // ═══════════════════════════════════════════
    const handleExit = useCallback(() => {
        if (phase === PHASE.COMPLETE || phase === PHASE.SELECT) {
            navigate('/');
            return;
        }
        setConfirmExit(true);
    }, [phase, navigate]);

    const handleConfirmExit = useCallback(() => {
        if (progress) saveProgress(progress);
        navigate('/');
    }, [progress, navigate]);

    // ═══════════════════════════════════════════
    // DERIVED STATE
    // ═══════════════════════════════════════════
    const graduatedCount = Object.values(wordStates).filter(s => s.graduated).length;
    const currentWord = words.find(w => w.id === wordsToLearn[currentWordIndex]);
    const activeWordState = wordsToLearn[currentWordIndex]
        ? wordStates[wordsToLearn[currentWordIndex]]
        : null;

    // ═══════════════════════════════════════════
    // RENDER
    // ═══════════════════════════════════════════
    if (phase === PHASE.SETUP) {
        return (
            <div style={{ minHeight: '100vh', backgroundColor: 'var(--color-bg-primary)', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                <div style={{ textAlign: 'center' }}>
                    <div style={{ width: 40, height: 40, border: '3px solid var(--color-border-subtle)', borderTopColor: 'var(--color-accent-blue)', borderRadius: '50%', animation: 'spin 0.8s linear infinite' }} />
                    <style>{`@keyframes spin { to { transform: rotate(360deg) } }`}</style>
                </div>
            </div>
        );
    }

    return (
        <div style={{ minHeight: '100vh', backgroundColor: 'var(--color-bg-primary)' }}>
            {/* Session Header */}
            {phase !== PHASE.COMPLETE && phase !== PHASE.SELECT && (
                <SessionHeader
                    phase={phase === PHASE.QUIZ ? 'quiz' : 'study'}
                    currentWordIndex={currentWordIndex}
                    totalWords={wordsToLearn.length}
                    graduatedCount={graduatedCount}
                    onExit={handleExit}
                />
            )}

            {/* Exit confirmation modal */}
            <ExitConfirmModal
                isOpen={confirmExit}
                onCancel={() => setConfirmExit(false)}
                onConfirm={handleConfirmExit}
            />

            <main style={{ maxWidth: '480px', margin: '0 auto' }}>

                {/* PHASE: EXPOSE (StudyWordCard) */}
                {phase === PHASE.EXPOSE && currentWord && (
                    <StudyWordCard
                        word={currentWord}
                        onNext={handleExposureComplete}
                    />
                )}

                {/* PHASE: QUIZ (QuizCard) */}
                {phase === PHASE.QUIZ && currentQuestion && (
                    <QuizCard
                        key={currentQuestion._word_id + '-' + (currentQuestion._step || 0)}
                        question={currentQuestion}
                        onAnswer={handleQuizAnswer}
                    />
                )}

                {/* PHASE: WAITING */}
                {phase === PHASE.WAITING && (
                    <WaitingPhase
                        waitingWords={waitingWords}
                        wordStates={wordStates}
                        wordsToLearn={wordsToLearn}
                        words={words}
                        graduatedCount={graduatedCount}
                    />
                )}

                {/* PHASE: COMPLETE */}
                {phase === PHASE.COMPLETE && (
                    <CompletionScreen
                        wordsToLearn={wordsToLearn}
                        wordStates={wordStates}
                        words={words}
                        sessionStartTime={sessionStartTime}
                        availableNewCount={availableNewCount}
                        onDone={() => navigate('/')}
                        onLearnMore={() => window.location.reload()}
                    />
                )}
            </main>
        </div>
    );
};

// ═══════════════════════════════════════════
// SUB-COMPONENTS
// ═══════════════════════════════════════════

/** Countdown waiting phase between learning steps */
const WaitingPhase = ({ waitingWords, wordStates, wordsToLearn, words, graduatedCount }) => {
    // Sort waiting by soonest first
    const sorted = [...waitingWords].sort((a, b) => a.nextStepTime - b.nextStepTime);
    const nextReady = sorted[0];

    return (
        <div className="max-w-md mx-auto mt-4">
            <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 text-center">
                <div className="text-5xl mb-4">⏱️</div>
                <h2 className="text-xl font-bold text-gray-900 mb-2">
                    Building Your Memory
                </h2>
                <p className="text-gray-500 text-sm mb-6">
                    Spacing out reviews helps your brain form stronger connections.
                    Your next quiz will appear automatically.
                </p>

                {/* Countdown */}
                {nextReady && (
                    <div className="bg-gradient-to-br from-primary/5 to-secondary/5 border border-primary/10 rounded-2xl p-6 mb-6">
                        <p className="text-sm text-gray-600 mb-1">Next quiz in</p>
                        <p className="text-4xl font-bold text-primary tabular-nums">
                            {formatTimeRemaining(nextReady.nextStepTime)}
                        </p>
                        <p className="text-xs text-gray-500 mt-2">
                            {sorted.length} {sorted.length === 1 ? 'word' : 'words'} waiting
                        </p>
                    </div>
                )}

                {/* Words status list */}
                <div className="text-left space-y-2">
                    {wordsToLearn.map(id => {
                        const ws = wordStates[id];
                        const wordData = words.find(w => w.id === id);
                        if (!wordData || !ws) return null;

                        return (
                            <div key={id} className="flex items-center justify-between py-2 px-3 bg-gray-50 rounded-lg">
                                <span className="text-sm font-medium text-gray-800">{wordData.word}</span>
                                <span className="text-xs text-gray-500">
                                    {ws.graduated
                                        ? '🎓 Graduated'
                                        : ws.nextStepTime
                                            ? `Step ${ws.currentStep + 1}/3 — ${formatTimeRemaining(ws.nextStepTime)}`
                                            : `Step ${ws.currentStep + 1}/3`
                                    }
                                </span>
                            </div>
                        );
                    })}
                </div>

                {/* Progress */}
                <div className="mt-6 text-center">
                    <p className="text-xs text-gray-400">
                        {graduatedCount} of {wordsToLearn.length} words graduated
                    </p>
                </div>
            </div>

            {/* Tip */}
            <div className="mt-4 px-4 py-3 bg-blue-50/60 rounded-xl text-center">
                <p className="text-xs text-blue-700/80">
                    💡 Tip: Your brain needs time between reviews to strengthen neural pathways.
                    This spacing effect is key to long-term retention!
                </p>
            </div>
        </div>
    );
};

/** Session completion screen */
const CompletionScreen = ({ wordsToLearn, wordStates, words, sessionStartTime, availableNewCount, onDone, onLearnMore }) => {
    const graduated = Object.values(wordStates).filter(s => s.graduated).length;
    const totalAttempts = Object.values(wordStates).reduce((sum, s) => sum + (s.results?.length || 0), 0);
    const correctAttempts = Object.values(wordStates).reduce(
        (sum, s) => sum + (s.results?.filter(r => r.correct)?.length || 0), 0
    );
    const accuracy = totalAttempts > 0 ? Math.round((correctAttempts / totalAttempts) * 100) : 0;
    const duration = Math.round((Date.now() - sessionStartTime) / 60000);
    const hasMoreWords = availableNewCount > wordsToLearn.length;

    return (
        <div className="max-w-md mx-auto mt-4">
            <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 text-center">
                <div className="text-6xl mb-4">🎉</div>
                <h2 className="text-2xl font-bold text-gray-900 mb-2">
                    Learning Complete!
                </h2>
                <p className="text-gray-500 text-sm mb-6">
                    {graduated > 0
                        ? `${graduated} ${graduated === 1 ? 'word has' : 'words have'} graduated to review!`
                        : 'Keep practicing — you\'ll get there!'}
                </p>

                {/* Stats grid */}
                <div className="grid grid-cols-3 gap-3 mb-6">
                    <div className="bg-gray-50 rounded-xl p-3">
                        <p className="text-2xl font-bold text-secondary">{graduated}</p>
                        <p className="text-xs text-gray-500">Graduated</p>
                    </div>
                    <div className="bg-gray-50 rounded-xl p-3">
                        <p className="text-2xl font-bold text-primary">{accuracy}%</p>
                        <p className="text-xs text-gray-500">Accuracy</p>
                    </div>
                    <div className="bg-gray-50 rounded-xl p-3">
                        <p className="text-2xl font-bold text-gray-700">{duration}m</p>
                        <p className="text-xs text-gray-500">Duration</p>
                    </div>
                </div>

                {/* Word results */}
                <div className="text-left mb-6">
                    <p className="text-sm font-semibold text-gray-700 mb-2">Words learned:</p>
                    <div className="space-y-1.5">
                        {wordsToLearn.map(id => {
                            const ws = wordStates[id];
                            const wordData = words.find(w => w.id === id);
                            if (!wordData) return null;

                            return (
                                <div key={id} className="flex items-center justify-between py-2 px-3 bg-gray-50 rounded-lg">
                                    <span className="text-sm font-medium text-gray-800">{wordData.word}</span>
                                    <span className={`text-xs font-medium ${ws?.graduated ? 'text-success' : 'text-amber-600'}`}>
                                        {ws?.graduated ? '🎓 Graduated' : '📚 Needs practice'}
                                    </span>
                                </div>
                            );
                        })}
                    </div>
                </div>

                {/* Actions */}
                <div className="space-y-3">
                    <button
                        onClick={onDone}
                        className="w-full py-3.5 bg-primary text-white rounded-xl font-semibold
                       active:scale-95 transition-transform"
                    >
                        Done
                    </button>

                    {hasMoreWords && (
                        <button
                            onClick={onLearnMore}
                            className="w-full py-3 bg-gray-100 text-gray-700 rounded-xl font-medium
                           active:scale-95 transition-transform"
                        >
                            Learn More Words
                        </button>
                    )}
                </div>
            </div>
        </div>
    );
};

// ═══════════════════════════════════════════
// HELPERS
// ═══════════════════════════════════════════

const getStepMessage = (step) => {
    switch (step) {
        case 0: return "Let's see if you remember";
        case 1: return "Quick recall test — no peeking!";
        case 2: return "Final check before graduating";
        default: return "Quiz time";
    }
};

const formatTimeRemaining = (targetTime) => {
    const remaining = targetTime - Date.now();
    if (remaining <= 0) return 'Ready!';

    const minutes = Math.floor(remaining / 60000);
    const seconds = Math.floor((remaining % 60000) / 1000);

    if (minutes > 0) return `${minutes}m ${seconds.toString().padStart(2, '0')}s`;
    return `${seconds}s`;
};

export default LearningSession;
