/**
 * scheduling.test.js
 *
 * Comprehensive automated tests for the spaced repetition scheduling engine.
 * Covers: Learning phase, First Two Weeks, Standard Anki, Ease Factor, Lapses,
 *         Quality Calculator, Confidence Calculator, Mastery Levels, Session Builder.
 *
 * Run: npx vitest run src/tests/scheduling.test.js
 */

import { describe, it, expect as vitestExpect } from 'vitest';

import {
    processFirstExposure,
    processAnswer,
    updateEaseFactor,
    getSchedulingSummary,
} from '../engine/scheduler';

import {
    calculateAnswerQuality,
    getQuestionsForWord,
    getQuestionOrder,
} from '../engine/qualityCalculator';

import {
    calculateConfidence,
    getMasteryLevel,
} from '../engine/confidenceCalculator';

import { buildSession } from '../engine/sessionBuilder';

import {
    createWordProgress,
    createInitialProgress,
    CARD_STATE,
    ANSWER_QUALITY,
    EASE_FACTOR,
    FIRST_TWO_WEEKS_SCHEDULE,
    LEARNING_STEPS_MINUTES,
    RELEARNING_STEPS_MINUTES,
    MAX_INTERVAL_DAYS,
    LAPSE_SETTINGS,
} from '../data/progressSchema';


// ═══════════════════════════════════════════
// LEARNING PHASE TESTS
// ═══════════════════════════════════════════

describe('Learning Phase', () => {
    it('should transition NEW → LEARNING on first exposure', () => {
        const word = createWordProgress(1, 1);
        vitestExpect(word.card_state).toBe(CARD_STATE.NEW);

        const updated = processFirstExposure(word);
        vitestExpect(updated.card_state).toBe(CARD_STATE.LEARNING);
        vitestExpect(updated.learning_step).toBe(0);
        vitestExpect(updated.times_seen).toBe(1);
    });

    it('should advance learning step on GOOD answer', () => {
        let word = createWordProgress(1, 1);
        word = processFirstExposure(word);

        const before = word.learning_step;
        const updated = processAnswer(word, ANSWER_QUALITY.GOOD, []);

        vitestExpect(updated.learning_step).toBe(before + 1);
    });

    it('should restart learning step on AGAIN answer', () => {
        let word = createWordProgress(1, 1);
        word = processFirstExposure(word);
        word.learning_step = 2; // Advance to step 2

        const updated = processAnswer(word, ANSWER_QUALITY.AGAIN, []);
        vitestExpect(updated.learning_step).toBe(0);
    });

    it('should graduate after completing all learning steps', () => {
        let word = createWordProgress(1, 1);
        word = processFirstExposure(word);

        // Pass all learning steps
        for (let i = 0; i < LEARNING_STEPS_MINUTES.length; i++) {
            word = processAnswer(word, ANSWER_QUALITY.GOOD, []);
        }

        vitestExpect(word.card_state).toBe(CARD_STATE.REVIEW);
        vitestExpect(word.graduated_date).toBeTruthy();
        vitestExpect(word.is_in_first_two_weeks).toBe(true);
        vitestExpect(word.first_two_weeks_index).toBe(0);
    });

    it('should graduate immediately on EASY during learning', () => {
        let word = createWordProgress(1, 1);
        word = processFirstExposure(word);

        const updated = processAnswer(word, ANSWER_QUALITY.EASY, []);

        vitestExpect(updated.card_state).toBe(CARD_STATE.REVIEW);
        vitestExpect(updated.interval).toBeGreaterThan(0);
    });

    it('should not change state for HARD during learning', () => {
        let word = createWordProgress(1, 1);
        word = processFirstExposure(word);
        const step = word.learning_step;

        const updated = processAnswer(word, ANSWER_QUALITY.HARD, []);

        vitestExpect(updated.card_state).toBe(CARD_STATE.LEARNING);
        vitestExpect(updated.learning_step).toBe(step); // Same step
    });

    it('should set due_date on first exposure', () => {
        const word = createWordProgress(1, 1);
        const updated = processFirstExposure(word);

        vitestExpect(updated.due_date).toBeTruthy();
    });
});


// ═══════════════════════════════════════════
// FIRST TWO WEEKS SCHEDULE TESTS
// ═══════════════════════════════════════════

describe('First Two Weeks Schedule', () => {
    const makeReviewWord = (index = 0) => {
        const word = createWordProgress(1, 1);
        word.card_state = CARD_STATE.REVIEW;
        word.is_in_first_two_weeks = true;
        word.first_two_weeks_index = index;
        word.interval = FIRST_TWO_WEEKS_SCHEDULE[index] || 1;
        word.ease_factor = EASE_FACTOR.DEFAULT;
        word.due_date = new Date(Date.now() - 3600000).toISOString();
        word.graduated_date = new Date(Date.now() - 86400000 * 7).toISOString();
        return word;
    };

    it('should advance position on GOOD answer', () => {
        const word = makeReviewWord(2);
        const updated = processAnswer(word, ANSWER_QUALITY.GOOD, []);

        vitestExpect(updated.first_two_weeks_index).toBe(3);
        vitestExpect(updated.interval).toBe(FIRST_TWO_WEEKS_SCHEDULE[3]);
    });

    it('should stay at same position on HARD answer', () => {
        const word = makeReviewWord(2);
        const updated = processAnswer(word, ANSWER_QUALITY.HARD, []);

        vitestExpect(updated.first_two_weeks_index).toBe(2);
        vitestExpect(updated.interval).toBe(FIRST_TWO_WEEKS_SCHEDULE[2]);
    });

    it('should skip position on EASY answer', () => {
        const word = makeReviewWord(2);
        const updated = processAnswer(word, ANSWER_QUALITY.EASY, []);

        vitestExpect(updated.first_two_weeks_index).toBeGreaterThan(3);
    });

    it('should transition to standard Anki after completing schedule', () => {
        const lastIndex = FIRST_TWO_WEEKS_SCHEDULE.length - 1;
        const word = makeReviewWord(lastIndex);
        const updated = processAnswer(word, ANSWER_QUALITY.GOOD, []);

        vitestExpect(updated.is_in_first_two_weeks).toBe(false);
    });

    it('should handle AGAIN correctly in first two weeks', () => {
        const word = makeReviewWord(3);
        const updated = processAnswer(word, ANSWER_QUALITY.AGAIN, []);

        vitestExpect(updated.card_state).toBe(CARD_STATE.RELEARNING);
        vitestExpect(updated.lapses).toBe(1);
    });

    it('should traverse entire first two weeks schedule', () => {
        let word = makeReviewWord(0);

        for (let i = 0; i < FIRST_TWO_WEEKS_SCHEDULE.length; i++) {
            word.due_date = new Date(Date.now() - 3600000).toISOString();
            word = processAnswer(word, ANSWER_QUALITY.GOOD, []);
        }

        vitestExpect(word.is_in_first_two_weeks).toBe(false);
        vitestExpect(word.card_state).toBe(CARD_STATE.REVIEW);
    });
});


// ═══════════════════════════════════════════
// STANDARD ANKI TESTS
// ═══════════════════════════════════════════

describe('Standard Anki Phase', () => {
    const makeAnkiWord = (interval = 10, ease = 2.5) => {
        const word = createWordProgress(1, 1);
        word.card_state = CARD_STATE.REVIEW;
        word.is_in_first_two_weeks = false;
        word.first_two_weeks_index = FIRST_TWO_WEEKS_SCHEDULE.length;
        word.interval = interval;
        word.ease_factor = ease;
        word.due_date = new Date(Date.now() - 3600000).toISOString();
        word.graduated_date = new Date(Date.now() - 86400000 * 30).toISOString();
        return word;
    };

    it('should calculate interval = previous × ease_factor on GOOD', () => {
        const word = makeAnkiWord(10, 2.5);
        const updated = processAnswer(word, ANSWER_QUALITY.GOOD, []);

        vitestExpect(updated.interval).toBe(25); // 10 × 2.5
    });

    it('should calculate interval = previous × 1.2 on HARD', () => {
        const word = makeAnkiWord(10, 2.5);
        const updated = processAnswer(word, ANSWER_QUALITY.HARD, []);

        vitestExpect(updated.interval).toBe(12); // 10 × 1.2
    });

    it('should calculate interval = previous × ease × 1.3 on EASY', () => {
        const word = makeAnkiWord(10, 2.0);
        const updated = processAnswer(word, ANSWER_QUALITY.EASY, []);

        // Ease factor gets +0.15 bump BEFORE interval calc:
        // new_ease = 2.0 + 0.15 = 2.15
        // interval = round(10 × 2.15 × 1.3) = round(27.95) = 28
        const newEase = 2.0 + EASE_FACTOR.ADJUSTMENT.easy; // 2.15
        const expected = Math.round(10 * newEase * 1.3);
        vitestExpect(updated.interval).toBe(expected); // 28
    });

    it('should cap interval at MAX_INTERVAL_DAYS', () => {
        const word = makeAnkiWord(170, 2.5);
        const updated = processAnswer(word, ANSWER_QUALITY.GOOD, []);

        vitestExpect(updated.interval).toBeLessThanOrEqual(MAX_INTERVAL_DAYS);
    });

    it('should set due_date in the future', () => {
        const word = makeAnkiWord(10, 2.5);
        const updated = processAnswer(word, ANSWER_QUALITY.GOOD, []);

        vitestExpect(new Date(updated.due_date).getTime()).toBeGreaterThan(Date.now());
    });
});


// ═══════════════════════════════════════════
// EASE FACTOR TESTS
// ═══════════════════════════════════════════

describe('Ease Factor Updates', () => {
    it('should decrease ease factor on AGAIN', () => {
        const after = updateEaseFactor(2.5, ANSWER_QUALITY.AGAIN);
        vitestExpect(after).toBeLessThan(2.5);
    });

    it('should decrease ease factor on HARD', () => {
        const after = updateEaseFactor(2.5, ANSWER_QUALITY.HARD);
        vitestExpect(after).toBeLessThan(2.5);
    });

    it('should not change ease factor on GOOD', () => {
        const after = updateEaseFactor(2.5, ANSWER_QUALITY.GOOD);
        vitestExpect(after).toBe(2.5);
    });

    it('should increase ease factor on EASY', () => {
        const after = updateEaseFactor(2.0, ANSWER_QUALITY.EASY);
        vitestExpect(after).toBeGreaterThan(2.0);
    });

    it('should never go below EASE_FACTOR.MINIMUM', () => {
        let ease = 1.4;
        for (let i = 0; i < 20; i++) {
            ease = updateEaseFactor(ease, ANSWER_QUALITY.AGAIN);
        }
        vitestExpect(ease).toBeGreaterThanOrEqual(EASE_FACTOR.MINIMUM);
    });

    it('should never go above EASE_FACTOR.MAXIMUM', () => {
        let ease = 2.4;
        for (let i = 0; i < 20; i++) {
            ease = updateEaseFactor(ease, ANSWER_QUALITY.EASY);
        }
        vitestExpect(ease).toBeLessThanOrEqual(EASE_FACTOR.MAXIMUM);
    });

    it('should apply correct adjustment amounts', () => {
        const baseEase = 2.0;
        vitestExpect(updateEaseFactor(baseEase, ANSWER_QUALITY.AGAIN))
            .toBeCloseTo(baseEase + EASE_FACTOR.ADJUSTMENT.again, 2);
        vitestExpect(updateEaseFactor(baseEase, ANSWER_QUALITY.HARD))
            .toBeCloseTo(baseEase + EASE_FACTOR.ADJUSTMENT.hard, 2);
        vitestExpect(updateEaseFactor(baseEase, ANSWER_QUALITY.EASY))
            .toBeCloseTo(baseEase + EASE_FACTOR.ADJUSTMENT.easy, 2);
    });
});


// ═══════════════════════════════════════════
// LAPSE TESTS
// ═══════════════════════════════════════════

describe('Lapses (Failed Reviews)', () => {
    const makeReviewWord = (interval = 30) => {
        const word = createWordProgress(1, 1);
        word.card_state = CARD_STATE.REVIEW;
        word.is_in_first_two_weeks = false;
        word.first_two_weeks_index = FIRST_TWO_WEEKS_SCHEDULE.length;
        word.interval = interval;
        word.ease_factor = 2.5;
        word.due_date = new Date(Date.now() - 3600000).toISOString();
        word.graduated_date = new Date(Date.now() - 86400000 * 60).toISOString();
        return word;
    };

    it('should send word to RELEARNING on AGAIN', () => {
        const word = makeReviewWord(30);
        const updated = processAnswer(word, ANSWER_QUALITY.AGAIN, []);

        vitestExpect(updated.card_state).toBe(CARD_STATE.RELEARNING);
        vitestExpect(updated.lapses).toBe(1);
    });

    it('should decrease ease factor on lapse', () => {
        const word = makeReviewWord(30);
        const updated = processAnswer(word, ANSWER_QUALITY.AGAIN, []);

        vitestExpect(updated.ease_factor).toBeLessThan(2.5);
    });

    it('should return to REVIEW after relearning steps', () => {
        let word = makeReviewWord(30);
        word = processAnswer(word, ANSWER_QUALITY.AGAIN, []); // → RELEARNING
        vitestExpect(word.card_state).toBe(CARD_STATE.RELEARNING);

        // Complete relearning
        for (let i = 0; i < RELEARNING_STEPS_MINUTES.length; i++) {
            word = processAnswer(word, ANSWER_QUALITY.GOOD, []);
        }

        vitestExpect(word.card_state).toBe(CARD_STATE.REVIEW);
    });

    it('should reduce interval after lapse + relearning', () => {
        let word = makeReviewWord(30);
        word = processAnswer(word, ANSWER_QUALITY.AGAIN, []);

        for (let i = 0; i < RELEARNING_STEPS_MINUTES.length; i++) {
            word = processAnswer(word, ANSWER_QUALITY.GOOD, []);
        }

        vitestExpect(word.interval).toBeLessThan(30);
    });

    it('should increment lapse count each time', () => {
        let word = makeReviewWord(30);
        word = processAnswer(word, ANSWER_QUALITY.AGAIN, []);
        vitestExpect(word.lapses).toBe(1);

        // Re-learn
        for (let i = 0; i < RELEARNING_STEPS_MINUTES.length; i++) {
            word = processAnswer(word, ANSWER_QUALITY.GOOD, []);
        }

        // Lapse again
        word.due_date = new Date(Date.now() - 3600000).toISOString();
        word = processAnswer(word, ANSWER_QUALITY.AGAIN, []);
        vitestExpect(word.lapses).toBe(2);
    });
});


// ═══════════════════════════════════════════
// QUALITY CALCULATOR TESTS
// ═══════════════════════════════════════════

describe('Answer Quality Calculator', () => {
    it('should return EASY for perfect fast performance', () => {
        const results = [
            { correct: true, time_ms: 2000, question_type: 'translation_match' },
            { correct: true, time_ms: 2200, question_type: 'reverse_translation' },
            { correct: true, time_ms: 2500, question_type: 'sentence_completion' },
        ];

        const quality = calculateAnswerQuality(results, {});
        vitestExpect(quality).toBe(ANSWER_QUALITY.EASY);
    });

    it('should return AGAIN for all wrong', () => {
        const results = [
            { correct: false, time_ms: 8000, question_type: 'translation_match' },
            { correct: false, time_ms: 9000, question_type: 'reverse_translation' },
        ];

        const quality = calculateAnswerQuality(results, {});
        vitestExpect(quality).toBe(ANSWER_QUALITY.AGAIN);
    });

    it('should return GOOD or HARD for mixed performance', () => {
        const results = [
            { correct: true, time_ms: 3000, question_type: 'translation_match' },
            { correct: false, time_ms: 6000, question_type: 'reverse_translation' },
            { correct: true, time_ms: 4000, question_type: 'sentence_completion' },
        ];

        const quality = calculateAnswerQuality(results, {});
        vitestExpect([ANSWER_QUALITY.HARD, ANSWER_QUALITY.GOOD]).toContain(quality);
    });

    it('should return string quality value', () => {
        const results = [
            { correct: true, time_ms: 3000, question_type: 'translation_match' },
        ];
        const quality = calculateAnswerQuality(results, {});
        vitestExpect(typeof quality).toBe('string');
        vitestExpect(['again', 'hard', 'good', 'easy']).toContain(quality);
    });
});


// ═══════════════════════════════════════════
// QUESTIONS FOR WORD
// ═══════════════════════════════════════════

describe('Questions Per Word', () => {
    it('should return a number between 2 and 5', () => {
        const word = createWordProgress(1, 1);
        word.card_state = CARD_STATE.REVIEW;
        word.confidence = 70;

        const count = getQuestionsForWord(word);
        vitestExpect(count).toBeGreaterThanOrEqual(2);
        vitestExpect(count).toBeLessThanOrEqual(5);
    });

    it('should give more questions to low-confidence words', () => {
        const lowConf = createWordProgress(1, 1);
        lowConf.card_state = CARD_STATE.REVIEW;
        lowConf.confidence = 20;

        const highConf = createWordProgress(2, 1);
        highConf.card_state = CARD_STATE.REVIEW;
        highConf.confidence = 90;

        vitestExpect(getQuestionsForWord(lowConf)).toBeGreaterThanOrEqual(
            getQuestionsForWord(highConf)
        );
    });
});


// ═══════════════════════════════════════════
// QUESTION ORDER
// ═══════════════════════════════════════════

describe('Question Order', () => {
    it('should return correct number of question types', () => {
        vitestExpect(getQuestionOrder(2)).toHaveLength(2);
        vitestExpect(getQuestionOrder(3)).toHaveLength(3);
        vitestExpect(getQuestionOrder(5)).toHaveLength(5);
    });

    it('should return string question types', () => {
        const order = getQuestionOrder(3);
        order.forEach(type => {
            vitestExpect(typeof type).toBe('string');
        });
    });
});


// ═══════════════════════════════════════════
// CONFIDENCE TESTS
// ═══════════════════════════════════════════

describe('Confidence Calculator', () => {
    it('should return 0 for NEW words', () => {
        const word = createWordProgress(1, 1);
        vitestExpect(calculateConfidence(word)).toBe(0);
    });

    it('should increase with correct answers', () => {
        const word = createWordProgress(1, 1);
        word.card_state = CARD_STATE.REVIEW;
        word.times_correct = 8;
        word.times_wrong = 2;
        word.recent_sessions = [1, 1, 1, 1, 1, 1, 0, 1, 1, 0];

        vitestExpect(calculateConfidence(word)).toBeGreaterThan(50);
    });

    it('should decrease with wrong answers', () => {
        const word = createWordProgress(1, 1);
        word.card_state = CARD_STATE.REVIEW;
        word.times_correct = 3;
        word.times_wrong = 7;
        word.recent_sessions = [0, 0, 1, 0, 0, 1, 0, 0, 0, 1];

        vitestExpect(calculateConfidence(word)).toBeLessThan(50);
    });

    it('should never exceed 100', () => {
        const word = createWordProgress(1, 1);
        word.card_state = CARD_STATE.REVIEW;
        word.times_correct = 100;
        word.times_wrong = 0;
        word.recent_sessions = Array(10).fill(1);
        word.answer_quality_history = Array(10).fill(5);
        word.average_answer_time = 1500;

        vitestExpect(calculateConfidence(word)).toBeLessThanOrEqual(100);
    });

    it('should never go below 0', () => {
        const word = createWordProgress(1, 1);
        word.card_state = CARD_STATE.REVIEW;
        word.times_correct = 0;
        word.times_wrong = 50;
        word.recent_sessions = Array(10).fill(0);
        word.lapses = 5;

        vitestExpect(calculateConfidence(word)).toBeGreaterThanOrEqual(0);
    });
});


// ═══════════════════════════════════════════
// MASTERY LEVEL TESTS
// ═══════════════════════════════════════════

describe('Mastery Level Mapping', () => {
    it('should map 0-29% to starting', () => {
        vitestExpect(getMasteryLevel(1)).toBe('starting');
        vitestExpect(getMasteryLevel(29)).toBe('starting');
    });

    it('should map 30-59% to learning', () => {
        vitestExpect(getMasteryLevel(30)).toBe('learning');
        vitestExpect(getMasteryLevel(59)).toBe('learning');
    });

    it('should map 60-79% to getting_there', () => {
        vitestExpect(getMasteryLevel(60)).toBe('getting_there');
        vitestExpect(getMasteryLevel(79)).toBe('getting_there');
    });

    it('should map 80-89% to strong', () => {
        vitestExpect(getMasteryLevel(80)).toBe('strong');
        vitestExpect(getMasteryLevel(89)).toBe('strong');
    });

    it('should map 90-100% to mastered', () => {
        vitestExpect(getMasteryLevel(90)).toBe('mastered');
        vitestExpect(getMasteryLevel(100)).toBe('mastered');
    });

    it('should map 0 to unseen', () => {
        vitestExpect(getMasteryLevel(0)).toBe('unseen');
    });
});


// ═══════════════════════════════════════════
// SESSION BUILDER TESTS
// ═══════════════════════════════════════════

describe('Session Builder', () => {
    it('should build session with due words', () => {
        const progress = createInitialProgress();

        for (let i = 1; i <= 3; i++) {
            const word = createWordProgress(i, 1);
            word.card_state = CARD_STATE.REVIEW;
            word.interval = 7;
            word.confidence = 70;
            word.ease_factor = 2.5;
            word.due_date = new Date(Date.now() - 3600000).toISOString();
            progress.wordProgress[i] = word;
        }

        const session = buildSession(progress);

        vitestExpect(session.review_words.length).toBe(3);
        vitestExpect(session.question_queue.length).toBeGreaterThan(0);
    });

    it('should return empty session when no words due', () => {
        const progress = createInitialProgress();

        // Add words that aren't due
        for (let i = 1; i <= 3; i++) {
            const word = createWordProgress(i, 1);
            word.card_state = CARD_STATE.REVIEW;
            word.interval = 7;
            word.due_date = new Date(Date.now() + 86400000 * 7).toISOString();
            progress.wordProgress[i] = word;
        }

        const session = buildSession(progress);
        vitestExpect(session.review_words.length).toBe(0);
    });

    it('should interleave questions from multiple words', () => {
        const progress = createInitialProgress();

        for (let i = 1; i <= 3; i++) {
            const word = createWordProgress(i, 1);
            word.card_state = CARD_STATE.REVIEW;
            word.confidence = 70;
            word.interval = 7;
            word.ease_factor = 2.5;
            word.due_date = new Date(Date.now() - 3600000).toISOString();
            progress.wordProgress[i] = word;
        }

        const session = buildSession(progress);
        const queue = session.question_queue;

        // With 3+ words, consecutive same-word questions should be minimized
        let consecutiveCount = 0;
        for (let i = 1; i < queue.length; i++) {
            if (queue[i].word_id === queue[i - 1].word_id) {
                consecutiveCount++;
            }
        }

        // Allow some but not many consecutive same-word questions
        vitestExpect(consecutiveCount).toBeLessThan(queue.length / 2);
    });

    it('should have meta data in session', () => {
        const progress = createInitialProgress();

        const word = createWordProgress(1, 1);
        word.card_state = CARD_STATE.REVIEW;
        word.confidence = 70;
        word.interval = 7;
        word.ease_factor = 2.5;
        word.due_date = new Date(Date.now() - 3600000).toISOString();
        progress.wordProgress[1] = word;

        const session = buildSession(progress);

        vitestExpect(session.meta).toBeDefined();
        vitestExpect(session.meta.total_review_words).toBeDefined();
        vitestExpect(session.meta.total_questions).toBeDefined();
    });
});


// ═══════════════════════════════════════════
// EDGE CASE TESTS
// ═══════════════════════════════════════════

describe('Edge Cases', () => {
    it('should handle processAnswer on a NEW word gracefully', () => {
        const word = createWordProgress(1, 1);
        // NEW words shouldn't normally get processAnswer,
        // but it should not crash if called
        vitestExpect(() => {
            processAnswer(word, ANSWER_QUALITY.GOOD, []);
        }).not.toThrow();
    });

    it('should handle empty question results', () => {
        let word = createWordProgress(1, 1);
        word = processFirstExposure(word);

        vitestExpect(() => {
            processAnswer(word, ANSWER_QUALITY.GOOD, []);
        }).not.toThrow();
    });

    it('should handle quality calculation with single result', () => {
        const results = [
            { correct: true, time_ms: 3000, question_type: 'translation_match' },
        ];

        vitestExpect(() => {
            calculateAnswerQuality(results, {});
        }).not.toThrow();
    });

    it('should handle confidence with empty history arrays', () => {
        const word = createWordProgress(1, 1);
        word.card_state = CARD_STATE.REVIEW;
        word.recent_sessions = [];
        word.answer_quality_history = [];

        vitestExpect(() => {
            calculateConfidence(word);
        }).not.toThrow();
    });

    it('getSchedulingSummary should not throw', () => {
        const word = createWordProgress(1, 1);
        vitestExpect(() => {
            getSchedulingSummary(word);
        }).not.toThrow();
    });
});
