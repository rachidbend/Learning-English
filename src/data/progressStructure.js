/**
 * Progress Tracking Structure
 * This defines how user progress is stored in localStorage
 * Actual progress will be stored under key: 'englishLearningProgress'
 */

export const initialProgressStructure = {
    version: "1.0",
    createdAt: null, // Will be set when user starts
    lastUpdated: null, // Will be updated on every change

    // Individual word progress
    wordProgress: {
        // Example structure (not actual data):
        // "1": {
        //   status: "unseen" | "seen" | "learning" | "mastered",
        //   confidence: 0-100,
        //   times_seen: 0,
        //   times_tested: 0,
        //   times_correct: 0,
        //   times_incorrect: 0,
        //   first_seen_date: null,
        //   last_seen_date: null,
        //   last_test_date: null,
        //   batch_id: 1
        // }
    },

    // Batch completion progress
    batchProgress: {
        // Example structure (not actual data):
        // "1": {
        //   status: "locked" | "unlocked" | "in_progress" | "completed",
        //   words_seen: 0,
        //   words_mastered: 0,
        //   test_taken: false,
        //   test_score: null,
        //   test_date: null,
        //   started_date: null,
        //   completed_date: null
        // }
    },

    // Overall statistics
    stats: {
        total_study_time_minutes: 0,
        total_words_seen: 0,
        total_words_mastered: 0,
        total_tests_taken: 0,
        average_test_score: 0,
        current_streak_days: 0,
        longest_streak_days: 0,
        last_study_date: null
    }
};

// Helper function to initialize word progress
export const createWordProgress = (wordId, batchId) => ({
    status: "unseen",
    confidence: 0,
    times_seen: 0,
    times_tested: 0,
    times_correct: 0,
    times_incorrect: 0,
    first_seen_date: null,
    last_seen_date: null,
    last_test_date: null,
    batch_id: batchId
});

// Helper function to initialize batch progress
export const createBatchProgress = (batchId) => ({
    status: batchId === 1 ? "unlocked" : "locked",
    words_seen: 0,
    words_mastered: 0,
    test_taken: false,
    test_score: null,
    test_date: null,
    started_date: null,
    completed_date: null
});

// Status definitions
export const WORD_STATUS = {
    UNSEEN: "unseen",       // Never shown on word card
    SEEN: "seen",           // Shown but not tested yet
    LEARNING: "learning",   // Confidence 1-89%
    MASTERED: "mastered"    // Confidence >= 90%
};

export const BATCH_STATUS = {
    LOCKED: "locked",           // Not accessible yet
    UNLOCKED: "unlocked",       // Available to start
    IN_PROGRESS: "in_progress", // Started but not completed test
    COMPLETED: "completed"      // Test passed with 90%+
};
