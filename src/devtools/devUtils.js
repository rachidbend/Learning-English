/**
 * devUtils.js
 *
 * Core utilities for dev mode functionality.
 * These functions manipulate progress and time for testing.
 */

import {
    loadProgress,
    saveProgress,
    getNow,
    addDays,
    ensureWordProgress,
    exportProgress,
    importProgress,
} from '../data/progressManager';

import {
    createWordProgress,
    CARD_STATE,
    EASE_FACTOR,
} from '../data/progressSchema';

// ═══════════════════════════════════════════
// TIME SIMULATION
// ═══════════════════════════════════════════

const TIME_OFFSET_KEY = 'dev_time_offset_days';

/**
 * Get current time offset in days.
 */
export const getTimeOffset = () => {
    try {
        const offset = localStorage.getItem(TIME_OFFSET_KEY);
        return offset ? parseFloat(offset) : 0;
    } catch (e) {
        return 0;
    }
};

/**
 * Set time offset in days.
 * All scheduling calculations will use this offset via getNow().
 */
export const setTimeOffset = (days) => {
    try {
        localStorage.setItem(TIME_OFFSET_KEY, String(days));
        return true;
    } catch (e) {
        console.error('[DevTools] Failed to set time offset:', e);
        return false;
    }
};

/**
 * Add to current time offset.
 */
export const addToTimeOffset = (days) => {
    const current = getTimeOffset();
    setTimeOffset(current + days);
};

/**
 * Reset time to real time.
 */
export const resetTime = () => {
    try {
        localStorage.removeItem(TIME_OFFSET_KEY);
        return true;
    } catch (e) {
        return false;
    }
};

/**
 * Get effective current time (with offset).
 */
export const getEffectiveTime = () => {
    return getNow(); // getNow() already respects offset
};

// ═══════════════════════════════════════════
// WORD MANIPULATION
// ═══════════════════════════════════════════

/**
 * Force a word to be due now.
 */
export const makeWordDueNow = (wordId) => {
    const progress = loadProgress();
    const word = progress.wordProgress[wordId];

    if (!word) {
        console.error('[DevTools] Word not found:', wordId);
        return false;
    }

    word.due_date = new Date(Date.now() - 3600000).toISOString(); // 1 hour ago
    saveProgress(progress);
    return true;
};

/**
 * Set word to specific state with sensible defaults.
 */
export const setWordState = (wordId, state, options = {}) => {
    const progress = loadProgress();
    ensureWordProgress(progress, wordId, 1);
    const word = progress.wordProgress[wordId];

    word.card_state = state;

    switch (state) {
        case CARD_STATE.NEW:
            word.confidence = 0;
            word.interval = 0;
            word.due_date = null;
            word.times_reviewed = 0;
            word.times_correct = 0;
            word.times_wrong = 0;
            break;

        case CARD_STATE.LEARNING:
            word.learning_step = options.step ?? 0;
            word.confidence = options.confidence ?? 20;
            word.due_date = addDays(new Date(), 0); // Due now
            break;

        case CARD_STATE.REVIEW:
            word.confidence = options.confidence ?? 70;
            word.interval = options.interval ?? 7;
            word.ease_factor = options.easeFactor ?? EASE_FACTOR.DEFAULT;
            word.is_in_first_two_weeks = options.inFirstTwoWeeks ?? true;
            word.first_two_weeks_index = options.twoWeeksIndex ?? 2;
            word.due_date = options.dueDate ?? addDays(new Date(), -1); // Due yesterday
            break;

        case CARD_STATE.RELEARNING:
            word.learning_step = 0;
            word.confidence = options.confidence ?? 40;
            word.lapses = (word.lapses || 0) + 1;
            word.due_date = addDays(new Date(), 0);
            break;
    }

    saveProgress(progress);
    return true;
};

/**
 * Set word confidence directly.
 */
export const setWordConfidence = (wordId, confidence) => {
    const progress = loadProgress();
    const word = progress.wordProgress[wordId];

    if (!word) return false;

    word.confidence = Math.max(0, Math.min(100, confidence));
    saveProgress(progress);
    return true;
};

/**
 * Set word interval directly.
 */
export const setWordInterval = (wordId, intervalDays) => {
    const progress = loadProgress();
    const word = progress.wordProgress[wordId];

    if (!word) return false;

    word.interval = intervalDays;
    word.due_date = addDays(new Date(), intervalDays);
    saveProgress(progress);
    return true;
};

// ═══════════════════════════════════════════
// BULK OPERATIONS
// ═══════════════════════════════════════════

/**
 * Make all words due now.
 */
export const makeAllWordsDue = () => {
    const progress = loadProgress();
    const words = Object.values(progress.wordProgress);

    words.forEach(word => {
        if (word.card_state !== CARD_STATE.NEW) {
            word.due_date = new Date(Date.now() - 3600000).toISOString();
        }
    });

    saveProgress(progress);
    return words.length;
};

/**
 * Make N random words due now.
 */
export const makeRandomWordsDue = (count = 10) => {
    const progress = loadProgress();
    const eligibleWords = Object.values(progress.wordProgress)
        .filter(w => w.card_state !== CARD_STATE.NEW);

    const selected = eligibleWords
        .sort(() => Math.random() - 0.5)
        .slice(0, count);

    selected.forEach(word => {
        word.due_date = new Date(Date.now() - 3600000).toISOString();
    });

    saveProgress(progress);
    return selected.length;
};

/**
 * Reset a single word to new state.
 */
export const resetWord = (wordId) => {
    const progress = loadProgress();
    const word = progress.wordProgress[wordId];

    if (!word) return false;

    const newWord = createWordProgress(wordId, word.batch_id);
    progress.wordProgress[wordId] = newWord;
    saveProgress(progress);
    return true;
};

/**
 * Reset all words in a specific state.
 */
export const resetWordsByState = (state) => {
    const progress = loadProgress();
    let count = 0;

    Object.entries(progress.wordProgress).forEach(([wordId, word]) => {
        if (word.card_state === state) {
            const newWord = createWordProgress(Number(wordId), word.batch_id);
            progress.wordProgress[wordId] = newWord;
            count++;
        }
    });

    saveProgress(progress);
    return count;
};

// ═══════════════════════════════════════════
// SCENARIO GENERATION
// ═══════════════════════════════════════════

/**
 * Generate realistic test data with mixed word states.
 */
export const generateTestData = () => {
    const progress = loadProgress();

    // Assume we have words 1-30 from batch 1
    for (let wordId = 1; wordId <= 30; wordId++) {
        ensureWordProgress(progress, wordId, 1);
        const word = progress.wordProgress[wordId];

        if (wordId <= 10) {
            // First 10: Review phase, various intervals
            word.card_state = CARD_STATE.REVIEW;
            word.confidence = 60 + Math.random() * 30;
            word.interval = Math.floor(Math.random() * 20) + 1;
            word.ease_factor = 2.3 + Math.random() * 0.4;
            word.is_in_first_two_weeks = Math.random() > 0.5;
            word.first_two_weeks_index = Math.floor(Math.random() * 7);
            word.times_reviewed = Math.floor(Math.random() * 15) + 3;
            word.times_correct = word.times_reviewed - Math.floor(Math.random() * 3);
            word.times_wrong = word.times_reviewed - word.times_correct;

            // Make 5 of them due now
            if (wordId <= 5) {
                word.due_date = new Date(Date.now() - Math.random() * 86400000 * 3).toISOString();
            } else {
                word.due_date = addDays(new Date(), Math.random() * 10);
            }

        } else if (wordId <= 15) {
            // Next 5: Learning phase
            word.card_state = CARD_STATE.LEARNING;
            word.learning_step = Math.floor(Math.random() * 3);
            word.confidence = 20 + Math.random() * 40;
            word.due_date = addDays(new Date(), 0);
            word.times_seen = Math.floor(Math.random() * 5) + 1;

        } else if (wordId <= 20) {
            // Next 5: New (not started)
            word.card_state = CARD_STATE.NEW;
            word.confidence = 0;

        } else {
            // Last 10: Various advanced review states
            word.card_state = CARD_STATE.REVIEW;
            word.confidence = 70 + Math.random() * 30;
            word.interval = Math.floor(Math.random() * 60) + 10;
            word.ease_factor = 2.0 + Math.random() * 0.5;
            word.is_in_first_two_weeks = false;
            word.times_reviewed = Math.floor(Math.random() * 25) + 10;
            word.times_correct = word.times_reviewed - Math.floor(Math.random() * 5);
            word.times_wrong = word.times_reviewed - word.times_correct;
            word.due_date = addDays(new Date(), Math.random() * 30 - 10);
        }

        // Add some quiz history
        word.recent_sessions = Array.from({ length: 10 }, () =>
            Math.random() > 0.3 ? 1 : 0
        );
        word.answer_quality_history = Array.from({ length: 10 }, () =>
            Math.floor(Math.random() * 6)
        );
    }

    saveProgress(progress);
    return 30;
};

/**
 * Simulate a good learner pattern.
 */
export const simulateGoodLearner = () => {
    const progress = loadProgress();

    for (let wordId = 1; wordId <= 20; wordId++) {
        ensureWordProgress(progress, wordId, 1);
        const word = progress.wordProgress[wordId];

        word.card_state = CARD_STATE.REVIEW;
        word.confidence = 75 + Math.random() * 20;
        word.interval = 7 + Math.floor(Math.random() * 14);
        word.ease_factor = 2.4 + Math.random() * 0.1;
        word.is_in_first_two_weeks = false;
        word.times_reviewed = 15 + Math.floor(Math.random() * 10);
        word.times_correct = Math.floor(word.times_reviewed * 0.9);
        word.times_wrong = word.times_reviewed - word.times_correct;
        word.lapses = Math.random() > 0.8 ? 1 : 0;
        word.due_date = addDays(new Date(), Math.random() * 7 - 2);
        word.recent_sessions = [1, 1, 1, 1, 1, 1, 1, 0, 1, 1];
        word.answer_quality_history = [4, 5, 4, 5, 5, 4, 5, 4, 4, 5];
        word.average_answer_time = 2500 + Math.random() * 1000;
    }

    saveProgress(progress);
    return 20;
};

/**
 * Simulate a struggling learner pattern.
 */
export const simulateStrugglingLearner = () => {
    const progress = loadProgress();

    for (let wordId = 1; wordId <= 20; wordId++) {
        ensureWordProgress(progress, wordId, 1);
        const word = progress.wordProgress[wordId];

        word.card_state = Math.random() > 0.3 ? CARD_STATE.REVIEW : CARD_STATE.RELEARNING;
        word.confidence = 20 + Math.random() * 40;
        word.interval = Math.random() > 0.5 ? 1 + Math.floor(Math.random() * 5) : 1;
        word.ease_factor = 1.3 + Math.random() * 0.5;
        word.is_in_first_two_weeks = true;
        word.first_two_weeks_index = Math.floor(Math.random() * 4);
        word.times_reviewed = 10 + Math.floor(Math.random() * 15);
        word.times_correct = Math.floor(word.times_reviewed * 0.5);
        word.times_wrong = word.times_reviewed - word.times_correct;
        word.lapses = 2 + Math.floor(Math.random() * 3);
        word.due_date = addDays(new Date(), -Math.random() * 5);
        word.recent_sessions = [0, 1, 0, 1, 0, 0, 1, 0, 1, 0];
        word.answer_quality_history = [0, 2, 0, 2, 4, 0, 2, 0, 2, 2];
        word.average_answer_time = 6000 + Math.random() * 3000;
    }

    saveProgress(progress);
    return 20;
};

/**
 * Simulate 2-week inactivity.
 */
export const simulateInactive2Weeks = () => {
    const progress = loadProgress();
    let count = 0;

    Object.values(progress.wordProgress).forEach(word => {
        if (word.card_state !== CARD_STATE.NEW) {
            word.due_date = new Date(Date.now() - 14 * 86400000).toISOString();
            count++;
        }
    });

    saveProgress(progress);
    return count;
};

// ═══════════════════════════════════════════
// DATA INSPECTION
// ═══════════════════════════════════════════

/**
 * Get detailed stats about current progress.
 */
export const getProgressStats = () => {
    const progress = loadProgress();
    const words = Object.values(progress.wordProgress);

    const byState = {
        new: words.filter(w => w.card_state === CARD_STATE.NEW).length,
        learning: words.filter(w => w.card_state === CARD_STATE.LEARNING).length,
        review: words.filter(w => w.card_state === CARD_STATE.REVIEW).length,
        relearning: words.filter(w => w.card_state === CARD_STATE.RELEARNING).length,
    };

    const reviewWords = words.filter(w => w.card_state === CARD_STATE.REVIEW);
    const dueNow = words.filter(w =>
        w.due_date &&
        w.card_state !== CARD_STATE.NEW &&
        new Date(w.due_date) <= new Date()
    ).length;

    const avgConfidence = words.length > 0
        ? words.reduce((sum, w) => sum + (w.confidence || 0), 0) / words.length
        : 0;

    const avgInterval = reviewWords.length > 0
        ? reviewWords.reduce((sum, w) => sum + (w.interval || 0), 0) / reviewWords.length
        : 0;

    return {
        total_words: words.length,
        by_state: byState,
        due_now: dueNow,
        avg_confidence: Math.round(avgConfidence),
        avg_interval: Math.round(avgInterval * 10) / 10,
        time_offset: getTimeOffset(),
        stats: progress.stats,
    };
};

/**
 * Validate progress data integrity.
 */
export const validateProgress = () => {
    const progress = loadProgress();
    const issues = [];

    Object.entries(progress.wordProgress).forEach(([wordId, word]) => {
        if (!word.word_id && word.word_id !== 0) issues.push(`Word ${wordId}: missing word_id`);
        if (!word.card_state) issues.push(`Word ${wordId}: missing card_state`);
        if (word.confidence < 0 || word.confidence > 100) {
            issues.push(`Word ${wordId}: invalid confidence ${word.confidence}`);
        }
        if (word.ease_factor !== undefined && (word.ease_factor < 1.3 || word.ease_factor > 3.0)) {
            issues.push(`Word ${wordId}: suspicious ease_factor ${word.ease_factor}`);
        }
    });

    return {
        valid: issues.length === 0,
        issues,
    };
};

/**
 * Export progress JSON.
 */
export const handleExportProgress = () => {
    const json = exportProgress();
    if (!json) return false;
    const blob = new Blob([json], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `progress_${new Date().toISOString().slice(0, 19).replace(/:/g, '-')}.json`;
    a.click();
    URL.revokeObjectURL(url);
    return true;
};

/**
 * Import progress from file input event.
 */
export const handleImportProgress = (file) => {
    return new Promise((resolve) => {
        const reader = new FileReader();
        reader.onload = (event) => {
            const success = importProgress(event.target.result);
            resolve(success);
        };
        reader.onerror = () => resolve(false);
        reader.readAsText(file);
    });
};

// ═══════════════════════════════════════════
// DEFAULT EXPORT
// ═══════════════════════════════════════════

export default {
    // Time
    getTimeOffset,
    setTimeOffset,
    addToTimeOffset,
    resetTime,
    getEffectiveTime,

    // Word manipulation
    makeWordDueNow,
    setWordState,
    setWordConfidence,
    setWordInterval,
    resetWord,

    // Bulk operations
    makeAllWordsDue,
    makeRandomWordsDue,
    resetWordsByState,

    // Scenarios
    generateTestData,
    simulateGoodLearner,
    simulateStrugglingLearner,
    simulateInactive2Weeks,

    // Inspection
    getProgressStats,
    validateProgress,
    handleExportProgress,
    handleImportProgress,
};
