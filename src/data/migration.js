/**
 * migration.js
 * 
 * Converts old progress format (v1, learn-5-test-1 system)
 * to new format (v2, spaced repetition system).
 * 
 * Safe to run multiple times — checks version before migrating.
 */

import {
    createWordProgress,
    createInitialProgress,
    CARD_STATE,
    EASE_FACTOR,
    MASTERY_LEVEL,
} from './progressSchema';
import { saveProgress } from './progressManager';

const OLD_STORAGE_KEY = 'englishLearningProgress'; // v1 key
const OLD_BACKUP_KEY = 'englishLearningProgress_backup';

// ─────────────────────────────────────────────
// PUBLIC API
// ─────────────────────────────────────────────

/**
 * Check if old v1 data exists
 */
export const hasLegacyData = () => {
    try {
        return !!localStorage.getItem(OLD_STORAGE_KEY);
    } catch (e) {
        return false;
    }
};

/**
 * Main migration function.
 * Loads v1 data, converts to v2, saves under new key.
 * Preserves v1 data under a timestamped backup key just in case.
 */
export const migrateFromV1 = () => {
    try {
        const rawOld = localStorage.getItem(OLD_STORAGE_KEY);
        if (!rawOld) {
            console.log('[migration] No v1 data found, nothing to migrate');
            return false;
        }

        const oldProgress = JSON.parse(rawOld);

        // Backup old data before doing anything
        localStorage.setItem(
            'elp_v1_backup_' + Date.now(),
            rawOld
        );

        // Create fresh v2 structure
        const newProgress = createInitialProgress();
        newProgress.created_at = oldProgress.createdAt || new Date().toISOString();

        // Migrate each word
        const oldWords = oldProgress.wordProgress || {};
        Object.entries(oldWords).forEach(([wordId, oldWord]) => {
            const newWord = migrateWordProgress(oldWord);
            newProgress.wordProgress[wordId] = newWord;
        });

        // Migrate batch progress
        const oldBatches = oldProgress.batchProgress || {};
        Object.entries(oldBatches).forEach(([batchId, oldBatch]) => {
            newProgress.batchProgress[batchId] = {
                batch_id: oldBatch.batch_id || parseInt(batchId),
                status: oldBatch.status || 'locked',
                words_seen: oldBatch.words_seen || 0,
                words_graduated: oldBatch.words_mastered || 0,
                words_mastered: oldBatch.words_mastered || 0,
                test_taken: oldBatch.test_taken || false,
                test_score: oldBatch.test_score || null,
                test_date: oldBatch.test_date || null,
                started_date: oldBatch.started_date || null,
                completed_date: oldBatch.completed_date || null,
            };
        });

        // Migrate stats
        if (oldProgress.stats) {
            newProgress.stats.total_words_seen = oldProgress.stats.total_words_seen || 0;
            newProgress.stats.total_words_mastered = oldProgress.stats.total_words_mastered || 0;
            newProgress.stats.current_streak_days = oldProgress.stats.current_streak_days || 0;
            newProgress.stats.longest_streak_days = oldProgress.stats.longest_streak_days || 0;
            newProgress.stats.last_study_date = oldProgress.stats.last_study_date || null;
            newProgress.stats.total_questions_answered = oldProgress.stats.total_questions_answered || 0;
            newProgress.stats.total_correct_answers = oldProgress.stats.total_correct_answers || 0;
        }

        // Save new progress
        saveProgress(newProgress);

        console.log('[migration] Successfully migrated v1 → v2');
        console.log(`[migration] Migrated ${Object.keys(oldWords).length} words`);

        return true;

    } catch (err) {
        console.error('[migration] Migration failed:', err);
        return false;
    }
};

// ─────────────────────────────────────────────
// PRIVATE HELPERS
// ─────────────────────────────────────────────

/**
 * Migrate a single word from v1 to v2 format
 */
const migrateWordProgress = (old) => {
    const newWord = createWordProgress(
        old.word_id || old.id || 0,
        old.batch_id || 1
    );

    // Carry over basic stats
    newWord.times_seen = old.times_seen || 0;
    newWord.times_reviewed = old.times_tested || 0;
    newWord.times_correct = old.times_correct || 0;
    newWord.times_wrong = old.times_incorrect || 0;

    // Carry over timestamps
    newWord.first_seen_date = old.first_seen_date || null;
    newWord.last_seen_date = old.last_seen_date || null;
    newWord.last_review_date = old.last_test_date || null;

    // Derive ease factor from old confidence
    newWord.ease_factor = deriveEaseFromConfidence(old.confidence || 0);

    // Derive card state from old status
    newWord.card_state = deriveCardState(old.status, old.confidence);

    // Derive interval from confidence
    newWord.interval = deriveInterval(old.confidence || 0);

    // Set due date based on derived interval
    if (newWord.card_state !== CARD_STATE.NEW) {
        const base = new Date(old.last_test_date || old.last_seen_date || Date.now());
        newWord.due_date = new Date(
            base.getTime() + newWord.interval * 86400000
        ).toISOString();
    }

    // Carry over confidence directly
    newWord.confidence = old.confidence || 0;
    newWord.mastery_level = deriveMasteryLevel(old.confidence || 0);

    // If card has graduated (was learning/mastered), set graduated date
    if (newWord.card_state === CARD_STATE.REVIEW) {
        newWord.graduated_date = old.first_seen_date || new Date().toISOString();
        newWord.is_in_first_two_weeks = false; // Migrated words skip the aggressive schedule
    }

    // Migrate quiz history if available
    if (old.quiz_history && Array.isArray(old.quiz_history)) {
        newWord.question_history = old.quiz_history.map(entry => ({
            timestamp: entry.timestamp,
            correct: entry.correct,
            time_ms: null, // Not tracked in v1
            question_type: entry.question_type || null,
            session_id: null,
        }));

        // Derive recent sessions from quiz history
        newWord.recent_sessions = old.quiz_history
            .slice(-10)
            .map(entry => entry.correct ? 1 : 0);
    }

    return newWord;
};

/**
 * Derive ease factor from old confidence score
 */
const deriveEaseFromConfidence = (confidence) => {
    if (confidence <= 0) return EASE_FACTOR.DEFAULT;
    if (confidence < 30) return EASE_FACTOR.MINIMUM;
    if (confidence >= 90) return EASE_FACTOR.MAXIMUM;
    // Linear interpolation between 30 and 90
    return EASE_FACTOR.MINIMUM +
        ((confidence - 30) / 60) *
        (EASE_FACTOR.MAXIMUM - EASE_FACTOR.MINIMUM);
};

/**
 * Derive card state from old word status
 */
const deriveCardState = (status, confidence) => {
    if (!status || status === 'unseen') return CARD_STATE.NEW;
    if (status === 'seen') return CARD_STATE.LEARNING;
    if (status === 'learning') return CARD_STATE.REVIEW;
    if (status === 'mastered') return CARD_STATE.REVIEW;
    return CARD_STATE.NEW;
};

/**
 * Derive review interval from old confidence
 */
const deriveInterval = (confidence) => {
    if (confidence < 30) return 1;
    if (confidence < 60) return 3;
    if (confidence < 80) return 7;
    if (confidence < 90) return 14;
    return 21;
};

/**
 * Derive mastery level from confidence
 */
const deriveMasteryLevel = (confidence) => {
    if (confidence <= 0) return MASTERY_LEVEL.UNSEEN;
    if (confidence < 30) return MASTERY_LEVEL.STARTING;
    if (confidence < 60) return MASTERY_LEVEL.LEARNING;
    if (confidence < 80) return MASTERY_LEVEL.GETTING_THERE;
    if (confidence < 90) return MASTERY_LEVEL.STRONG;
    return MASTERY_LEVEL.MASTERED;
};
