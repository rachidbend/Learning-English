/**
 * qualityCalculator.js
 *
 * Converts raw quiz performance data into an answer quality rating
 * (AGAIN / HARD / GOOD / EASY) without any user self-assessment.
 *
 * This is called AFTER all questions for a word are complete in a session.
 * It receives the array of question results and returns a quality rating.
 */

import {
    ANSWER_QUALITY,
    QUALITY_THRESHOLDS,
    SPEED_THRESHOLDS,
    QUESTIONS_PER_REVIEW,
} from '../data/progressSchema';

// ─────────────────────────────────────────────
// MAIN EXPORT: calculateAnswerQuality
// ─────────────────────────────────────────────

/**
 * Calculate answer quality from a set of question results for one word.
 *
 * @param {Array} questionResults - Array of results for this word this session
 *   Each result: { correct: bool, time_ms: number, question_type: string }
 * @param {Object} wordProgress - Current word progress object (for context)
 * @returns {string} ANSWER_QUALITY value: 'again'|'hard'|'good'|'easy'
 *
 * @example
 * calculateAnswerQuality(
 *   [
 *     { correct: true,  time_ms: 2100, question_type: 'translation_match' },
 *     { correct: false, time_ms: 8200, question_type: 'reverse_translation' },
 *     { correct: true,  time_ms: 3800, question_type: 'sentence_completion' },
 *   ],
 *   wordProgress
 * )
 * // → 'hard' (2/3 correct, one slow, one wrong)
 */
export const calculateAnswerQuality = (questionResults, wordProgress) => {
    if (!questionResults || questionResults.length === 0) {
        // No data — default to AGAIN (conservative)
        return ANSWER_QUALITY.AGAIN;
    }

    // Calculate component scores
    const accuracyScore = calculateAccuracyScore(questionResults);
    const speedScore = calculateSpeedScore(questionResults);
    const consistencyScore = calculateConsistencyScore(questionResults);

    // Weighted performance score (0-100)
    const performanceScore = (
        accuracyScore * 0.60 +   // Accuracy is primary driver
        speedScore * 0.25 +   // Speed indicates automaticity
        consistencyScore * 0.15     // Consistency catches lucky guesses
    );

    // Map performance score to answer quality
    return mapScoreToQuality(performanceScore);
};

// ─────────────────────────────────────────────
// COMPONENT SCORE CALCULATORS
// ─────────────────────────────────────────────

/**
 * Accuracy Score (0-100)
 * Simple percentage of correct answers.
 * First question failure is weighted more heavily —
 * if the user can't get the easiest question right,
 * that's a strong signal.
 */
export const calculateAccuracyScore = (questionResults) => {
    if (!questionResults.length) return 0;

    const total = questionResults.length;
    const correct = questionResults.filter(r => r.correct).length;

    // Base accuracy
    const baseAccuracy = (correct / total) * 100;

    // First question penalty: if Q1 is wrong, apply a penalty
    // Q1 is always the easiest (translation match)
    const firstResult = questionResults[0];
    const firstQuestionPenalty = firstResult && !firstResult.correct ? 15 : 0;

    return Math.max(0, baseAccuracy - firstQuestionPenalty);
};

/**
 * Speed Score (0-100)
 * Measures answer automaticity.
 * Fast answers indicate stronger memory traces.
 *
 * < 3s  = 100 (automatic recall)
 * 3-5s  = 80  (confident recall)
 * 5-8s  = 60  (effortful recall)
 * > 8s  = 40  (struggled to recall)
 *
 * Uses the AVERAGE time across all correct answers only.
 * Wrong answers are excluded (they inflate time but aren't informative
 * about recall speed — the user may have guessed or given up).
 */
export const calculateSpeedScore = (questionResults) => {
    const correctAnswers = questionResults.filter(r => r.correct && r.time_ms);

    if (!correctAnswers.length) return 40; // No correct answers → worst speed

    const avgTime = correctAnswers.reduce((sum, r) => sum + r.time_ms, 0) /
        correctAnswers.length;

    const avgSeconds = avgTime / 1000;

    if (avgSeconds < SPEED_THRESHOLDS.fast) return 100;
    if (avgSeconds < SPEED_THRESHOLDS.good) return 80;
    if (avgSeconds < SPEED_THRESHOLDS.slow) return 60;
    return 40;
};

/**
 * Consistency Score (0-100)
 * Detects if user struggled with the same question type repeatedly,
 * which is a stronger signal than a single miss.
 *
 * All correct → 100
 * Mixed results but no pattern → 80
 * Same question type wrong twice → 50
 * Failed the hardest question type (sentence_completion) → penalty
 */
export const calculateConsistencyScore = (questionResults) => {
    if (!questionResults.length) return 0;

    const wrong = questionResults.filter(r => !r.correct);

    if (!wrong.length) return 100; // Perfect — full consistency

    // Check for repeated failure on same question type
    const wrongByType = {};
    wrong.forEach(r => {
        wrongByType[r.question_type] = (wrongByType[r.question_type] || 0) + 1;
    });

    const repeatedFailureTypes = Object.values(wrongByType).filter(n => n > 1).length;

    // Check if harder question types were failed
    const failedSentenceCompletion = wrong.some(
        r => r.question_type === 'sentence_completion'
    );

    let score = 100;
    score -= wrong.length * 10;                    // -10 per wrong answer
    score -= repeatedFailureTypes * 20;            // -20 for repeated type failure
    score -= failedSentenceCompletion ? 10 : 0;    // -10 for hard type failure

    return Math.max(0, score);
};

// ─────────────────────────────────────────────
// QUALITY MAPPING
// ─────────────────────────────────────────────

/**
 * Map a performance score (0-100) to an answer quality string.
 *
 * 0-40   → AGAIN  (failed session, back to learning)
 * 41-65  → HARD   (struggled, short interval)
 * 66-85  → GOOD   (normal performance, standard interval)
 * 86-100 → EASY   (excellent performance, longer interval)
 */
export const mapScoreToQuality = (score) => {
    if (score <= QUALITY_THRESHOLDS.AGAIN_MAX) return ANSWER_QUALITY.AGAIN;
    if (score <= QUALITY_THRESHOLDS.HARD_MAX) return ANSWER_QUALITY.HARD;
    if (score <= QUALITY_THRESHOLDS.GOOD_MAX) return ANSWER_QUALITY.GOOD;
    return ANSWER_QUALITY.EASY;
};

/**
 * Determine how many questions to ask for a word this review session.
 * Based on card state and current confidence level.
 *
 * @param {Object} wordProgress
 * @returns {number} Number of questions to ask (2-5)
 */
export const getQuestionsForWord = (wordProgress) => {
    const { card_state, confidence } = wordProgress;

    // Just failed a review and is relearning
    if (card_state === 'relearning') {
        return QUESTIONS_PER_REVIEW.after_lapse;
    }

    // Fresh graduate from learning phase
    // Detect by: first_two_weeks_index === 0 (first review ever)
    if (card_state === 'review' && wordProgress.first_two_weeks_index === 0) {
        return QUESTIONS_PER_REVIEW.new_graduate;
    }

    // Low confidence review word
    if (confidence < 50) {
        return QUESTIONS_PER_REVIEW.review_low;
    }

    // Mastered word — quick check
    if (confidence >= 90) {
        return QUESTIONS_PER_REVIEW.review_mastered;
    }

    // Standard review
    return QUESTIONS_PER_REVIEW.review_normal;
};

/**
 * Get question difficulty order for a review session on one word.
 * Questions go from easiest to hardest within a word's review set.
 *
 * Q1: translation_match (easiest — see word, pick Arabic)
 * Q2: reverse_translation (easy — see Arabic, pick English)
 * Q3: sentence_completion (medium — fill in the blank)
 * Q4: sentence_completion (harder — different context sentence)
 * Q5: reverse_translation (for lapses — stress test)
 *
 * @param {number} count - How many questions to generate
 * @returns {string[]} Array of question_type strings in order
 */
export const getQuestionOrder = (count) => {
    const allTypes = [
        'translation_match',        // Q1 - easiest
        'reverse_translation',      // Q2
        'sentence_completion',      // Q3
        'sentence_completion',      // Q4 - different sentence variant
        'reverse_translation',      // Q5 - stress test (for lapses)
    ];

    return allTypes.slice(0, count);
};
