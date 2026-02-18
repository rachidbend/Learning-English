/**
 * progressManager.js
 * 
 * All localStorage read/write operations for the v2 spaced repetition system.
 * Import this wherever you need to load or save progress.
 * 
 * REPLACES the old v1 progressManager.js
 */

import {
    createInitialProgress,
    createWordProgress,
    createBatchProgress,
    CARD_STATE,
} from './progressSchema';

const STORAGE_KEY = 'elp_progress_v2';       // New key (v2 schema)
const BACKUP_KEY = 'elp_progress_v2_backup';

// ─────────────────────────────────────────────
// CORE OPERATIONS
// ─────────────────────────────────────────────

/**
 * Load progress from localStorage.
 * Returns fresh structure if nothing exists.
 * Falls back to backup if main is corrupted.
 */
export const loadProgress = () => {
    try {
        if (!isAvailable()) return createInitialProgress();

        const raw = localStorage.getItem(STORAGE_KEY);
        if (!raw) return createInitialProgress();

        const parsed = JSON.parse(raw);
        return mergeWithDefaults(parsed);

    } catch (err) {
        console.error('[progressManager] Load failed:', err);

        // Try backup
        try {
            const backup = localStorage.getItem(BACKUP_KEY);
            if (backup) {
                console.warn('[progressManager] Loading from backup');
                return mergeWithDefaults(JSON.parse(backup));
            }
        } catch (backupErr) {
            console.error('[progressManager] Backup also failed:', backupErr);
        }

        return createInitialProgress();
    }
};

/**
 * Save progress to localStorage.
 * Creates backup of previous state before overwriting.
 * Returns true on success, false on failure.
 */
export const saveProgress = (progress) => {
    try {
        if (!isAvailable()) {
            console.warn('[progressManager] localStorage not available');
            return false;
        }

        progress.last_updated = new Date().toISOString();
        const serialized = JSON.stringify(progress);

        // Backup current before overwriting
        const current = localStorage.getItem(STORAGE_KEY);
        if (current) {
            localStorage.setItem(BACKUP_KEY, current);
        }

        localStorage.setItem(STORAGE_KEY, serialized);
        return true;

    } catch (err) {
        if (err.name === 'QuotaExceededError') {
            console.error('[progressManager] Storage quota exceeded');
        } else {
            console.error('[progressManager] Save failed:', err);
        }
        return false;
    }
};

/**
 * Clear all progress.
 * Use with caution — this is irreversible.
 */
export const clearProgress = () => {
    try {
        localStorage.removeItem(STORAGE_KEY);
        localStorage.removeItem(BACKUP_KEY);
        return true;
    } catch (err) {
        console.error('[progressManager] Clear failed:', err);
        return false;
    }
};

/**
 * Export progress as JSON string (for backup/debug)
 */
export const exportProgress = () => {
    try {
        const progress = loadProgress();
        return JSON.stringify(progress, null, 2);
    } catch (err) {
        console.error('[progressManager] Export failed:', err);
        return null;
    }
};

/**
 * Import progress from JSON string
 */
export const importProgress = (jsonString) => {
    try {
        const parsed = JSON.parse(jsonString);
        const validated = mergeWithDefaults(parsed);
        return saveProgress(validated);
    } catch (err) {
        console.error('[progressManager] Import failed:', err);
        return false;
    }
};

// ─────────────────────────────────────────────
// WORD PROGRESS HELPERS
// ─────────────────────────────────────────────

/**
 * Get a single word's progress.
 * Returns null if word has no progress yet.
 */
export const getWordProgress = (progress, wordId) => {
    return progress.wordProgress[String(wordId)] || null;
};

/**
 * Ensure a word progress entry exists.
 * Creates it if missing. Mutates progress object.
 */
export const ensureWordProgress = (progress, wordId, batchId) => {
    const key = String(wordId);
    if (!progress.wordProgress[key]) {
        progress.wordProgress[key] = createWordProgress(wordId, batchId);
    }
    return progress.wordProgress[key];
};

/**
 * Ensure a batch progress entry exists.
 * Creates it if missing. Mutates progress object.
 */
export const ensureBatchProgress = (progress, batchId) => {
    const key = String(batchId);
    if (!progress.batchProgress[key]) {
        progress.batchProgress[key] = createBatchProgress(batchId);
    }
    return progress.batchProgress[key];
};

/**
 * Get all words due for review right now.
 */
export const getDueWords = (progress, currentTime = null) => {
    const now = currentTime || getNow();

    return Object.values(progress.wordProgress)
        .filter(wp => {
            if (!wp.due_date) return false;
            if (wp.card_state === CARD_STATE.NEW) return false;
            return new Date(wp.due_date) <= now;
        })
        .sort((a, b) => new Date(a.due_date) - new Date(b.due_date));
};

/**
 * Get all new (unseen) words from existing wordProgress entries
 */
export const getNewWords = (progress) => {
    return Object.values(progress.wordProgress)
        .filter(wp => wp.card_state === CARD_STATE.NEW);
};

/**
 * Get IDs of words available to learn from a batch.
 * Includes both:
 * - Words NOT yet in wordProgress (never seen)
 * - Words in wordProgress with card_state === NEW
 * 
 * @param {Object} progress - The progress object
 * @param {Array} batchWords - Array of word objects from a batch (must have .id)
 * @returns {number[]} Array of word IDs available to learn
 */
export const getAvailableNewWordIds = (progress, batchWords) => {
    if (!batchWords || !Array.isArray(batchWords)) return [];

    return batchWords
        .map(w => w.id)
        .filter(id => {
            const wp = progress.wordProgress[String(id)];
            // Available if: no progress entry yet, OR still in NEW state
            return !wp || wp.card_state === CARD_STATE.NEW;
        });
};

/**
 * Get words currently in learning phase
 */
export const getLearningWords = (progress) => {
    return Object.values(progress.wordProgress)
        .filter(wp =>
            wp.card_state === CARD_STATE.LEARNING ||
            wp.card_state === CARD_STATE.RELEARNING
        );
};

/**
 * Get words with low confidence (for review session prioritization)
 */
export const getWeakWords = (progress, threshold = 60) => {
    return Object.values(progress.wordProgress)
        .filter(wp =>
            wp.confidence < threshold &&
            wp.card_state !== CARD_STATE.NEW
        );
};

// ─────────────────────────────────────────────
// TIME UTILITIES
// ─────────────────────────────────────────────

/**
 * Get current time, respecting dev time offset.
 * ALL scheduling logic should use getNow() not new Date().
 */
export const getNow = () => {
    try {
        const offset = localStorage.getItem('dev_time_offset_days');
        if (offset) {
            const days = parseFloat(offset);
            if (!isNaN(days) && days !== 0) {
                return new Date(Date.now() + days * 86400000);
            }
        }
    } catch (e) {
        // Ignore — just return real time
    }
    return new Date();
};

/**
 * Add days to a date and return ISO string
 */
export const addDays = (date, days) => {
    const result = new Date(date);
    result.setDate(result.getDate() + days);
    return result.toISOString();
};

/**
 * Add minutes to a date and return ISO string
 */
export const addMinutes = (date, minutes) => {
    return new Date(new Date(date).getTime() + minutes * 60000).toISOString();
};

// ─────────────────────────────────────────────
// DEBUGGING UTILITIES
// ─────────────────────────────────────────────

/**
 * Get storage info (for debugging)
 */
export const getStorageInfo = () => {
    const available = isAvailable();
    let size = 0;
    try {
        const data = localStorage.getItem(STORAGE_KEY);
        size = data ? new Blob([data]).size : 0;
    } catch (e) { /* ignore */ }

    const sizeKB = (size / 1024).toFixed(2);
    const progress = available ? loadProgress() : null;

    return {
        available,
        size: `${sizeKB} KB`,
        version: progress?.version || 'N/A',
        created_at: progress?.created_at || 'N/A',
        last_updated: progress?.last_updated || 'N/A',
        totalWords: Object.keys(progress?.wordProgress || {}).length,
        totalBatches: Object.keys(progress?.batchProgress || {}).length,
    };
};

/**
 * Print progress summary (for debugging)
 */
export const printProgressSummary = () => {
    const progress = loadProgress();
    const info = getStorageInfo();

    console.log('=== Progress Summary (v2) ===');
    console.log('Storage:', info);
    console.log('Stats:', progress.stats);
    console.log('============================');

    return progress;
};

// ─────────────────────────────────────────────
// PRIVATE HELPERS
// ─────────────────────────────────────────────

/**
 * Check if localStorage is available
 */
const isAvailable = () => {
    try {
        localStorage.setItem('__test__', '1');
        localStorage.removeItem('__test__');
        return true;
    } catch (e) {
        return false;
    }
};

/**
 * Merge saved progress with current defaults.
 * Ensures any new fields added to schema are present.
 */
const mergeWithDefaults = (saved) => {
    const defaults = createInitialProgress();
    return {
        ...defaults,
        ...saved,
        stats: { ...defaults.stats, ...(saved.stats || {}) },
        settings: { ...defaults.settings, ...(saved.settings || {}) },
        wordProgress: saved.wordProgress || {},
        batchProgress: saved.batchProgress || {},
    };
};

// ─────────────────────────────────────────────
// DEFAULT EXPORT
// ─────────────────────────────────────────────

export default {
    loadProgress,
    saveProgress,
    clearProgress,
    exportProgress,
    importProgress,
    getWordProgress,
    ensureWordProgress,
    ensureBatchProgress,
    getDueWords,
    getNewWords,
    getAvailableNewWordIds,
    getLearningWords,
    getWeakWords,
    getNow,
    addDays,
    addMinutes,
    getStorageInfo,
    printProgressSummary,
};
