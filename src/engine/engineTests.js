/**
 * engineTests.js
 * 
 * Comprehensive test suite for the scheduling engine.
 * Runs all 8 test cases from the Phase 2 specification.
 * 
 * Usage: Import and call runAllTests() from browser console or a test page.
 */

import {
    createWordProgress,
    createInitialProgress,
    CARD_STATE,
    ANSWER_QUALITY,
    FIRST_TWO_WEEKS_SCHEDULE,
    LEARNING_STEPS_MINUTES,
} from '../data/progressSchema';

import { processAnswer, processFirstExposure, getSchedulingSummary } from './scheduler';
import { calculateAnswerQuality, getQuestionsForWord, getQuestionOrder } from './qualityCalculator';
import { calculateConfidence, getMasteryLevel, getMasteryDisplay } from './confidenceCalculator';
import { buildSession, isWordComplete, isSessionComplete, recordQuestionResult, calculateSessionStats } from './sessionBuilder';

let passed = 0;
let failed = 0;

const assert = (condition, message) => {
    if (condition) {
        passed++;
        console.log(`  ✅ ${message}`);
    } else {
        failed++;
        console.error(`  ❌ FAIL: ${message}`);
    }
};

// ─── TEST 1: Learning Phase Progression ───────────────────────

const test1_learningPhase = () => {
    console.log('\n=== TEST 1: Learning Phase ===');

    let word = createWordProgress(1, 1);
    word = processFirstExposure(word);

    assert(word.card_state === 'learning', 'After first exposure: card_state = learning');
    assert(word.learning_step === 0, 'After first exposure: learning_step = 0');
    assert(!!word.due_date, 'After first exposure: due_date is set');
    assert(word.times_seen === 1, 'After first exposure: times_seen = 1');

    // Advance through learning steps with GOOD
    word = processAnswer(word, ANSWER_QUALITY.GOOD);
    assert(word.learning_step === 1, 'After GOOD (step 0→1): learning_step = 1');
    assert(word.card_state === 'learning', 'Still in learning after step 1');

    word = processAnswer(word, ANSWER_QUALITY.GOOD);
    assert(word.learning_step === 2, 'After GOOD (step 1→2): learning_step = 2');
    assert(word.card_state === 'learning', 'Still in learning after step 2');

    // Step 2 is the last step — GOOD should graduate
    word = processAnswer(word, ANSWER_QUALITY.GOOD);
    assert(word.card_state === 'review', 'After GOOD (step 2 → graduate): card_state = review');
    assert(!!word.graduated_date, 'graduated_date is set');
    assert(word.is_in_first_two_weeks === true, 'is_in_first_two_weeks = true');
    assert(word.first_two_weeks_index === 0, 'first_two_weeks_index = 0');
    assert(word.interval === 1, 'interval = 1 (graduating interval)');
    assert(word.confidence > 0, 'confidence > 0 (graduation bonus applied)');

    // Test AGAIN resets step
    let resetWord = createWordProgress(2, 1);
    resetWord = processFirstExposure(resetWord);
    resetWord = processAnswer(resetWord, ANSWER_QUALITY.GOOD); // step 0→1
    assert(resetWord.learning_step === 1, 'Before AGAIN: step = 1');
    resetWord = processAnswer(resetWord, ANSWER_QUALITY.AGAIN); // Reset
    assert(resetWord.learning_step === 0, 'After AGAIN: step reset to 0');
    assert(resetWord.card_state === 'learning', 'After AGAIN: still learning');

    // Test EASY graduates immediately
    let easyWord = createWordProgress(3, 1);
    easyWord = processFirstExposure(easyWord);
    easyWord = processAnswer(easyWord, ANSWER_QUALITY.EASY);
    assert(easyWord.card_state === 'review', 'EASY graduates immediately');
    assert(easyWord.interval === 4, 'EASY graduating interval = 4');
};

// ─── TEST 2: First Two Weeks Schedule ─────────────────────────

const test2_firstTwoWeeks = () => {
    console.log('\n=== TEST 2: First Two Weeks Schedule ===');

    // Create a graduated word
    let word = createWordProgress(10, 1);
    word = processFirstExposure(word);
    word = processAnswer(word, ANSWER_QUALITY.GOOD); // step 0→1
    word = processAnswer(word, ANSWER_QUALITY.GOOD); // step 1→2
    word = processAnswer(word, ANSWER_QUALITY.GOOD); // graduate

    assert(word.is_in_first_two_weeks === true, 'Starts in first two weeks');

    // Walk through the entire schedule with GOOD
    const scheduleLength = FIRST_TWO_WEEKS_SCHEDULE.length;
    for (let i = 0; i < scheduleLength; i++) {
        const beforeIndex = word.first_two_weeks_index;
        const expectedInterval = FIRST_TWO_WEEKS_SCHEDULE[beforeIndex];
        word = processAnswer(word, ANSWER_QUALITY.GOOD);

        if (i < scheduleLength - 1) {
            assert(
                word.first_two_weeks_index === beforeIndex + 1,
                `GOOD advances: position ${beforeIndex} → ${word.first_two_weeks_index}`
            );
            assert(word.is_in_first_two_weeks === true, `Still in first two weeks at position ${word.first_two_weeks_index}`);
        }
    }

    assert(word.is_in_first_two_weeks === false, 'After completing all positions: exits first two weeks');
    assert(word.card_state === 'review', 'Still in review after completing first two weeks');
};

// ─── TEST 3: Standard Anki Phase ──────────────────────────────

const test3_standardAnki = () => {
    console.log('\n=== TEST 3: Standard Anki Phase ===');

    // Create a word that's past first two weeks
    let word = createWordProgress(20, 1);
    word.card_state = 'review';
    word.is_in_first_two_weeks = false;
    word.first_two_weeks_index = FIRST_TWO_WEEKS_SCHEDULE.length;
    word.interval = 14;
    word.ease_factor = 2.5;
    word.due_date = new Date().toISOString();
    word.times_reviewed = 5;
    word.times_correct = 5;
    word.recent_sessions = [1, 1, 1, 1, 1];
    word.answer_quality_history = [4, 4, 4, 4, 4];

    // GOOD: interval × ease_factor = 14 × 2.5 = 35
    const beforeGood = word.interval;
    word = processAnswer(word, ANSWER_QUALITY.GOOD);
    assert(word.interval === 35, `GOOD: ${beforeGood} × 2.5 = ${word.interval} (expected 35)`);
    assert(word.ease_factor === 2.5, 'GOOD: ease_factor unchanged');

    // HARD: interval × 1.2 = 35 × 1.2 = 42
    const beforeHard = word.interval;
    word = processAnswer(word, ANSWER_QUALITY.HARD);
    assert(word.interval === 42, `HARD: ${beforeHard} × 1.2 = ${word.interval} (expected 42)`);
    assert(word.ease_factor < 2.5, `HARD: ease_factor decreased to ${word.ease_factor.toFixed(2)}`);

    // EASY: interval × ease × 1.3
    const beforeEasy = word.interval;
    const easeBeforeEasy = word.ease_factor;
    word = processAnswer(word, ANSWER_QUALITY.EASY);
    const expectedEasyInterval = Math.min(
        Math.round(beforeEasy * (easeBeforeEasy + 0.15) * 1.3),
        180
    );
    assert(
        word.interval === expectedEasyInterval,
        `EASY: ${beforeEasy} × ${(easeBeforeEasy + 0.15).toFixed(2)} × 1.3 = ${word.interval} (expected ${expectedEasyInterval})`
    );
};

// ─── TEST 4: Lapse (Failed Review) ────────────────────────────

const test4_lapse = () => {
    console.log('\n=== TEST 4: Lapse ===');

    let word = createWordProgress(30, 1);
    word.card_state = 'review';
    word.is_in_first_two_weeks = false;
    word.first_two_weeks_index = FIRST_TWO_WEEKS_SCHEDULE.length;
    word.interval = 21;
    word.ease_factor = 2.5;
    word.due_date = new Date().toISOString();
    word.times_reviewed = 3;
    word.times_correct = 3;
    word.recent_sessions = [1, 1, 1];
    word.answer_quality_history = [4, 4, 4];

    const beforeLapse = { ...word };
    word = processAnswer(word, ANSWER_QUALITY.AGAIN);

    assert(word.card_state === 'relearning', 'After AGAIN: card_state = relearning');
    assert(word.lapses === 1, 'After AGAIN: lapses = 1');
    assert(word.ease_factor < beforeLapse.ease_factor, `Ease factor decreased: ${beforeLapse.ease_factor} → ${word.ease_factor.toFixed(2)}`);
    assert(word.learning_step === 0, 'Relearning starts at step 0');

    // Complete relearning with GOOD
    word = processAnswer(word, ANSWER_QUALITY.GOOD);
    assert(word.card_state === 'review', 'After relearning GOOD: back to review');
    assert(word.interval < beforeLapse.interval, `Interval reduced: ${beforeLapse.interval} → ${word.interval}`);
    assert(word.interval >= 1, 'Interval >= minimum (1)');
};

// ─── TEST 5: Quality Calculator ───────────────────────────────

const test5_qualityCalculator = () => {
    console.log('\n=== TEST 5: Quality Calculator ===');

    const word = createWordProgress(40, 1);

    // Perfect: 3/3 correct, fast
    const perfectResults = [
        { correct: true, time_ms: 1800, question_type: 'translation_match' },
        { correct: true, time_ms: 2100, question_type: 'reverse_translation' },
        { correct: true, time_ms: 2400, question_type: 'sentence_completion' },
    ];
    const perfectQuality = calculateAnswerQuality(perfectResults, word);
    assert(perfectQuality === 'easy', `Perfect (3/3 fast): quality = ${perfectQuality} (expected easy)`);

    // Good: 2/3 correct, medium speed
    const goodResults = [
        { correct: true, time_ms: 3000, question_type: 'translation_match' },
        { correct: false, time_ms: 6000, question_type: 'reverse_translation' },
        { correct: true, time_ms: 4000, question_type: 'sentence_completion' },
    ];
    const goodQuality = calculateAnswerQuality(goodResults, word);
    assert(
        goodQuality === 'hard' || goodQuality === 'good',
        `Mixed (2/3): quality = ${goodQuality} (expected hard or good)`
    );

    // Failed: 0/2 correct
    const failedResults = [
        { correct: false, time_ms: 9000, question_type: 'translation_match' },
        { correct: false, time_ms: 8000, question_type: 'reverse_translation' },
    ];
    const failedQuality = calculateAnswerQuality(failedResults, word);
    assert(failedQuality === 'again', `Failed (0/2): quality = ${failedQuality} (expected again)`);

    // Empty results
    const emptyQuality = calculateAnswerQuality([], word);
    assert(emptyQuality === 'again', `Empty results → quality = ${emptyQuality} (expected again)`);

    // Questions per word logic
    const newGraduate = createWordProgress(41, 1);
    newGraduate.card_state = 'review';
    newGraduate.first_two_weeks_index = 0;
    assert(getQuestionsForWord(newGraduate) === 4, 'New graduate: 4 questions');

    const masteredWord = createWordProgress(42, 1);
    masteredWord.card_state = 'review';
    masteredWord.confidence = 95;
    masteredWord.first_two_weeks_index = 3;
    assert(getQuestionsForWord(masteredWord) === 2, 'Mastered word: 2 questions');

    const relearningWord = createWordProgress(43, 1);
    relearningWord.card_state = 'relearning';
    assert(getQuestionsForWord(relearningWord) === 5, 'Relearning: 5 questions');

    // Question order
    const order3 = getQuestionOrder(3);
    assert(order3[0] === 'translation_match', 'Q1 = translation_match');
    assert(order3[1] === 'reverse_translation', 'Q2 = reverse_translation');
    assert(order3[2] === 'sentence_completion', 'Q3 = sentence_completion');
};

// ─── TEST 6: Confidence Calculator ────────────────────────────

const test6_confidenceCalculator = () => {
    console.log('\n=== TEST 6: Confidence ===');

    // New word → confidence = 0
    const newWord = createWordProgress(50, 1);
    assert(calculateConfidence(newWord) === 0, 'New word: confidence = 0');

    // Well-known word
    const goodWord = createWordProgress(51, 1);
    goodWord.card_state = 'review';
    goodWord.times_correct = 8;
    goodWord.times_wrong = 2;
    goodWord.recent_sessions = [1, 1, 0, 1, 1, 1, 1, 1, 0, 1];
    goodWord.answer_quality_history = [4, 4, 2, 4, 5, 4, 4, 5, 4, 5];
    goodWord.average_answer_time = 3200;

    const conf = calculateConfidence(goodWord);
    assert(conf > 50, `Good word confidence: ${conf} (expected > 50)`);
    assert(conf < 100, `Good word confidence: ${conf} (expected < 100)`);

    // Mastery levels
    assert(getMasteryLevel(0) === 'unseen', 'getMasteryLevel(0) = unseen');
    assert(getMasteryLevel(15) === 'starting', 'getMasteryLevel(15) = starting');
    assert(getMasteryLevel(45) === 'learning', 'getMasteryLevel(45) = learning');
    assert(getMasteryLevel(70) === 'getting_there', 'getMasteryLevel(70) = getting_there');
    assert(getMasteryLevel(85) === 'strong', 'getMasteryLevel(85) = strong');
    assert(getMasteryLevel(95) === 'mastered', 'getMasteryLevel(95) = mastered');

    // Mastery display
    const display = getMasteryDisplay('mastered');
    assert(display.label === 'Mastered', 'Mastered display label');
    assert(display.icon === '⭐', 'Mastered display icon');

    // Lapse penalty
    const lapsedWord = { ...goodWord, lapses: 3 };
    const lapsedConf = calculateConfidence(lapsedWord);
    assert(lapsedConf < conf, `Lapse penalty: ${conf} → ${lapsedConf}`);

    // Streak bonus (last 5 all correct)
    const streakWord = createWordProgress(52, 1);
    streakWord.card_state = 'review';
    streakWord.times_correct = 10;
    streakWord.times_wrong = 0;
    streakWord.recent_sessions = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    streakWord.answer_quality_history = [4, 4, 4, 4, 4, 4, 4, 4, 4, 4];
    streakWord.average_answer_time = 2000;
    const streakConf = calculateConfidence(streakWord);

    const noStreakWord = { ...streakWord, recent_sessions: [0, 0, 0, 0, 1, 1, 1, 1, 1, 1] };
    // last 5 still all correct, so streak bonus should still apply
    const noStreakConf = calculateConfidence(noStreakWord);
    // Both should have streak bonus (last 5 are all 1)
    assert(streakConf > 0, `Streak word confidence: ${streakConf}`);
};

// ─── TEST 7: Session Builder ───────────────────────────────────

const test7_sessionBuilder = () => {
    console.log('\n=== TEST 7: Session Builder ===');

    // Create fake progress with some due words
    const progress = createInitialProgress();

    // Add 5 words at different states (review, due now)
    for (let i = 1; i <= 5; i++) {
        const w = createWordProgress(i, 1);
        w.card_state = 'review';
        w.due_date = new Date(Date.now() - 3600000).toISOString(); // 1 hour ago
        w.confidence = 50 + i * 5;
        w.interval = 7;
        w.first_two_weeks_index = 3; // Not a new graduate
        progress.wordProgress[i] = w;
    }

    const session = buildSession(progress);

    assert(session.review_words.length === 5, `Review words: ${session.review_words.length} (expected 5)`);
    assert(session.question_queue.length > 0, `Question queue length: ${session.question_queue.length} (expected > 0)`);
    assert(!!session.session_id, 'Session has ID');
    assert(session.meta.total_review_words === 5, 'Meta: 5 review words');

    // Verify no consecutive same-word questions
    const queue = session.question_queue;
    let consecutiveViolations = 0;
    for (let i = 1; i < queue.length; i++) {
        if (queue[i].word_id === queue[i - 1].word_id) consecutiveViolations++;
    }
    assert(consecutiveViolations === 0, `No consecutive same-word questions (violations: ${consecutiveViolations})`);

    // Verify Q ordering (Q1 before Q2 before Q3 for each word)
    let orderingViolations = 0;
    const wordIndexSeen = {};
    for (const q of queue) {
        const last = wordIndexSeen[q.word_id] ?? -1;
        if (q.question_index !== last + 1) orderingViolations++;
        wordIndexSeen[q.word_id] = q.question_index;
    }
    assert(orderingViolations === 0, `Q ordering correct (violations: ${orderingViolations})`);

    // Test recordQuestionResult
    let updatedSession = recordQuestionResult(session, 1, true, 2500, 'translation_match');
    assert(updatedSession.state.completed_questions.length === 1, 'recordQuestionResult adds to completed');
    assert(updatedSession.state.word_results[1].length === 1, 'recordQuestionResult adds to word_results');
    assert(updatedSession.state.current_question_index === 1, 'Question index advanced');

    // Test isSessionComplete
    assert(!isSessionComplete(updatedSession), 'Session not complete after 1 question');

    // Test calculateSessionStats
    updatedSession.state.started_at = new Date(Date.now() - 300000).toISOString();
    updatedSession.state.word_quality = { 1: 'good', 2: 'easy' };
    const stats = calculateSessionStats(updatedSession);
    assert(stats.total_questions === 1, 'Stats: total_questions = 1');
    assert(stats.correct_answers === 1, 'Stats: correct_answers = 1');
    assert(stats.accuracy === 100, 'Stats: accuracy = 100%');
};

// ─── TEST 8: EASY in First Two Weeks ──────────────────────────

const test8_easyInFirstTwoWeeks = () => {
    console.log('\n=== TEST 8: Easy in First Two Weeks ===');

    let word = createWordProgress(100, 1);
    word = processFirstExposure(word);

    // Graduate through learning
    word = processAnswer(word, ANSWER_QUALITY.GOOD);
    word = processAnswer(word, ANSWER_QUALITY.GOOD);
    word = processAnswer(word, ANSWER_QUALITY.GOOD);

    assert(word.card_state === 'review', 'Word graduated');
    assert(word.first_two_weeks_index === 0, 'Starting at position 0');

    // EASY should skip a position
    word = processAnswer(word, ANSWER_QUALITY.EASY);
    assert(
        word.first_two_weeks_index === 2,
        `EASY skips: position 0 → ${word.first_two_weeks_index} (expected 2)`
    );

    // HARD should stay at current position
    const beforeHard = word.first_two_weeks_index;
    word = processAnswer(word, ANSWER_QUALITY.HARD);
    assert(
        word.first_two_weeks_index === beforeHard,
        `HARD stays: position ${word.first_two_weeks_index} (expected ${beforeHard})`
    );

    // Test no mutation
    const original = createWordProgress(200, 1);
    original.card_state = 'learning';
    const updated = processFirstExposure(original);
    assert(original.times_seen === 0, 'Original not mutated (times_seen still 0)');
    assert(updated.times_seen === 1, 'Updated has times_seen = 1');
};

// ─── TEST 9: Edge Cases ──────────────────────────────────────

const test9_edgeCases = () => {
    console.log('\n=== TEST 9: Edge Cases ===');

    // Ease factor bounds
    let word = createWordProgress(300, 1);
    word.ease_factor = 1.35; // Near minimum
    word.card_state = 'review';
    word.is_in_first_two_weeks = false;
    word.interval = 10;
    word.due_date = new Date().toISOString();
    word.times_reviewed = 1;
    word.recent_sessions = [1];
    word.answer_quality_history = [4];

    word = processAnswer(word, ANSWER_QUALITY.HARD); // -0.15 → 1.2 → clamped to 1.3
    assert(word.ease_factor >= 1.3, `Ease factor minimum enforced: ${word.ease_factor.toFixed(2)}`);

    // Max interval
    let bigWord = createWordProgress(301, 1);
    bigWord.card_state = 'review';
    bigWord.is_in_first_two_weeks = false;
    bigWord.interval = 150;
    bigWord.ease_factor = 2.5;
    bigWord.due_date = new Date().toISOString();
    bigWord.times_reviewed = 1;
    bigWord.recent_sessions = [1];
    bigWord.answer_quality_history = [4];

    bigWord = processAnswer(bigWord, ANSWER_QUALITY.EASY); // 150 × 2.5 × 1.3 = 487.5
    assert(bigWord.interval <= 180, `Max interval enforced: ${bigWord.interval} (expected ≤ 180)`);

    // Scheduling summary
    const summary = getSchedulingSummary(bigWord);
    assert(summary.word_id === 301, 'Summary has word_id');
    assert(typeof summary.is_due_now === 'boolean', 'Summary has is_due_now');
    assert(typeof summary.ease_factor === 'string', 'Summary ease_factor is formatted string');

    // Empty session
    const emptyProgress = createInitialProgress();
    const emptySession = buildSession(emptyProgress);
    assert(emptySession.question_queue.length === 0, 'Empty progress → empty queue');
    assert(emptySession.review_words.length === 0, 'Empty progress → no review words');
};

// ─── RUN ALL ──────────────────────────────────────────────────

export const runAllTests = () => {
    passed = 0;
    failed = 0;

    console.log('╔═══════════════════════════════════════════╗');
    console.log('║   SCHEDULING ENGINE TEST SUITE            ║');
    console.log('╚═══════════════════════════════════════════╝');

    test1_learningPhase();
    test2_firstTwoWeeks();
    test3_standardAnki();
    test4_lapse();
    test5_qualityCalculator();
    test6_confidenceCalculator();
    test7_sessionBuilder();
    test8_easyInFirstTwoWeeks();
    test9_edgeCases();

    console.log('\n═══════════════════════════════════════════');
    console.log(`Results: ${passed} passed, ${failed} failed, ${passed + failed} total`);
    console.log('═══════════════════════════════════════════');

    if (failed === 0) {
        console.log('🎉 ALL TESTS PASSED');
    } else {
        console.error(`⚠️ ${failed} TEST(S) FAILED`);
    }

    return { passed, failed };
};

export default runAllTests;
