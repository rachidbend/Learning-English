/**
 * confidenceCalculator.js
 *
 * Calculates the confidence score shown to the user (0-100%).
 * 
 * IMPORTANT: Confidence is the USER-FACING metric.
 * It does NOT directly drive scheduling.
 * Scheduling is driven by ease_factor + interval.
 * 
 * Confidence answers: "How well does the user know this word?"
 * Scheduling answers: "When should we show this word next?"
 * 
 * They are parallel systems that inform each other but are independent.
 */

import {
    CONFIDENCE_WEIGHTS,
    CONFIDENCE_MODIFIERS,
    SPEED_THRESHOLDS,
    MASTERY_LEVEL,
} from '../data/progressSchema';

// ─────────────────────────────────────────────
// MAIN EXPORT: calculateConfidence
// ─────────────────────────────────────────────

/**
 * Calculate the confidence score for a word.
 *
 * @param {Object} wordProgress - Current word progress object
 * @returns {number} Confidence score 0-100 (integer)
 *
 * @example
 * calculateConfidence({
 *   times_correct: 8,
 *   times_wrong: 2,
 *   recent_sessions: [1,1,0,1,1,1,1,0,1,1],
 *   answer_quality_history: [4,4,2,4,5,4,5,4,5,5],
 *   average_answer_time: 3200,
 *   lapses: 0,
 *   card_state: 'review',
 * })
 * // → 78
 */
export const calculateConfidence = (wordProgress) => {
    const {
        times_correct,
        times_wrong,
        recent_sessions,
        answer_quality_history,
        average_answer_time,
        lapses,
        card_state,
    } = wordProgress;

    // Can't have confidence on a new word
    if (card_state === 'new') return 0;

    // === COMPONENT 1: LIFETIME ACCURACY (30%) ===
    const totalAttempts = (times_correct || 0) + (times_wrong || 0);
    const lifetimeAccuracy = totalAttempts > 0
        ? ((times_correct || 0) / totalAttempts) * 100
        : 0;

    // === COMPONENT 2: RECENT ACCURACY (40%) ===
    // recent_sessions is array of 1s and 0s (last 10 sessions)
    // More recent = more weight (later items weighted more)
    const recentAccuracy = calculateWeightedRecentAccuracy(recent_sessions || []);

    // === COMPONENT 3: ANSWER QUALITY (20%) ===
    // answer_quality_history stores numeric quality:
    // again=0, hard=2, good=4, easy=5
    const qualityScore = calculateQualityScore(answer_quality_history || []);

    // === COMPONENT 4: SPEED (10%) ===
    const speedScore = calculateSpeedComponent(average_answer_time);

    // === WEIGHTED COMBINATION ===
    const rawConfidence = (
        lifetimeAccuracy * CONFIDENCE_WEIGHTS.lifetime_accuracy +
        recentAccuracy * CONFIDENCE_WEIGHTS.recent_accuracy +
        qualityScore * CONFIDENCE_WEIGHTS.answer_quality +
        speedScore * CONFIDENCE_WEIGHTS.speed
    );

    // === MODIFIERS ===
    let finalConfidence = rawConfidence;

    // Lapse penalty: -5 per lapse, max -20
    const lapsePenalty = Math.min(
        (lapses || 0) * CONFIDENCE_MODIFIERS.lapse_penalty,
        CONFIDENCE_MODIFIERS.lapse_penalty_max
    );
    finalConfidence -= lapsePenalty;

    // Streak bonus: +3 if last 5 sessions all correct
    const recentFive = (recent_sessions || []).slice(-5);
    if (recentFive.length === 5 && recentFive.every(s => s === 1)) {
        finalConfidence += CONFIDENCE_MODIFIERS.streak_bonus;
    }

    // Graduation bonus is applied externally when word first graduates
    // (see scheduler.js graduateWord) — not re-applied here

    // === CLAMP AND ROUND ===
    return Math.round(Math.max(0, Math.min(100, finalConfidence)));
};

/**
 * Calculate the change in confidence after an update.
 * Returns the delta (positive or negative).
 *
 * @param {number} oldConfidence
 * @param {number} newConfidence
 * @returns {number} delta
 */
export const calculateConfidenceTrend = (oldConfidence, newConfidence) => {
    return newConfidence - oldConfidence;
};

/**
 * Derive mastery level from confidence score.
 *
 * @param {number} confidence
 * @returns {string} MASTERY_LEVEL value
 */
export const getMasteryLevel = (confidence) => {
    if (confidence <= 0) return MASTERY_LEVEL.UNSEEN;
    if (confidence < 30) return MASTERY_LEVEL.STARTING;
    if (confidence < 60) return MASTERY_LEVEL.LEARNING;
    if (confidence < 80) return MASTERY_LEVEL.GETTING_THERE;
    if (confidence < 90) return MASTERY_LEVEL.STRONG;
    return MASTERY_LEVEL.MASTERED;
};

/**
 * Get display metadata for a mastery level.
 *
 * @param {string} masteryLevel - MASTERY_LEVEL value
 * @returns {Object} { label, icon, color }
 */
export const getMasteryDisplay = (masteryLevel) => {
    const displays = {
        [MASTERY_LEVEL.UNSEEN]: { label: 'Not Studied', icon: '📝', color: 'gray' },
        [MASTERY_LEVEL.STARTING]: { label: 'Starting Out', icon: '🔴', color: 'red' },
        [MASTERY_LEVEL.LEARNING]: { label: 'Learning', icon: '🟠', color: 'orange' },
        [MASTERY_LEVEL.GETTING_THERE]: { label: 'Getting There', icon: '🟡', color: 'yellow' },
        [MASTERY_LEVEL.STRONG]: { label: 'Strong', icon: '🟢', color: 'green' },
        [MASTERY_LEVEL.MASTERED]: { label: 'Mastered', icon: '⭐', color: 'blue' },
    };
    return displays[masteryLevel] || displays[MASTERY_LEVEL.UNSEEN];
};

// ─────────────────────────────────────────────
// PRIVATE HELPERS
// ─────────────────────────────────────────────

/**
 * Calculate weighted recent accuracy.
 * More recent sessions count more than older ones.
 * Uses linear weighting: last session = weight N, first = weight 1.
 *
 * Example with 4 sessions [1, 0, 1, 1]:
 * weights = [1, 2, 3, 4]
 * weighted sum = 1×1 + 0×2 + 1×3 + 1×4 = 8
 * max possible = 1+2+3+4 = 10
 * score = 8/10 × 100 = 80
 */
const calculateWeightedRecentAccuracy = (recentSessions) => {
    if (!recentSessions.length) return 0;

    let weightedSum = 0;
    let maxPossible = 0;

    recentSessions.forEach((result, index) => {
        const weight = index + 1; // Linear weight, more recent = higher
        weightedSum += result * weight;
        maxPossible += weight;
    });

    return maxPossible > 0 ? (weightedSum / maxPossible) * 100 : 0;
};

/**
 * Calculate quality score from quality history.
 * Maps numeric quality values to 0-100 scale.
 * again=0→0, hard=2→40, good=4→80, easy=5→100
 */
const calculateQualityScore = (qualityHistory) => {
    if (!qualityHistory.length) return 50; // No history = neutral

    const avg = qualityHistory.reduce((sum, q) => sum + q, 0) / qualityHistory.length;
    return (avg / 5) * 100; // Max quality value is 5 (easy)
};

/**
 * Calculate speed score from average answer time.
 * time_ms is in milliseconds.
 *
 * < 3000ms = 100
 * < 5000ms = 80
 * < 8000ms = 60
 * >= 8000ms = 40
 */
const calculateSpeedComponent = (average_answer_time) => {
    if (!average_answer_time) return 70; // No data = neutral-ish

    const seconds = average_answer_time / 1000;

    if (seconds < SPEED_THRESHOLDS.fast) return 100;
    if (seconds < SPEED_THRESHOLDS.good) return 80;
    if (seconds < SPEED_THRESHOLDS.slow) return 60;
    return 40;
};
