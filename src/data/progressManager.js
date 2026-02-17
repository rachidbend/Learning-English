/**
 * Progress Manager
 * Handles all localStorage operations for user progress
 */

import {
    initialProgressStructure,
    createWordProgress,
    createBatchProgress,
    WORD_STATUS,
    BATCH_STATUS
} from './progressStructure';

// ==================== CONSTANTS ====================

const STORAGE_KEY = 'englishLearningProgress';
const BACKUP_KEY = 'englishLearningProgress_backup';
const MAX_STORAGE_SIZE = 5 * 1024 * 1024; // 5MB (localStorage typically has 5-10MB limit)

// ==================== CORE FUNCTIONS ====================

/**
 * Check if localStorage is available
 */
export const isLocalStorageAvailable = () => {
    try {
        const test = '__localStorage_test__';
        localStorage.setItem(test, test);
        localStorage.removeItem(test);
        return true;
    } catch (e) {
        return false;
    }
};

/**
 * Get current storage size in bytes
 */
export const getStorageSize = () => {
    try {
        const data = localStorage.getItem(STORAGE_KEY);
        return data ? new Blob([data]).size : 0;
    } catch (e) {
        return 0;
    }
};

/**
 * Load progress from localStorage
 * Returns initialized structure if nothing exists
 */
export const loadProgress = () => {
    try {
        // Check if localStorage is available
        if (!isLocalStorageAvailable()) {
            console.warn('localStorage not available, using in-memory storage');
            return getInitialProgress();
        }

        const stored = localStorage.getItem(STORAGE_KEY);

        if (!stored) {
            // First time user - return initial structure
            return getInitialProgress();
        }

        // Parse stored data
        const progress = JSON.parse(stored);

        // Validate structure
        if (!progress || typeof progress !== 'object') {
            console.warn('Invalid progress structure, resetting');
            return getInitialProgress();
        }

        // Ensure all required fields exist
        const validated = ensureProgressStructure(progress);

        return validated;

    } catch (error) {
        console.error('Failed to load progress:', error);

        // Try to load from backup
        try {
            const backup = localStorage.getItem(BACKUP_KEY);
            if (backup) {
                console.log('Loading from backup');
                const progress = JSON.parse(backup);
                return ensureProgressStructure(progress);
            }
        } catch (backupError) {
            console.error('Backup also failed:', backupError);
        }

        // Last resort - return fresh structure
        return getInitialProgress();
    }
};

/**
 * Save progress to localStorage
 * Includes backup mechanism
 */
export const saveProgress = (progress) => {
    try {
        // Check localStorage availability
        if (!isLocalStorageAvailable()) {
            console.warn('localStorage not available, cannot save');
            return false;
        }

        // Update timestamp
        progress.lastUpdated = new Date().toISOString();

        // Stringify data
        const data = JSON.stringify(progress);

        // Check size
        const size = new Blob([data]).size;
        if (size > MAX_STORAGE_SIZE) {
            console.error('Progress data too large:', size, 'bytes');
            alert('Progress data is too large to save. Please export your progress.');
            return false;
        }

        // Create backup of current data
        try {
            const current = localStorage.getItem(STORAGE_KEY);
            if (current) {
                localStorage.setItem(BACKUP_KEY, current);
            }
        } catch (backupError) {
            console.warn('Failed to create backup:', backupError);
            // Continue anyway
        }

        // Save new data
        localStorage.setItem(STORAGE_KEY, data);

        return true;

    } catch (error) {
        if (error.name === 'QuotaExceededError') {
            console.error('localStorage quota exceeded');
            alert('Storage limit reached. Please clear old data or export your progress.');
        } else {
            console.error('Failed to save progress:', error);
        }
        return false;
    }
};

/**
 * Clear all progress (with confirmation)
 */
export const clearProgress = () => {
    try {
        localStorage.removeItem(STORAGE_KEY);
        localStorage.removeItem(BACKUP_KEY);
        return true;
    } catch (error) {
        console.error('Failed to clear progress:', error);
        return false;
    }
};

/**
 * Export progress as JSON string
 */
export const exportProgress = () => {
    try {
        const progress = loadProgress();
        return JSON.stringify(progress, null, 2);
    } catch (error) {
        console.error('Failed to export progress:', error);
        return null;
    }
};

/**
 * Import progress from JSON string
 */
export const importProgress = (jsonString) => {
    try {
        const progress = JSON.parse(jsonString);
        const validated = ensureProgressStructure(progress);
        return saveProgress(validated);
    } catch (error) {
        console.error('Failed to import progress:', error);
        return false;
    }
};

// ==================== HELPER FUNCTIONS ====================

/**
 * Get initial progress structure with timestamp
 */
const getInitialProgress = () => {
    const progress = JSON.parse(JSON.stringify(initialProgressStructure));
    progress.createdAt = new Date().toISOString();
    progress.lastUpdated = new Date().toISOString();
    return progress;
};

/**
 * Ensure progress has all required fields
 * Fills in missing fields with defaults
 */
const ensureProgressStructure = (progress) => {
    const complete = { ...initialProgressStructure };

    // Merge with existing data
    if (progress.version) complete.version = progress.version;
    if (progress.createdAt) complete.createdAt = progress.createdAt;
    if (progress.lastUpdated) complete.lastUpdated = progress.lastUpdated;

    // Merge wordProgress
    if (progress.wordProgress && typeof progress.wordProgress === 'object') {
        complete.wordProgress = { ...progress.wordProgress };
    }

    // Merge batchProgress
    if (progress.batchProgress && typeof progress.batchProgress === 'object') {
        complete.batchProgress = { ...progress.batchProgress };
    }

    // Merge stats
    if (progress.stats && typeof progress.stats === 'object') {
        complete.stats = { ...initialProgressStructure.stats, ...progress.stats };
    }

    return complete;
};

/**
 * Ensure word progress exists
 */
export const ensureWordProgress = (progress, wordId, batchId) => {
    if (!progress.wordProgress) {
        progress.wordProgress = {};
    }

    if (!progress.wordProgress[wordId]) {
        progress.wordProgress[wordId] = createWordProgress(wordId, batchId);
    }

    return progress;
};

/**
 * Ensure batch progress exists
 */
export const ensureBatchProgress = (progress, batchId) => {
    if (!progress.batchProgress) {
        progress.batchProgress = {};
    }

    if (!progress.batchProgress[batchId]) {
        progress.batchProgress[batchId] = createBatchProgress(batchId);
    }

    return progress;
};

// ==================== WORD OPERATIONS ====================

/**
 * Mark word as seen
 */
export const markWordAsSeen = (progress, wordId, batchId) => {
    ensureWordProgress(progress, wordId, batchId);
    ensureBatchProgress(progress, batchId);

    const wordProgress = progress.wordProgress[wordId];
    const now = new Date().toISOString();

    // Update word status
    if (wordProgress.status === WORD_STATUS.UNSEEN) {
        wordProgress.status = WORD_STATUS.SEEN;
        wordProgress.first_seen_date = now;
        wordProgress.times_seen = 1;

        // Update batch progress
        progress.batchProgress[batchId].words_seen += 1;
    } else {
        wordProgress.times_seen += 1;
    }

    wordProgress.last_seen_date = now;

    // Update batch status
    if (progress.batchProgress[batchId].status === BATCH_STATUS.LOCKED) {
        progress.batchProgress[batchId].status = BATCH_STATUS.IN_PROGRESS;
        progress.batchProgress[batchId].started_date = now;
    }

    // Update overall stats
    updateOverallStats(progress);

    return progress;
};

/**
 * Update word confidence after quiz
 */
export const updateWordConfidence = (progress, wordId, correct, questionType = null) => {
    ensureWordProgress(progress, wordId, progress.wordProgress[wordId]?.batch_id || 1);

    const wordProgress = progress.wordProgress[wordId];
    const now = new Date().toISOString();

    // Calculate new confidence
    if (correct) {
        const increase = Math.max(10, (100 - wordProgress.confidence) * 0.2);
        wordProgress.confidence = Math.min(100, wordProgress.confidence + increase);
        wordProgress.times_correct += 1;
    } else {
        const decrease = 20;
        wordProgress.confidence = Math.max(0, wordProgress.confidence - decrease);
        wordProgress.times_incorrect += 1;
    }

    // Update status based on confidence
    if (wordProgress.confidence >= 90) {
        const wasMastered = wordProgress.status === WORD_STATUS.MASTERED;
        wordProgress.status = WORD_STATUS.MASTERED;

        // Update batch mastery count
        if (!wasMastered) {
            const batchId = wordProgress.batch_id;
            if (progress.batchProgress[batchId]) {
                progress.batchProgress[batchId].words_mastered += 1;
            }
        }
    } else if (wordProgress.confidence >= 30) {
        wordProgress.status = WORD_STATUS.LEARNING;
    } else {
        wordProgress.status = WORD_STATUS.SEEN;
    }

    wordProgress.times_tested += 1;
    wordProgress.last_test_date = now;

    // Add to quiz history
    if (!wordProgress.quiz_history) {
        wordProgress.quiz_history = [];
    }
    wordProgress.quiz_history.push({
        timestamp: now,
        correct: correct,
        confidence_after: wordProgress.confidence,
        question_type: questionType
    });

    // Keep only last 10 quiz results
    if (wordProgress.quiz_history.length > 10) {
        wordProgress.quiz_history = wordProgress.quiz_history.slice(-10);
    }

    // Update overall stats
    updateOverallStats(progress);

    return progress;
};

/**
 * Get word progress
 */
export const getWordProgress = (progress, wordId) => {
    return progress.wordProgress?.[wordId] || null;
};

/**
 * Get all words with specific status
 */
export const getWordsByStatus = (progress, status) => {
    if (!progress.wordProgress) return [];

    return Object.entries(progress.wordProgress)
        .filter(([_, wp]) => wp.status === status)
        .map(([id, _]) => parseInt(id));
};

/**
 * Get weak words (confidence < 60%)
 */
export const getWeakWords = (progress) => {
    if (!progress.wordProgress) return [];

    return Object.entries(progress.wordProgress)
        .filter(([_, wp]) =>
            wp.confidence < 60 &&
            wp.status !== WORD_STATUS.UNSEEN
        )
        .map(([id, _]) => parseInt(id));
};

// ==================== BATCH OPERATIONS ====================

/**
 * Update batch test results
 */
export const updateBatchTest = (progress, batchId, score, passed) => {
    ensureBatchProgress(progress, batchId);

    const batchProgress = progress.batchProgress[batchId];
    const now = new Date().toISOString();

    batchProgress.test_taken = true;
    batchProgress.test_score = score;
    batchProgress.test_date = now;

    if (passed) {
        batchProgress.status = BATCH_STATUS.COMPLETED;
        batchProgress.completed_date = now;

        // Unlock next batch
        const nextBatchId = batchId + 1;
        ensureBatchProgress(progress, nextBatchId);
        progress.batchProgress[nextBatchId].status = BATCH_STATUS.UNLOCKED;
    }

    updateOverallStats(progress);

    return progress;
};

/**
 * Get batch progress
 */
export const getBatchProgress = (progress, batchId) => {
    return progress.batchProgress?.[batchId] || null;
};

// ==================== STATS OPERATIONS ====================

/**
 * Update overall statistics
 */
const updateOverallStats = (progress) => {
    if (!progress.stats) {
        progress.stats = { ...initialProgressStructure.stats };
    }

    const stats = progress.stats;

    // Count words by status
    const wordProgresses = Object.values(progress.wordProgress || {});
    stats.total_words_seen = wordProgresses.filter(
        wp => wp.status !== WORD_STATUS.UNSEEN
    ).length;
    stats.total_words_mastered = wordProgresses.filter(
        wp => wp.status === WORD_STATUS.MASTERED
    ).length;

    // Count test statistics
    stats.total_questions_answered = wordProgresses.reduce(
        (sum, wp) => sum + wp.times_tested, 0
    );
    stats.total_correct_answers = wordProgresses.reduce(
        (sum, wp) => sum + wp.times_correct, 0
    );

    // Calculate average test score
    if (stats.total_questions_answered > 0) {
        stats.average_test_score = Math.round(
            (stats.total_correct_answers / stats.total_questions_answered) * 100
        );
    }

    // Update last study date
    stats.last_study_date = new Date().toISOString();

    return progress;
};

/**
 * Update study time
 */
export const addStudyTime = (progress, minutes) => {
    if (!progress.stats) {
        progress.stats = { ...initialProgressStructure.stats };
    }

    progress.stats.total_study_time_minutes += minutes;
    updateOverallStats(progress);

    return progress;
};

// ==================== DEBUGGING UTILITIES ====================

/**
 * Get storage info (for debugging)
 */
export const getStorageInfo = () => {
    const available = isLocalStorageAvailable();
    const size = getStorageSize();
    const sizeKB = (size / 1024).toFixed(2);
    const progress = available ? loadProgress() : null;

    return {
        available,
        size: `${sizeKB} KB`,
        maxSize: `${(MAX_STORAGE_SIZE / 1024 / 1024).toFixed(2)} MB`,
        percentUsed: `${((size / MAX_STORAGE_SIZE) * 100).toFixed(2)}%`,
        version: progress?.version || 'N/A',
        createdAt: progress?.createdAt || 'N/A',
        lastUpdated: progress?.lastUpdated || 'N/A',
        totalWords: Object.keys(progress?.wordProgress || {}).length,
        totalBatches: Object.keys(progress?.batchProgress || {}).length
    };
};

/**
 * Print progress summary (for debugging)
 */
export const printProgressSummary = () => {
    const progress = loadProgress();
    const info = getStorageInfo();

    console.log('=== Progress Summary ===');
    console.log('Storage:', info);
    console.log('Words Seen:', progress.stats.total_words_seen);
    console.log('Words Mastered:', progress.stats.total_words_mastered);
    console.log('Average Score:', progress.stats.average_test_score + '%');
    console.log('Study Time:', progress.stats.total_study_time_minutes, 'minutes');
    console.log('========================');

    return progress;
};

// ==================== EXPORTS ====================

export default {
    // Core operations
    loadProgress,
    saveProgress,
    clearProgress,
    exportProgress,
    importProgress,

    // Word operations
    ensureWordProgress,
    markWordAsSeen,
    updateWordConfidence,
    getWordProgress,
    getWordsByStatus,
    getWeakWords,

    // Batch operations
    ensureBatchProgress,
    updateBatchTest,
    getBatchProgress,

    // Stats operations
    addStudyTime,

    // Utilities
    isLocalStorageAvailable,
    getStorageSize,
    getStorageInfo,
    printProgressSummary
};
