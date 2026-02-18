/**
 * scheduler.js
 *
 * Core scheduling engine for the active recall system.
 *
 * RESPONSIBILITIES:
 * 1. Advance words through learning steps
 * 2. Graduate words from learning → review
 * 3. Schedule next review date (first-two-weeks vs standard Anki)
 * 4. Handle lapses (failed reviews → relearning)
 * 5. Update ease factor
 * 6. Update confidence after each session
 *
 * ALL FUNCTIONS ARE PURE:
 * They take a word progress object + inputs and return
 * a NEW updated word progress object. No mutation.
 * No localStorage. No UI. No side effects.
 */

import {
    CARD_STATE,
    ANSWER_QUALITY,
    EASE_FACTOR,
    LEARNING_STEPS_MINUTES,
    RELEARNING_STEPS_MINUTES,
    FIRST_TWO_WEEKS_SCHEDULE,
    GRADUATING_INTERVAL,
    EASY_GRADUATING_INTERVAL,
    LAPSE_SETTINGS,
    MAX_INTERVAL_DAYS,
    INTERVAL_MULTIPLIER,
    CONFIDENCE_MODIFIERS,
} from '../data/progressSchema';

import { addDays, addMinutes, getNow } from '../data/progressManager';
import { calculateConfidence, calculateConfidenceTrend, getMasteryLevel } from './confidenceCalculator';

// ─────────────────────────────────────────────
// MAIN EXPORT: processAnswer
// ─────────────────────────────────────────────

/**
 * Process an answer quality rating for a word and update its progress.
 * This is called once per word per session, after ALL questions for
 * that word have been answered and quality has been derived.
 *
 * @param {Object} wordProgress - Current word progress (will not be mutated)
 * @param {string} quality - ANSWER_QUALITY value: again/hard/good/easy
 * @param {Array} questionResults - Raw question results (for confidence calc)
 * @returns {Object} New word progress object with updated scheduling data
 *
 * @example
 * const updated = processAnswer(wordProgress, ANSWER_QUALITY.GOOD, results);
 * // updated has new: due_date, interval, ease_factor, confidence, etc.
 */
export const processAnswer = (wordProgress, quality, questionResults = []) => {
    // Deep clone — never mutate the input
    const updated = deepClone(wordProgress);
    const now = getNow();

    // Update statistics regardless of card state
    updated.times_reviewed += 1;
    updated.last_review_date = now.toISOString();

    // Track answer quality numerically for confidence history
    const qualityNumeric = { again: 0, hard: 2, good: 4, easy: 5 }[quality];
    updated.answer_quality_history = [
        ...updated.answer_quality_history,
        qualityNumeric,
    ].slice(-10); // Keep last 10

    // Track session result for recent_sessions
    const sessionPassed = quality !== ANSWER_QUALITY.AGAIN;
    updated.recent_sessions = [
        ...updated.recent_sessions,
        sessionPassed ? 1 : 0,
    ].slice(-10); // Keep last 10

    // Route to correct handler based on card state
    switch (updated.card_state) {
        case CARD_STATE.LEARNING:
            return processLearningAnswer(updated, quality, questionResults, now);

        case CARD_STATE.RELEARNING:
            return processRelearningAnswer(updated, quality, questionResults, now);

        case CARD_STATE.REVIEW:
            return processReviewAnswer(updated, quality, questionResults, now);

        default:
            console.warn('[scheduler] Unexpected card_state:', updated.card_state);
            return updated;
    }
};

// ─────────────────────────────────────────────
// LEARNING PHASE HANDLER
// ─────────────────────────────────────────────

/**
 * Handle answer for a word in the LEARNING phase.
 *
 * AGAIN → Reset to step 0 (show immediately)
 * HARD  → Stay at current step, show again soon
 * GOOD  → Advance to next step (or graduate if last step)
 * EASY  → Graduate immediately with easy interval
 */
const processLearningAnswer = (word, quality, questionResults, now) => {
    const steps = LEARNING_STEPS_MINUTES;

    if (quality === ANSWER_QUALITY.AGAIN) {
        // Failed — restart learning from step 0
        word.learning_step = 0;
        word.due_date = addMinutes(now, steps[0]);
        // No confidence update for AGAIN in learning
        return word;
    }

    if (quality === ANSWER_QUALITY.EASY) {
        // Skip all remaining steps — graduate with easy interval
        return graduateWord(word, EASY_GRADUATING_INTERVAL, questionResults, now);
    }

    if (quality === ANSWER_QUALITY.HARD) {
        // Stay at current step but show sooner
        // Use half the normal interval for this step
        const currentStepMinutes = steps[word.learning_step] || steps[0];
        word.due_date = addMinutes(now, Math.max(1, currentStepMinutes * 0.5));
        return word;
    }

    // GOOD: Advance to next step
    const nextStep = word.learning_step + 1;

    if (nextStep >= steps.length) {
        // Completed all steps — graduate
        return graduateWord(word, GRADUATING_INTERVAL, questionResults, now);
    }

    // Move to next step
    word.learning_step = nextStep;
    word.due_date = addMinutes(now, steps[nextStep]);
    return word;
};

// ─────────────────────────────────────────────
// RELEARNING PHASE HANDLER
// ─────────────────────────────────────────────

/**
 * Handle answer for a word in RELEARNING phase (failed a review).
 *
 * Same logic as learning but uses RELEARNING_STEPS_MINUTES.
 * On completion → return to REVIEW with reduced interval.
 */
const processRelearningAnswer = (word, quality, questionResults, now) => {
    const steps = RELEARNING_STEPS_MINUTES;

    if (quality === ANSWER_QUALITY.AGAIN) {
        // Failed again — restart relearning
        word.learning_step = 0;
        word.due_date = addMinutes(now, steps[0]);
        return word;
    }

    if (quality === ANSWER_QUALITY.EASY || quality === ANSWER_QUALITY.GOOD) {
        // Completed relearning — return to review with reduced interval
        const newInterval = Math.max(
            LAPSE_SETTINGS.minimum_interval,
            Math.round(word.interval * LAPSE_SETTINGS.new_interval_factor)
        );
        word.card_state = CARD_STATE.REVIEW;
        word.learning_step = 0;
        word.interval = newInterval;
        word.due_date = addDays(now, newInterval);

        // Recalculate confidence after relearning
        word = updateConfidenceFields(word, questionResults);
        return word;
    }

    if (quality === ANSWER_QUALITY.HARD) {
        // Struggling in relearning — stay at current step
        const currentStepMinutes = steps[word.learning_step] || steps[0];
        word.due_date = addMinutes(now, currentStepMinutes);
        return word;
    }

    return word;
};

// ─────────────────────────────────────────────
// REVIEW PHASE HANDLER
// ─────────────────────────────────────────────

/**
 * Handle answer for a word in REVIEW phase.
 *
 * This is where the two-schedule system splits:
 * - is_in_first_two_weeks: use fixed schedule
 * - !is_in_first_two_weeks: use Anki interval × ease factor
 */
const processReviewAnswer = (word, quality, questionResults, now) => {
    if (quality === ANSWER_QUALITY.AGAIN) {
        // Failed — send to relearning
        return processLapse(word, questionResults, now);
    }

    // Update ease factor (only affects standard Anki phase)
    word.ease_factor = updateEaseFactor(word.ease_factor, quality);

    if (word.is_in_first_two_weeks) {
        return processFirstTwoWeeksReview(word, quality, questionResults, now);
    } else {
        return processStandardAnkiReview(word, quality, questionResults, now);
    }
};

/**
 * First two weeks schedule handler.
 * Advances through FIRST_TWO_WEEKS_SCHEDULE positions.
 *
 * HARD → Stay at current position (repeat same interval)
 * GOOD → Advance to next position
 * EASY → Skip one position ahead
 */
const processFirstTwoWeeksReview = (word, quality, questionResults, now) => {
    const schedule = FIRST_TWO_WEEKS_SCHEDULE;
    let nextIndex = word.first_two_weeks_index;

    if (quality === ANSWER_QUALITY.HARD) {
        // Struggling — repeat this position
        // Don't advance the index
        nextIndex = word.first_two_weeks_index;
    } else if (quality === ANSWER_QUALITY.GOOD) {
        // Normal progression
        nextIndex = word.first_two_weeks_index + 1;
    } else if (quality === ANSWER_QUALITY.EASY) {
        // Doing well — skip one position ahead
        nextIndex = Math.min(
            word.first_two_weeks_index + 2,
            schedule.length // Cap at end of schedule
        );
    }

    // Check if we've completed the first two weeks schedule
    if (nextIndex >= schedule.length) {
        // Transition to standard Anki phase
        word.is_in_first_two_weeks = false;
        word.first_two_weeks_index = schedule.length; // Mark as completed

        // Set interval to the last first-two-weeks interval as starting point
        word.interval = schedule[schedule.length - 1];
        word.due_date = addDays(now, word.interval);

    } else {
        // Still in first two weeks
        word.first_two_weeks_index = nextIndex;
        word.interval = schedule[nextIndex];
        word.due_date = addDays(now, schedule[nextIndex]);
    }

    word = updateConfidenceFields(word, questionResults);
    return word;
};

/**
 * Standard Anki interval calculation (after first two weeks).
 *
 * HARD → interval × INTERVAL_MULTIPLIER.hard (1.2)
 * GOOD → interval × ease_factor
 * EASY → interval × ease_factor × INTERVAL_MULTIPLIER.easy (1.3)
 */
const processStandardAnkiReview = (word, quality, questionResults, now) => {
    let newInterval;

    switch (quality) {
        case ANSWER_QUALITY.HARD:
            newInterval = word.interval * INTERVAL_MULTIPLIER.hard;
            break;

        case ANSWER_QUALITY.GOOD:
            newInterval = word.interval * word.ease_factor;
            break;

        case ANSWER_QUALITY.EASY:
            newInterval = word.interval * word.ease_factor * INTERVAL_MULTIPLIER.easy;
            break;

        default:
            newInterval = word.interval * word.ease_factor;
    }

    // Apply cap
    newInterval = Math.min(Math.round(newInterval), MAX_INTERVAL_DAYS);
    newInterval = Math.max(1, newInterval); // Never less than 1 day

    word.interval = newInterval;
    word.due_date = addDays(now, newInterval);

    word = updateConfidenceFields(word, questionResults);
    return word;
};

// ─────────────────────────────────────────────
// GRADUATION
// ─────────────────────────────────────────────

/**
 * Graduate a word from learning to review phase.
 * This is a significant milestone — word enters spaced repetition.
 *
 * @param {Object} word - Word progress (cloned already)
 * @param {number} interval - First review interval in days
 * @param {Array} questionResults - For confidence update
 * @param {Date} now - Current time
 */
const graduateWord = (word, interval, questionResults, now) => {
    word.card_state = CARD_STATE.REVIEW;
    word.learning_step = 0;
    word.interval = interval;
    word.first_two_weeks_index = 0;      // Start at beginning of first-two-weeks
    word.is_in_first_two_weeks = true;   // Enter aggressive schedule
    word.graduated_date = now.toISOString();
    word.due_date = addDays(now, interval);

    // One-time graduation confidence bonus
    word.confidence = Math.min(100, (word.confidence || 0) + CONFIDENCE_MODIFIERS.graduation_bonus);

    // Update confidence with fresh calculation
    word = updateConfidenceFields(word, questionResults);

    return word;
};

// ─────────────────────────────────────────────
// LAPSE (FAILED REVIEW)
// ─────────────────────────────────────────────

/**
 * Process a failed review (AGAIN on a review card).
 * Sends word back to relearning phase.
 */
const processLapse = (word, questionResults, now) => {
    word.card_state = CARD_STATE.RELEARNING;
    word.learning_step = 0;
    word.lapses += 1;

    // Ease factor penalty on lapse
    word.ease_factor = Math.max(
        EASE_FACTOR.MINIMUM,
        word.ease_factor + EASE_FACTOR.ADJUSTMENT.again
    );

    // Show first relearning step immediately
    word.due_date = addMinutes(now, RELEARNING_STEPS_MINUTES[0]);

    // Confidence takes a hit on lapse
    word = updateConfidenceFields(word, questionResults);

    return word;
};

// ─────────────────────────────────────────────
// EASE FACTOR
// ─────────────────────────────────────────────

/**
 * Update ease factor based on answer quality.
 * Bounded between EASE_FACTOR.MINIMUM and EASE_FACTOR.MAXIMUM.
 *
 * Note: Ease factor only meaningfully affects scheduling
 * in the standard Anki phase (after first two weeks).
 * But we update it throughout to track word difficulty.
 */
export const updateEaseFactor = (currentEase, quality) => {
    const adjustment = EASE_FACTOR.ADJUSTMENT[quality] || 0;
    const newEase = currentEase + adjustment;
    return Math.max(EASE_FACTOR.MINIMUM, Math.min(EASE_FACTOR.MAXIMUM, newEase));
};

// ─────────────────────────────────────────────
// FIRST EXPOSURE (mark word as seen)
// ─────────────────────────────────────────────

/**
 * Process the very first time a user sees a word.
 * Transitions from NEW → LEARNING and schedules step 0.
 *
 * @param {Object} wordProgress - Current word progress
 * @returns {Object} Updated word progress
 */
export const processFirstExposure = (wordProgress) => {
    const updated = deepClone(wordProgress);
    const now = getNow();

    updated.card_state = CARD_STATE.LEARNING;
    updated.learning_step = 0;
    updated.times_seen += 1;
    updated.first_seen_date = updated.first_seen_date || now.toISOString();
    updated.last_seen_date = now.toISOString();

    // Step 0 = show immediately (0 minutes)
    updated.due_date = addMinutes(now, LEARNING_STEPS_MINUTES[0]);

    return updated;
};

// ─────────────────────────────────────────────
// CONFIDENCE UPDATE
// ─────────────────────────────────────────────

/**
 * Update all confidence-related fields on a word progress object.
 * Called after every answer processed.
 */
const updateConfidenceFields = (word, questionResults) => {
    const oldConfidence = word.confidence;
    const newConfidence = calculateConfidence(word);

    word.confidence = newConfidence;
    word.confidence_trend = calculateConfidenceTrend(oldConfidence, newConfidence);
    word.mastery_level = getMasteryLevel(newConfidence);

    return word;
};

// ─────────────────────────────────────────────
// UTILITY
// ─────────────────────────────────────────────

/**
 * Deep clone a word progress object.
 * Prevents mutation of the original.
 */
const deepClone = (obj) => JSON.parse(JSON.stringify(obj));

/**
 * Get a human-readable summary of a word's scheduling status.
 * Useful for debugging and DevTools display.
 *
 * @param {Object} wordProgress
 * @returns {Object} Summary object
 */
export const getSchedulingSummary = (wordProgress) => {
    const now = getNow();
    const dueDate = wordProgress.due_date ? new Date(wordProgress.due_date) : null;
    const daysDue = dueDate
        ? Math.round((dueDate - now) / 86400000)
        : null;

    return {
        word_id: wordProgress.word_id,
        card_state: wordProgress.card_state,
        confidence: wordProgress.confidence,
        mastery_level: wordProgress.mastery_level,
        ease_factor: wordProgress.ease_factor.toFixed(2),
        interval_days: wordProgress.interval,
        is_in_first_two_weeks: wordProgress.is_in_first_two_weeks,
        two_weeks_position: wordProgress.first_two_weeks_index,
        lapses: wordProgress.lapses,
        due_in_days: daysDue,
        is_due_now: dueDate ? dueDate <= now : false,
        times_reviewed: wordProgress.times_reviewed,
    };
};
