/**
 * seedReviewData.js
 *
 * Development utility to populate localStorage with fake review-ready
 * word progress. Required for testing the review session UI since
 * no real learning data exists yet.
 *
 * Usage from browser console:
 *   import('/src/utils/seedReviewData.js').then(m => m.seedReviewData())
 *
 * Or call seedReviewData() from a dev button.
 */

import { createWordProgress } from '../data/progressSchema';
import { loadProgress, saveProgress, ensureWordProgress } from '../data/progressManager';

/**
 * Seed localStorage with review-ready word progress.
 *
 * Creates 8 words total:
 * - 3 overdue review words (various confidence levels)
 * - 2 due-today review words
 * - 2 learning-phase words (due now)
 * - 1 relearning word (lapsed)
 */
export const seedReviewData = () => {
    const progress = loadProgress();
    const now = new Date();

    // Helper: create a past date
    const daysAgo = (days) => {
        const d = new Date(now);
        d.setDate(d.getDate() - days);
        return d.toISOString();
    };

    // Helper: create a future date
    const daysFromNow = (days) => {
        const d = new Date(now);
        d.setDate(d.getDate() + days);
        return d.toISOString();
    };

    // Helper: minutes ago
    const minutesAgo = (mins) => {
        const d = new Date(now);
        d.setMinutes(d.getMinutes() - mins);
        return d.toISOString();
    };

    // ── Word 1: Overdue review, high confidence ────────
    ensureWordProgress(progress, 1, 1);
    Object.assign(progress.wordProgress['1'], {
        card_state: 'review',
        due_date: daysAgo(2),    // 2 days overdue
        interval: 5,
        ease_factor: 2.50,
        confidence: 82,
        mastery_level: 'strong',
        times_seen: 8,
        times_reviewed: 4,
        is_in_first_two_weeks: true,
        first_two_weeks_index: 3,
        graduated_date: daysAgo(14),
        first_seen_date: daysAgo(20),
        last_review_date: daysAgo(7),
        recent_sessions: [1, 1, 1, 1],
        answer_quality_history: [4, 5, 4, 4],
    });

    // ── Word 2: Overdue review, medium confidence ──────
    ensureWordProgress(progress, 2, 1);
    Object.assign(progress.wordProgress['2'], {
        card_state: 'review',
        due_date: daysAgo(1),    // 1 day overdue
        interval: 3,
        ease_factor: 2.30,
        confidence: 55,
        mastery_level: 'developing',
        times_seen: 6,
        times_reviewed: 3,
        is_in_first_two_weeks: true,
        first_two_weeks_index: 2,
        graduated_date: daysAgo(10),
        first_seen_date: daysAgo(15),
        last_review_date: daysAgo(4),
        recent_sessions: [1, 0, 1],
        answer_quality_history: [4, 0, 4],
    });

    // ── Word 3: Overdue review, low confidence ─────────
    ensureWordProgress(progress, 3, 1);
    Object.assign(progress.wordProgress['3'], {
        card_state: 'review',
        due_date: daysAgo(3),    // 3 days overdue
        interval: 2,
        ease_factor: 1.80,
        confidence: 30,
        mastery_level: 'developing',
        times_seen: 10,
        times_reviewed: 5,
        is_in_first_two_weeks: true,
        first_two_weeks_index: 1,
        graduated_date: daysAgo(12),
        first_seen_date: daysAgo(18),
        last_review_date: daysAgo(5),
        lapses: 2,
        recent_sessions: [0, 1, 0, 1, 0],
        answer_quality_history: [0, 2, 0, 4, 0],
    });

    // ── Word 4: Due today, good confidence ─────────────
    ensureWordProgress(progress, 4, 1);
    Object.assign(progress.wordProgress['4'], {
        card_state: 'review',
        due_date: minutesAgo(30),  // Due 30 min ago
        interval: 4,
        ease_factor: 2.50,
        confidence: 70,
        mastery_level: 'strong',
        times_seen: 7,
        times_reviewed: 3,
        is_in_first_two_weeks: true,
        first_two_weeks_index: 2,
        graduated_date: daysAgo(8),
        first_seen_date: daysAgo(12),
        last_review_date: daysAgo(4),
        recent_sessions: [1, 1, 1],
        answer_quality_history: [4, 4, 4],
    });

    // ── Word 5: Due today, medium confidence ───────────
    ensureWordProgress(progress, 5, 1);
    Object.assign(progress.wordProgress['5'], {
        card_state: 'review',
        due_date: minutesAgo(5),   // Due 5 min ago
        interval: 3,
        ease_factor: 2.20,
        confidence: 48,
        mastery_level: 'developing',
        times_seen: 5,
        times_reviewed: 2,
        is_in_first_two_weeks: true,
        first_two_weeks_index: 1,
        graduated_date: daysAgo(6),
        first_seen_date: daysAgo(10),
        last_review_date: daysAgo(3),
        recent_sessions: [1, 0],
        answer_quality_history: [4, 2],
    });

    // ── Word 6: Learning phase, step 1 ────────────────
    ensureWordProgress(progress, 6, 1);
    Object.assign(progress.wordProgress['6'], {
        card_state: 'learning',
        due_date: minutesAgo(2),   // Due now
        interval: 0,
        ease_factor: 2.50,
        learning_step: 1,
        confidence: 15,
        mastery_level: 'developing',
        times_seen: 3,
        times_reviewed: 1,
        first_seen_date: daysAgo(1),
        last_review_date: minutesAgo(15),
        recent_sessions: [1],
        answer_quality_history: [4],
    });

    // ── Word 7: Learning phase, step 0 ────────────────
    ensureWordProgress(progress, 7, 1);
    Object.assign(progress.wordProgress['7'], {
        card_state: 'learning',
        due_date: minutesAgo(1),   // Due now
        interval: 0,
        ease_factor: 2.50,
        learning_step: 0,
        confidence: 5,
        mastery_level: 'developing',
        times_seen: 2,
        times_reviewed: 0,
        first_seen_date: daysAgo(1),
        recent_sessions: [],
        answer_quality_history: [],
    });

    // ── Word 8: Relearning (lapsed) ────────────────────
    ensureWordProgress(progress, 8, 1);
    Object.assign(progress.wordProgress['8'], {
        card_state: 'relearning',
        due_date: minutesAgo(3),   // Due now
        interval: 3,
        ease_factor: 1.70,
        learning_step: 0,
        confidence: 20,
        mastery_level: 'developing',
        times_seen: 12,
        times_reviewed: 6,
        lapses: 3,
        is_in_first_two_weeks: false,
        first_two_weeks_index: 5,
        graduated_date: daysAgo(30),
        first_seen_date: daysAgo(35),
        last_review_date: daysAgo(1),
        recent_sessions: [1, 1, 0, 1, 0, 0],
        answer_quality_history: [4, 4, 0, 4, 0, 0],
    });

    saveProgress(progress);
    console.log('✅ Seeded 8 review-ready words into localStorage');
    console.log('   - 3 overdue review words');
    console.log('   - 2 due-today review words');
    console.log('   - 2 learning-phase words');
    console.log('   - 1 relearning (lapsed) word');
    console.log('   Reload the page to see updated session dashboard.');

    return progress;
};

/**
 * Clear all seeded data and reset to fresh state.
 */
export const clearSeedData = () => {
    const { clearProgress } = require('../data/progressManager');
    clearProgress();
    console.log('🗑️ Cleared all progress data');
};

export default seedReviewData;
