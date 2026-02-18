/**
 * sessionBuilder.js
 *
 * Builds the session queue for a study session.
 *
 * RESPONSIBILITIES:
 * 1. Determine which words are due for review
 * 2. Determine how many new words to introduce
 * 3. Build the interleaved question queue
 * 4. Enforce minimum gap between same-word questions
 * 5. Respect question ordering rules (Q1 before Q2 before Q3)
 *
 * OUTPUT: A session object the UI can consume directly.
 */

import {
    SESSION_DEFAULTS,
    INTERLEAVING,
    CARD_STATE,
} from '../data/progressSchema';

import {
    getDueWords,
    getNewWords,
    getLearningWords,
    getNow,
} from '../data/progressManager';

import {
    getQuestionsForWord,
    getQuestionOrder,
} from './qualityCalculator';

// ─────────────────────────────────────────────
// MAIN EXPORT: buildSession
// ─────────────────────────────────────────────

/**
 * Build a complete session object for today's study session.
 *
 * @param {Object} progress - Full progress object from localStorage
 * @param {Object} options - Session options
 * @param {number} options.newCardsLimit - Override default new cards per day
 * @param {boolean} options.reviewsOnly - Skip new cards
 * @param {boolean} options.newOnly - Skip reviews
 * @returns {Object} Session object with question queue and metadata
 */
export const buildSession = (progress, options = {}) => {
    const now = getNow();

    const newCardsLimit = options.newCardsLimit
        ?? progress.settings?.new_cards_per_day
        ?? SESSION_DEFAULTS.new_cards_per_day;

    // ── 1. COLLECT WORDS FOR THIS SESSION ──────────────────────

    // Overdue and due reviews (highest priority)
    const dueWords = options.newOnly ? [] : getDueWords(progress, now);

    // Learning/relearning words from previous sessions
    // (already scheduled with specific due times)
    const learningWords = getLearningWords(progress).filter(w => {
        if (!w.due_date) return false;
        return new Date(w.due_date) <= now;
    });

    // New words (limited by daily cap)
    const allNewWords = options.reviewsOnly ? [] : getNewWords(progress);
    const newWords = allNewWords.slice(0, newCardsLimit);

    // Combine review words (due + learning)
    // Deduplicate by word_id (learning words might overlap with due)
    const reviewWords = deduplicateById([...dueWords, ...learningWords]);

    // ── 2. BUILD QUESTION POOL FOR REVIEWS ──────────────────────

    const reviewQuestionPool = buildReviewQuestionPool(reviewWords);

    // ── 3. INTERLEAVE REVIEW QUESTIONS ──────────────────────────

    const interleavedReviews = interleaveQuestions(
        reviewQuestionPool,
        reviewWords.length
    );

    // ── 4. CALCULATE SESSION METADATA ──────────────────────────

    const totalQuestions = interleavedReviews.length;
    const estimatedMinutes = estimateSessionTime(
        reviewWords.length,
        newWords.length
    );

    // ── 5. RETURN SESSION OBJECT ────────────────────────────────

    return {
        session_id: generateSessionId(),
        created_at: now.toISOString(),

        // Words in this session
        review_words: reviewWords.map(w => w.word_id),
        new_words: newWords.map(w => w.word_id),

        // The actual question queue (interleaved reviews)
        // New words are handled separately (sequential learning)
        question_queue: interleavedReviews,

        // Per-word question counts (for progress tracking)
        questions_per_word: buildQuestionsPerWordMap(reviewWords),

        // Session metadata
        meta: {
            total_review_words: reviewWords.length,
            total_new_words: newWords.length,
            total_questions: totalQuestions,
            estimated_minutes: estimatedMinutes,
            overdue_count: countOverdue(dueWords, now),
            new_available: allNewWords.length,
            new_limit: newCardsLimit,
        },

        // Runtime state (UI uses this to track progress)
        state: {
            current_question_index: 0,
            completed_questions: [],
            word_results: {}, // wordId → array of question results
            word_quality: {}, // wordId → final quality (set when all questions done)
            started_at: null,
            completed_at: null,
        },
    };
};

// ─────────────────────────────────────────────
// QUESTION POOL BUILDER
// ─────────────────────────────────────────────

/**
 * Build a flat pool of question objects for all review words.
 * Each question knows which word it belongs to and its index
 * within that word's question set.
 *
 * @param {Array} reviewWords - Array of word progress objects
 * @returns {Array} Array of question descriptor objects
 */
const buildReviewQuestionPool = (reviewWords) => {
    const pool = [];

    reviewWords.forEach(wordProgress => {
        const count = getQuestionsForWord(wordProgress);
        const types = getQuestionOrder(count);

        types.forEach((questionType, questionIndex) => {
            pool.push({
                word_id: wordProgress.word_id,
                question_index: questionIndex,     // 0-based within this word
                question_type: questionType,      // What type of question to generate
                total_for_word: count,             // Total questions for this word
            });
        });
    });

    return pool;
};

/**
 * Build a map of word_id → total question count for UI progress tracking.
 */
const buildQuestionsPerWordMap = (reviewWords) => {
    const map = {};
    reviewWords.forEach(w => {
        map[w.word_id] = getQuestionsForWord(w);
    });
    return map;
};

// ─────────────────────────────────────────────
// INTERLEAVING ALGORITHM
// ─────────────────────────────────────────────

/**
 * Interleave questions from multiple words so that:
 * 1. Same word never appears consecutively
 * 2. Minimum gap enforced between questions for same word
 * 3. Q2 only appears after Q1 is placed (etc.)
 * 4. Order within constraint is randomized
 *
 * Algorithm:
 * - Use a queue of "available" questions (Q index 0 for all words to start)
 * - At each position, pick randomly from available questions that:
 *   a) Have all previous questions already placed
 *   b) Respect minimum gap from last appearance of same word
 * - After placing, unlock next question for that word (Q index + 1)
 *
 * @param {Array} questionPool - Array of question descriptors
 * @param {number} wordCount - Number of unique words
 * @returns {Array} Ordered array of question descriptors
 */
const interleaveQuestions = (questionPool, wordCount) => {
    if (!questionPool.length) return [];

    // Minimum gap: how many questions must separate same-word questions
    const minGap = Math.max(
        INTERLEAVING.MIN_GAP_ABSOLUTE,
        Math.floor(wordCount * INTERLEAVING.MIN_GAP_FACTOR)
    );

    // Track which questions are "available" (Q0 for all words)
    // Available = Q(n) where Q(n-1) has already been placed
    const nextAvailableIndex = {}; // wordId → next question index to unlock
    questionPool.forEach(q => {
        if (nextAvailableIndex[q.word_id] === undefined) {
            nextAvailableIndex[q.word_id] = 0; // Start with Q0 available
        }
    });

    // Track last position where each word appeared
    const lastPositionByWord = {}; // wordId → last placed position

    const placed = [];
    const pending = [...questionPool]; // All questions waiting to be placed

    let safetyCounter = 0;
    const maxIterations = questionPool.length * questionPool.length;

    while (placed.length < questionPool.length && safetyCounter < maxIterations) {
        safetyCounter++;
        const currentPosition = placed.length;

        // Find all questions that are currently available
        const available = pending.filter(q => {
            // Q must be at the currently unlocked index for this word
            if (q.question_index !== nextAvailableIndex[q.word_id]) return false;

            // Must respect minimum gap
            const lastPos = lastPositionByWord[q.word_id];
            if (lastPos !== undefined && currentPosition - lastPos < minGap) return false;

            return true;
        });

        if (!available.length) {
            // No available questions that respect gap constraint
            // Relax constraint: pick from pending that only satisfy ordering
            const relaxed = pending.filter(q =>
                q.question_index === nextAvailableIndex[q.word_id]
            );

            if (!relaxed.length) break; // Something is wrong

            // Pick randomly from relaxed set
            const pick = relaxed[Math.floor(Math.random() * relaxed.length)];
            placeQuestion(pick, placed, pending, lastPositionByWord, nextAvailableIndex);

        } else {
            // Pick randomly from fully-valid available set
            const pick = available[Math.floor(Math.random() * available.length)];
            placeQuestion(pick, placed, pending, lastPositionByWord, nextAvailableIndex);
        }
    }

    // If any questions remain unplaced (shouldn't happen), append them
    if (pending.length > 0) {
        console.warn('[sessionBuilder] Some questions unplaced:', pending.length);
        placed.push(...pending);
    }

    return placed;
};

/**
 * Place a question: move from pending to placed, update tracking.
 */
const placeQuestion = (question, placed, pending, lastPositionByWord, nextAvailableIndex) => {
    placed.push(question);
    pending.splice(pending.indexOf(question), 1);
    lastPositionByWord[question.word_id] = placed.length - 1;
    nextAvailableIndex[question.word_id] = question.question_index + 1;
};

// ─────────────────────────────────────────────
// SESSION PROGRESS HELPERS
// ─────────────────────────────────────────────

/**
 * Record the result of a single question answer in the session state.
 * Called by the UI after each question is answered.
 *
 * @param {Object} session - Current session object
 * @param {number} wordId - Word that was just answered
 * @param {boolean} correct - Whether answer was correct
 * @param {number} time_ms - Time taken in milliseconds
 * @param {string} question_type - Type of question asked
 * @returns {Object} Updated session state
 */
export const recordQuestionResult = (session, wordId, correct, time_ms, question_type) => {
    const updated = { ...session };
    updated.state = { ...session.state };

    // Add to completed questions
    const result = {
        word_id: wordId,
        correct,
        time_ms,
        question_type,
        timestamp: getNow().toISOString(),
    };

    updated.state.completed_questions = [
        ...session.state.completed_questions,
        result,
    ];

    // Add to word-specific results
    const wordResults = { ...session.state.word_results };
    wordResults[wordId] = [...(wordResults[wordId] || []), result];
    updated.state.word_results = wordResults;

    // Advance question index
    updated.state.current_question_index = session.state.current_question_index + 1;

    return updated;
};

/**
 * Check if all questions for a specific word are complete.
 * If yes, the session should now calculate quality and update scheduling.
 *
 * @param {Object} session - Current session object
 * @param {number} wordId - Word to check
 * @returns {boolean}
 */
export const isWordComplete = (session, wordId) => {
    const expectedCount = session.questions_per_word[wordId] || 0;
    const completedCount = (session.state.word_results[wordId] || []).length;
    return completedCount >= expectedCount;
};

/**
 * Check if the entire review session is complete.
 *
 * @param {Object} session - Current session object
 * @returns {boolean}
 */
export const isSessionComplete = (session) => {
    return session.state.current_question_index >= session.question_queue.length;
};

/**
 * Get remaining questions in the session queue.
 *
 * @param {Object} session
 * @returns {Array} Remaining question descriptors
 */
export const getRemainingQuestions = (session) => {
    return session.question_queue.slice(session.state.current_question_index);
};

// ─────────────────────────────────────────────
// SESSION STATISTICS
// ─────────────────────────────────────────────

/**
 * Calculate session statistics after completion.
 * Used for the session summary screen.
 *
 * @param {Object} session - Completed session object
 * @returns {Object} Session statistics
 */
export const calculateSessionStats = (session) => {
    const { completed_questions, word_quality } = session.state;

    const totalQuestions = completed_questions.length;
    const correctAnswers = completed_questions.filter(q => q.correct).length;
    const accuracy = totalQuestions > 0
        ? Math.round((correctAnswers / totalQuestions) * 100)
        : 0;

    const qualityValues = Object.values(word_quality);
    const qualityCounts = {
        again: qualityValues.filter(q => q === 'again').length,
        hard: qualityValues.filter(q => q === 'hard').length,
        good: qualityValues.filter(q => q === 'good').length,
        easy: qualityValues.filter(q => q === 'easy').length,
    };

    const avgTime = totalQuestions > 0
        ? completed_questions.reduce((sum, q) => sum + (q.time_ms || 0), 0) / totalQuestions
        : 0;

    const startTime = session.state.started_at
        ? new Date(session.state.started_at)
        : null;
    const endTime = session.state.completed_at
        ? new Date(session.state.completed_at)
        : getNow();
    const durationMinutes = startTime
        ? Math.round((endTime - startTime) / 60000)
        : null;

    return {
        total_questions: totalQuestions,
        correct_answers: correctAnswers,
        accuracy,
        quality_breakdown: qualityCounts,
        words_reviewed: session.review_words.length,
        new_words_learned: session.new_words.length,
        avg_time_ms: Math.round(avgTime),
        duration_minutes: durationMinutes,
    };
};

// ─────────────────────────────────────────────
// PRIVATE UTILITIES
// ─────────────────────────────────────────────

const deduplicateById = (words) => {
    const seen = new Set();
    return words.filter(w => {
        if (seen.has(w.word_id)) return false;
        seen.add(w.word_id);
        return true;
    });
};

const countOverdue = (dueWords, now) => {
    return dueWords.filter(w =>
        w.due_date && new Date(w.due_date) < now
    ).length;
};

const estimateSessionTime = (reviewCount, newCount) => {
    // Rough estimate: 2 min per review word, 3 min per new word
    return Math.round(reviewCount * 2 + newCount * 3);
};

const generateSessionId = () => {
    return `session_${Date.now()}_${Math.random().toString(36).slice(2, 7)}`;
};
