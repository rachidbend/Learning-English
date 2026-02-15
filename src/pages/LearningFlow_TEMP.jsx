import React, { useState, useEffect } from 'react';
import WordCard from '../components/WordCard';
import { loadBatch, getBatchMetadata } from '../data/wordData';
import {
    initialProgressStructure,
    createWordProgress,
    createBatchProgress,
    WORD_STATUS,
    BATCH_STATUS
} from '../data/progressStructure';

// Phase 5: Quiz component imports
import Quiz from '../components/Quiz';
import QuizFeedback from '../components/QuizFeedback';
import { generateQuestion } from '../utils/quizGenerator';
import QUESTION_TYPES from '../utils/questionTypes';
import BatchComplete from '../components/BatchComplete';

// ==================== CONSTANTS ====================

const STORAGE_KEY = 'englishLearningProgress';

// Phase 5: Quiz pattern configuration
const WORDS_BEFORE_TEST = 5; // Learn 5 words → test on word 1

// ==================== PROGRESS UTILITY FUNCTIONS ====================

/**
 * Load user progress from localStorage
 * Returns initial structure if nothing exists
 */
const loadProgress = () => {
    try {
        const stored = localStorage.getItem(STORAGE_KEY);
        if (!stored) {
            // First time user - initialize structure
            const initial = JSON.parse(JSON.stringify(initialProgressStructure));
            initial.createdAt = new Date().toISOString();
            return initial;
        }
        return JSON.parse(stored);
    } catch (error) {
        console.error('Failed to load progress:', error);
        return JSON.parse(JSON.stringify(initialProgressStructure));
    }
};

/**
 * Save user progress to localStorage
 */
const saveProgress = (progress) => {
    try {
        progress.lastUpdated = new Date().toISOString();
        localStorage.setItem(STORAGE_KEY, JSON.stringify(progress));
    } catch (error) {
        console.error('Failed to save progress:', error);
        alert('Warning: Progress could not be saved. Please check your browser settings.');
    }
};

/**
 * Ensure word progress exists in the progress object
 * Creates entry if it doesn't exist
 */
const ensureWordProgress = (progress, wordId, batchId) => {
    if (!progress.wordProgress) {
        progress.wordProgress = {};
    }

    if (!progress.wordProgress[wordId]) {
        progress.wordProgress[wordId] = createWordProgress(wordId, batchId);
    }

    return progress;
};

/**
 * Ensure batch progress exists in the progress object
 * Creates entry if it doesn't exist
 */
const ensureBatchProgress = (progress, batchId) => {
    if (!progress.batchProgress) {
        progress.batchProgress = {};
    }

    if (!progress.batchProgress[batchId]) {
        progress.batchProgress[batchId] = createBatchProgress(batchId);
    }

    return progress;
};

/**
 * Mark a word as seen (user viewed the WordCard)
 * Updates word status, timestamps, and counters
 * @returns {Object} { progress, wasNewWord } - Updated progress and boolean indicating if this was first time seeing the word
 */
const markWordAsSeen = (progress, wordId, batchId) => {
    // Ensure structures exist
    ensureWordProgress(progress, wordId, batchId);
    ensureBatchProgress(progress, batchId);

    const wordProgress = progress.wordProgress[wordId];
    const now = new Date().toISOString();

    // Check if this is a new word (before updating status)
    const wasNewWord = wordProgress.status === WORD_STATUS.UNSEEN;

    // Update word status and counters
    if (wasNewWord) {
        wordProgress.status = WORD_STATUS.SEEN;
        wordProgress.first_seen_date = now;
        wordProgress.times_seen = 1;

        // Update batch progress
        progress.batchProgress[batchId].words_seen += 1;
    } else {
        // Word was seen before, just increment counter
        wordProgress.times_seen += 1;
    }

    wordProgress.last_seen_date = now;

    // Update batch status if needed
    if (progress.batchProgress[batchId].status === BATCH_STATUS.LOCKED) {
        progress.batchProgress[batchId].status = BATCH_STATUS.IN_PROGRESS;
        progress.batchProgress[batchId].started_date = now;
    }

    // Update overall stats
    const uniqueWordsSeen = Object.values(progress.wordProgress).filter(
        wp => wp.status !== WORD_STATUS.UNSEEN
    ).length;
    progress.stats.total_words_seen = uniqueWordsSeen;
    progress.stats.last_study_date = now;

    return { progress, wasNewWord };
};

// TODO PHASE 5: Implement confidence update when quiz is added
/**
 * Update word confidence after quiz answer
 * @param {Object} progress - User progress object
 * @param {number} wordId - Word ID
 * @param {boolean} correct - Whether answer was correct
 * @returns {Object} - Updated progress
 */
const updateConfidence = (progress, wordId, correct) => {
    // TODO PHASE 5: Implement confidence algorithm
    // Current: Placeholder for future quiz integration
    //
    // Algorithm:
    // - Correct answer: +15 to +20 points (diminishing returns near 100)
    // - Wrong answer: -20 points
    // - Status updates:
    //   * < 30%: Keep in "learning"
    //   * 30-89%: "learning"
    //   * 90-100%: "mastered"
    //
    // Future enhancement (Phase 7):
    // - Time-based spaced repetition
    // - Leitner system or SM-2 algorithm
    // - Calculate next review date based on confidence and time

    const wordProgress = progress.wordProgress[wordId];
    if (!wordProgress) return progress;

    if (correct) {
        const increase = Math.max(10, (100 - wordProgress.confidence) * 0.15);
        wordProgress.confidence = Math.min(100, wordProgress.confidence + increase);
        wordProgress.times_correct += 1;
    } else {
        wordProgress.confidence = Math.max(0, wordProgress.confidence - 20);
        wordProgress.times_incorrect += 1;
    }

    // Update status based on confidence
    if (wordProgress.confidence >= 90) {
        wordProgress.status = WORD_STATUS.MASTERED;
        progress.stats.total_words_mastered += 1;
    } else if (wordProgress.confidence >= 30) {
        wordProgress.status = WORD_STATUS.LEARNING;
    }

    wordProgress.times_tested += 1;
    wordProgress.last_test_date = new Date().toISOString();

    return progress;
};

// NOTE: Future spaced repetition system (Phase 7)
/**
 * Calculate next review date based on confidence and time
 * This will replace the simple word-count based testing
 * 
 * Future implementation will use:
 * - Leitner system or SuperMemo 2 (SM-2) algorithm
 * - Time intervals based on confidence:
 *   * 0-29% confidence: Review within 1 hour
 *   * 30-59%: Review next day
 *   * 60-89%: Review in 3 days
 *   * 90-100%: Review in 1 week, then 2 weeks, then 1 month
 * 
 * @param {number} confidence - Current confidence (0-100)
 * @param {string} lastReviewDate - ISO date string of last review
 * @param {number} repetitions - Number of successful reviews
 * @returns {Date} - Next review date
 */
const calculateNextReviewDate = (confidence, lastReviewDate, repetitions) => {
    // TODO PHASE 7: Implement spaced repetition algorithm
    return null;
};

// ==================== MAIN COMPONENT ====================

const LearningFlow = () => {
    // ==================== STATE ====================

    // Batch & Words
    const [currentBatchId] = useState(1); // Fixed to batch 1 for MVP
    const [words, setWords] = useState([]);
    const [batchMetadata, setBatchMetadata] = useState(null);

    // Navigation
    const [currentWordIndex, setCurrentWordIndex] = useState(0);
    const [wordsShownCount, setWordsShownCount] = useState(0);

    // Progress
    const [userProgress, setUserProgress] = useState(null);
    const [sessionStats, setSessionStats] = useState({
        words_seen_this_session: 0,
        session_start: new Date().toISOString()
    });

    // UI State
    const [isLoading, setIsLoading] = useState(true);
    const [error, setError] = useState(null);
    const [showProgressDashboard, setShowProgressDashboard] = useState(false);

    // Phase 5: Quiz state
    const [currentMode, setCurrentMode] = useState('learning'); // 'learning' | 'quiz' | 'feedback' | 'review' | 'batch_complete' | 'batch_test' | 'batch_test_results' | 'review_session'
    const [testingQueue, setTestingQueue] = useState([]); // Word IDs waiting to be tested
    const [wordsSinceLastTest, setWordsSinceLastTest] = useState(0);
    const [currentQuizQuestion, setCurrentQuizQuestion] = useState(null);
    const [lastQuizAnswer, setLastQuizAnswer] = useState(null);
    const [reviewingWordId, setReviewingWordId] = useState(null);
    const [currentStreak, setCurrentStreak] = useState(0);
    const [quizStats, setQuizStats] = useState({
        questions_asked: 0,
        correct_answers: 0,
        incorrect_answers: 0
    });

    // Phase 5B: Batch completion and testing
    const [batchTestWords, setBatchTestWords] = useState([]); // Word IDs for batch test
    const [batchTestIndex, setBatchTestIndex] = useState(0);
    const [batchTestResults, setBatchTestResults] = useState([]); // Array of {wordId, correct}

    // Phase 5B: Review session
    const [reviewSessionWords, setReviewSessionWords] = useState([]); // Word IDs to review
    const [reviewSessionIndex, setReviewSessionIndex] = useState(0);

    // ==================== EFFECTS ====================

    /**
     * Load batch data and user progress on mount
     */
    useEffect(() => {
        const loadBatchData = async () => {
            try {
                setIsLoading(true);

                // Load batch metadata
                const metadata = getBatchMetadata(currentBatchId);
                if (!metadata) {
                    throw new Error(`Batch ${currentBatchId} not found`);
                }
                setBatchMetadata(metadata);

                // Load batch words
                const batch = await loadBatch(currentBatchId);
                if (!batch || !batch.words || batch.words.length === 0) {
                    throw new Error('Failed to load batch data or batch is empty');
                }

                setWords(batch.words);

                // Load user progress
                const progress = loadProgress();
                setUserProgress(progress);

                // Initialize batch progress if needed
                if (!progress.batchProgress || !progress.batchProgress[currentBatchId]) {
                    const updated = { ...progress };
                    ensureBatchProgress(updated, currentBatchId);
                    saveProgress(updated);
                    setUserProgress(updated);
                }

                setIsLoading(false);
            } catch (err) {
                console.error('Error loading batch:', err);
                setError(err.message || 'Failed to load learning content. Please refresh the page.');
                setIsLoading(false);
            }
        };

        loadBatchData();
    }, [currentBatchId]);

    /**
     * Save progress whenever it changes
     */
    useEffect(() => {
        if (userProgress) {
            saveProgress(userProgress);
        }
    }, [userProgress]);

    // ==================== HANDLERS ====================

    /**
     * Handle "Mark as Seen" button click
     * Updates progress and session stats
     */
    const handleMarkWordSeen = (wordId) => {
        // Check BEFORE updating if this word is currently unseen
        const wasUnseen = !userProgress?.wordProgress?.[wordId] ||
            userProgress.wordProgress[wordId].status === WORD_STATUS.UNSEEN;

        setUserProgress(prevProgress => {
            const updated = { ...prevProgress };
            const result = markWordAsSeen(updated, wordId, currentBatchId);
            return result.progress;
        });

        setWordsShownCount(prev => prev + 1);

        // Only increment session counter for NEW words (not revisits)
        if (wasUnseen) {
            setSessionStats(prev => ({
                ...prev,
                words_seen_this_session: prev.words_seen_this_session + 1
            }));
        }

        // Phase 5: Add word to testing queue and check if should trigger quiz
        setTestingQueue(prev => {
            if (!prev.includes(wordId)) {
                return [...prev, wordId];
            }
            return prev;
        });

        setWordsSinceLastTest(prev => prev + 1);

        // Check if should trigger quiz (every 5 words)
        if ((wordsSinceLastTest + 1) % WORDS_BEFORE_TEST === 0 && testingQueue.length > 0) {
            // Time to quiz on the first word in queue - DON'T advance to next word
            triggerQuiz(testingQueue[0]);
        } else {
            // Continue learning - advance to next word
            handleNext();
        }
    };

    /**
     * Navigate to next word
     */
    const handleNext = () => {
        if (currentWordIndex < words.length - 1) {
            setCurrentWordIndex(prev => prev + 1);
            window.scrollTo({ top: 0, behavior: 'smooth' });
        } else {
            // Reached end of batch
            handleBatchComplete();
        }
    };

    /**
     * Navigate to previous word
     */
    const handlePrevious = () => {
        if (currentWordIndex > 0) {
            setCurrentWordIndex(prev => prev - 1);
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
    };

    /**
     * Handle batch completion
     * Phase 5B: Show batch complete screen
     */
    const handleBatchComplete = () => {
        setCurrentMode('batch_complete');
    };

    /**
     * Calculate batch statistics
     * Phase 5B
     */
    const calculateBatchStatistics = () => {
        if (!userProgress || !words) return {
            total_words: 0,
            words_seen: 0,
            words_mastered: 0,
            words_learning: 0,
            weak_words: 0,
            average_confidence: 0,
            quiz_accuracy: 0
        };

        const batchWords = words;
        const totalWords = batchWords.length;

        let wordsSeen = 0;
        let wordsMastered = 0;
        let wordsLearning = 0;
        let weakWords = 0;
        let totalConfidence = 0;

        batchWords.forEach(word => {
            const progress = userProgress.wordProgress?.[word.id];
            if (progress) {
                if (progress.status !== WORD_STATUS.UNSEEN) {
                    wordsSeen++;
                }
                if (progress.status === WORD_STATUS.MASTERED) {
                    wordsMastered++;
                }
                if (progress.status === WORD_STATUS.LEARNING) {
                    wordsLearning++;
                }
                if (progress.confidence < 60 && progress.status !== WORD_STATUS.UNSEEN) {
                    weakWords++;
                }
                totalConfidence += progress.confidence || 0;
            }
        });

        const averageConfidence = wordsSeen > 0 ? totalConfidence / wordsSeen : 0;
        const quizAccuracy = quizStats.questions_asked > 0
            ? Math.round((quizStats.correct_answers / quizStats.questions_asked) * 100)
            : 0;

        return {
            total_words: totalWords,
            words_seen: wordsSeen,
            words_mastered: wordsMastered,
            words_learning: wordsLearning,
            weak_words: weakWords,
            average_confidence: averageConfidence,
            quiz_accuracy: quizAccuracy
        };
    };

    /**
     * Get weak words (confidence < 60%)
     * Phase 5B
     */
    const getWeakWords = () => {
        if (!userProgress || !words) return [];

        return words.filter(word => {
            const progress = userProgress.wordProgress?.[word.id];
            return progress &&
                progress.confidence < 60 &&
                progress.status !== WORD_STATUS.UNSEEN;
        });
    };

    /**
     * Start review session for weak words
     * Phase 5B
     */
    const handleStartReviewSession = () => {
        const weakWords = getWeakWords();

        if (weakWords.length === 0) {
            alert('No weak words to review! Great job!');
            return;
        }

        setReviewSessionWords(weakWords.map(w => w.id));
        setReviewSessionIndex(0);
        setCurrentMode('review_session');
    };

    /**
     * Start comprehensive batch test
     * Phase 5B
     */
    const handleStartBatchTest = () => {
        const testWords = words.filter(word => {
            const progress = userProgress.wordProgress?.[word.id];
            return progress && progress.status !== WORD_STATUS.UNSEEN;
        });

        if (testWords.length === 0) {
            alert('No words to test yet!');
            return;
        }

        setBatchTestWords(testWords.map(w => w.id));
        setBatchTestIndex(0);
        setBatchTestResults([]);
        setCurrentMode('batch_test');

        // Generate first question
        generateBatchTestQuestion(testWords[0].id);
    };

    /**
     * Generate question for batch test
     * Phase 5B
     */
    const generateBatchTestQuestion = (wordId) => {
        const word = words.find(w => w.id === wordId);
        if (!word) return;

        // Use adaptive question type based on confidence
        const wordProgress = userProgress?.wordProgress?.[wordId];
        const confidence = wordProgress?.confidence || 0;

        let questionType;
        if (confidence < 50) {
            questionType = QUESTION_TYPES.TRANSLATION_MATCH;
        } else {
            questionType = Math.random() > 0.5
                ? QUESTION_TYPES.REVERSE_TRANSLATION
                : QUESTION_TYPES.SENTENCE_COMPLETION;
        }

        const question = generateQuestion(word, words, questionType);
        setCurrentQuizQuestion(question);
    };

    /**
     * Show batch test results
     * Phase 5B
     */
    const showBatchTestResults = () => {
        const totalQuestions = batchTestResults.length;
        const correctAnswers = batchTestResults.filter(r => r.correct).length;
        const accuracy = Math.round((correctAnswers / totalQuestions) * 100);

        // Check if passed
        const passed = accuracy >= 90;

        // Update batch progress
        setUserProgress(prevProgress => {
            const updated = { ...prevProgress };
            ensureBatchProgress(updated, currentBatchId);

            updated.batchProgress[currentBatchId].test_taken = true;
            updated.batchProgress[currentBatchId].test_score = accuracy;
            updated.batchProgress[currentBatchId].test_date = new Date().toISOString();

            if (passed) {
                updated.batchProgress[currentBatchId].status = BATCH_STATUS.COMPLETED;
                updated.batchProgress[currentBatchId].completed_date = new Date().toISOString();
            }

            return updated;
        });

        // Show results screen
        setCurrentMode('batch_test_results');
    };

    /**
     * Reset progress (for testing/debugging)
     * Remove this in production
     */
    const handleResetProgress = () => {
        if (window.confirm('Reset all progress? This cannot be undone.')) {
            localStorage.removeItem(STORAGE_KEY);
            setCurrentWordIndex(0);
            setWordsShownCount(0);
            setCurrentMode('learning');
            setTestingQueue([]);
            setWordsSinceLastTest(0);
            setCurrentQuizQuestion(null);
            setLastQuizAnswer(null);
            setReviewingWordId(null);
            setCurrentStreak(0);
            setQuizStats({
                questions_asked: 0,
                correct_answers: 0,
                incorrect_answers: 0
            });
            setBatchTestWords([]);
            setBatchTestIndex(0);
            setBatchTestResults([]);
            setReviewSessionWords([]);
            setReviewSessionIndex(0);
            window.location.reload();
        }
    };

    // ==================== PHASE 5: QUIZ HANDLERS ====================

    /**
     * Trigger a quiz on a specific word
     */
    const triggerQuiz = (wordId) => {
        const wordToTest = words.find(w => w.id === wordId);

        if (!wordToTest) {
            console.error('Word not found:', wordId);
            handleNext();
            return;
        }

        // Generate question
        const question = generateQuestion(
            wordToTest,
            words,
            QUESTION_TYPES.TRANSLATION_MATCH
        );

        if (!question) {
            console.error('Failed to generate question');
            handleNext();
            return;
        }

        setCurrentQuizQuestion(question);
        setCurrentMode('quiz');
        setWordsSinceLastTest(0);
    };

    /**
     * Handle answer from Quiz component
     * Updated for Phase 5B to handle batch test
     */
    const handleQuizAnswer = (isCorrect, selectedIndex) => {
        // Update confidence (always do this)
        setUserProgress(prevProgress => {
            const updated = { ...prevProgress };
            updateConfidence(updated, currentQuizQuestion.word_id, isCorrect);
            return updated;
        });

        // Update stats
        setQuizStats(prev => ({
            questions_asked: prev.questions_asked + 1,
            correct_answers: isCorrect ? prev.correct_answers + 1 : prev.correct_answers,
            incorrect_answers: isCorrect ? prev.incorrect_answers : prev.incorrect_answers + 1
        }));

        // Update streak
        if (isCorrect) {
            setCurrentStreak(prev => prev + 1);
        } else {
            setCurrentStreak(0);
        }

        // Handle based on current mode
        if (currentMode === 'batch_test') {
            // Batch test mode - track result
            setBatchTestResults(prev => [
                ...prev,
                { wordId: currentQuizQuestion.word_id, correct: isCorrect }
            ]);

            // Move to next question or show results
            if (batchTestIndex + 1 < batchTestWords.length) {
                // More questions - go to next
                setBatchTestIndex(prev => prev + 1);
                setTimeout(() => {
                    generateBatchTestQuestion(batchTestWords[batchTestIndex + 1]);
                }, 1000); // Brief pause between questions
            } else {
                // Test complete - show results
                showBatchTestResults();
            }
        } else {
            // Regular quiz mode - show feedback
            setTestingQueue(prev => prev.slice(1));

            setLastQuizAnswer({
                question: currentQuizQuestion,
                selected_index: selectedIndex,
                is_correct: isCorrect,
                streak: isCorrect ? currentStreak + 1 : 0
            });

            setCurrentMode('feedback');
        }
    };

    /**
     * Handle "Review Word" from QuizFeedback
     */
    const handleReviewWord = () => {
        setReviewingWordId(lastQuizAnswer.question.word_id);
        setCurrentMode('review');
    };

    /**
     * Handle "Retry Question" from QuizFeedback
     */
    const handleRetryQuestion = () => {
        const wordId = lastQuizAnswer.question.word_id;
        const wordToTest = words.find(w => w.id === wordId);

        // Generate different question type
        const newQuestion = generateQuestion(
            wordToTest,
            words,
            QUESTION_TYPES.SENTENCE_COMPLETION
        );

        if (newQuestion) {
            setCurrentQuizQuestion(newQuestion);
            setCurrentMode('quiz');
        } else {
            handleContinueFromFeedback();
        }
    };

    /**
     * Handle "Continue" from QuizFeedback
     */
    const handleContinueFromFeedback = () => {
        setCurrentMode('learning');
        setLastQuizAnswer(null);
        setCurrentQuizQuestion(null);
        handleNext();
    };

    /**
     * Handle "Back" from review mode
     */
    const handleBackFromReview = () => {
        setReviewingWordId(null);
        setCurrentMode('feedback');
    };

    // ==================== RENDER ====================

    // Loading State
    if (isLoading) {
        return (
            <div className="min-h-screen bg-background flex items-center justify-center p-4">
                <div className="text-center">
                    <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary mx-auto mb-4"></div>
                    <p className="text-gray-600">Loading batch {currentBatchId}...</p>
                </div>
            </div>
        );
    }

    // Error State
    if (error) {
        return (
            <div className="min-h-screen bg-background flex items-center justify-center p-4">
                <div className="bg-white rounded-2xl shadow-lg p-6 max-w-md">
                    <div className="text-red-500 text-center mb-4">
                        <svg className="w-16 h-16 mx-auto mb-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                        <h2 className="text-xl font-bold mb-2">Error</h2>
                        <p className="text-gray-600">{error}</p>
                    </div>
                    <button
                        onClick={() => window.location.reload()}
                        className="w-full bg-primary text-white py-3 rounded-xl font-semibold active:scale-95 transition"
                    >
                        Refresh Page
                    </button>
                </div>
            </div>
        );
    }

    // Empty State
    if (!words || words.length === 0) {
        return (
            <div className="min-h-screen bg-background flex items-center justify-center p-4">
                <div className="text-center">
                    <p className="text-gray-600 mb-4">No words found in this batch.</p>
                    <button
                        onClick={() => window.location.reload()}
                        className="bg-primary text-white py-2 px-4 rounded-lg active:scale-95 transition"
                    >
                        Reload
                    </button>
                </div>
            </div>
        );
    }

    const currentWord = words[currentWordIndex];
    const currentWordProgress = userProgress?.wordProgress?.[currentWord.id];

    return (
        <div className="min-h-screen bg-background">
            {/* ==================== HEADER ==================== */}
            <header className="bg-white shadow-sm sticky top-0 z-10">
                <div className="px-4 py-4">
                    {/* Title & Stats Toggle */}
                    <div className="flex items-center justify-between mb-3">
                        <div>
                            <h1 className="text-lg font-bold text-gray-900">
                                {batchMetadata?.title || `Batch ${currentBatchId}`}
                            </h1>
                            <p className="text-sm text-gray-600">
                                Word {currentWordIndex + 1} of {words.length}
                            </p>
                        </div>

                        <button
                            onClick={() => setShowProgressDashboard(!showProgressDashboard)}
                            className="p-2 hover:bg-gray-100 rounded-lg active:scale-95 transition"
                            aria-label="Toggle progress dashboard"
                        >
                            <svg className="w-6 h-6 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
                            </svg>
                        </button>
                    </div>

                    {/* Progress Bar */}
                    <div className="w-full bg-gray-200 rounded-full h-2">
                        <div
                            className="bg-primary h-2 rounded-full transition-all duration-300 ease-out"
                            style={{ width: `${((currentWordIndex + 1) / words.length) * 100}%` }}
                        />
                    </div>
                </div>
            </header>

            {/* ==================== PROGRESS DASHBOARD ==================== */}
            {showProgressDashboard && (
                <div className="bg-blue-50 border-b border-blue-100 px-4 py-4">
                    <div className="flex items-center justify-between mb-3">
                        <h3 className="text-sm font-semibold text-gray-900">Session Progress</h3>
                        {/* Debug: Reset button (remove in production) */}
                        <button
                            onClick={handleResetProgress}
                            className="text-xs text-red-600 underline"
                        >
                            Reset Progress
                        </button>
                    </div>

                    <div className="grid grid-cols-3 gap-3 text-center mb-3">
                        <div className="bg-white rounded-lg p-3">
                            <p className="text-xs text-gray-600 mb-1">Words Seen</p>
                            <p className="text-2xl font-bold text-primary">
                                {sessionStats.words_seen_this_session}
                            </p>
                        </div>
                        <div className="bg-white rounded-lg p-3">
                            <p className="text-xs text-gray-600 mb-1">This Word</p>
                            <p className="text-2xl font-bold text-secondary">
                                {currentWordProgress?.times_seen || 0}×
                            </p>
                        </div>
                        <div className="bg-white rounded-lg p-3">
                            <p className="text-xs text-gray-600 mb-1">Status</p>
                            <p className="text-xs font-semibold text-gray-700">
                                {currentWordProgress?.status || 'unseen'}
                            </p>
                        </div>
                    </div>

                    {/* TODO PHASE 5: Add quiz statistics */}
                    {/* <div className="text-xs text-gray-600 text-center">
            Tested: {sessionStats.words_tested_this_session} | 
            Correct: {sessionStats.correct_this_session}
          </div> */}
                </div>
            )}

            {/* ==================== MAIN CONTENT ==================== */}
            <main className="p-4 pb-20">
                {/* MODE 1: LEARNING - Show WordCard */}
                {currentMode === 'learning' && (
                    <WordCard
                        word={currentWord}
                        onNext={handleNext}
                        onPrevious={handlePrevious}
                        onMarkSeen={handleMarkWordSeen}
                        isFirstWord={currentWordIndex === 0}
                        isLastWord={currentWordIndex === words.length - 1}
                        currentIndex={currentWordIndex}
                        totalWords={words.length}
                    />
                )}

                {/* MODE 2: QUIZ - Show Quiz component */}
                {currentMode === 'quiz' && currentQuizQuestion && (
                    <Quiz
                        question={currentQuizQuestion}
                        onAnswer={handleQuizAnswer}
                        showSkipButton={false}
                    />
                )}

                {/* MODE 3: FEEDBACK - Show QuizFeedback */}
                {currentMode === 'feedback' && lastQuizAnswer && (
                    <QuizFeedback
                        type={lastQuizAnswer.is_correct ? 'single_correct' : 'single_incorrect'}
                        question={lastQuizAnswer.question}
                        userAnswer={lastQuizAnswer}
                        onReviewWord={handleReviewWord}
                        onRetryQuestion={handleRetryQuestion}
                        onContinue={handleContinueFromFeedback}
                        showEncouragement={true}
                        showStatistics={true}
                    />
                )}

                {/* MODE 4: REVIEW - Show WordCard again */}
                {currentMode === 'review' && (
                    <div>
                        <button
                            onClick={handleBackFromReview}
                            className="mb-4 flex items-center gap-2 text-primary font-medium active:scale-95 transition"
                        >
                            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
                            </svg>
                            Back to Feedback
                        </button>
                        <WordCard
                            word={words.find(w => w.id === reviewingWordId)}
                            onNext={() => { }}
                            onPrevious={() => { }}
                            onMarkSeen={() => { }}
                            isFirstWord={true}
                            isLastWord={true}
                            currentIndex={0}
                            totalWords={1}
                        />
                    </div>
                )}
            </main>

            {/* TODO PHASE 5: Add quiz indicator */}
            {/* Show indicator when quiz is approaching */}
            {/* {currentMode === 'learning' && wordsShownCount % WORDS_BEFORE_TEST !== 0 && (
        <div className="fixed bottom-4 left-4 right-4 bg-amber-100 border border-amber-300 rounded-lg p-3 text-center">
          <p className="text-sm text-amber-800">
            {WORDS_BEFORE_TEST - (wordsShownCount % WORDS_BEFORE_TEST)} more words until quiz!
          </p>
        </div>
      )} */}
        </div>
    );
};

export default LearningFlow;

