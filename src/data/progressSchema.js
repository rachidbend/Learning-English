/**
 * progressSchema.js
 * 
 * Single source of truth for all data structures and constants
 * in the active recall spaced repetition system.
 * 
 * SYSTEM OVERVIEW:
 * ─────────────────
 * This system combines two approaches:
 * 
 * 1. ANKI SCHEDULING (hidden from user)
 *    Determines WHEN a word is reviewed next.
 *    Uses ease factor + intervals + card states.
 * 
 * 2. CONFIDENCE SCORE (shown to user)
 *    Shows HOW WELL the user knows a word (0-100%).
 *    Calculated from accuracy + speed + consistency.
 * 
 * Answer quality (Again/Hard/Good/Easy) is NEVER asked directly.
 * It is derived automatically from quiz performance.
 */

// ─────────────────────────────────────────────
// CARD STATES
// ─────────────────────────────────────────────

export const CARD_STATE = {
    NEW: 'new',        // Never studied
    LEARNING: 'learning',   // In learning phase (same-session steps)
    REVIEW: 'review',     // Graduated, in spaced repetition
    RELEARNING: 'relearning', // Failed a review, back in learning steps
};

// ─────────────────────────────────────────────
// ANSWER QUALITY
// Derived from quiz performance, never self-rated
// ─────────────────────────────────────────────

export const ANSWER_QUALITY = {
    AGAIN: 'again', // Score 0-40%  → failed, back to learning
    HARD: 'hard',  // Score 41-65% → struggled, short interval
    GOOD: 'good',  // Score 66-85% → normal, standard interval
    EASY: 'easy',  // Score 86-100% → nailed it, longer interval
};

// Performance score thresholds for quality mapping
export const QUALITY_THRESHOLDS = {
    AGAIN_MAX: 40,  // 0-40% → AGAIN
    HARD_MAX: 65,  // 41-65% → HARD
    GOOD_MAX: 85,  // 66-85% → GOOD
    // 86-100% → EASY
};

// ─────────────────────────────────────────────
// MASTERY LEVELS (user-facing confidence labels)
// ─────────────────────────────────────────────

export const MASTERY_LEVEL = {
    UNSEEN: 'unseen',        // Never seen
    STARTING: 'starting',      // 0-29%
    LEARNING: 'learning',      // 30-59%
    GETTING_THERE: 'getting_there', // 60-79%
    STRONG: 'strong',        // 80-89%
    MASTERED: 'mastered',      // 90-100%
};

export const MASTERY_THRESHOLDS = {
    STARTING: { min: 0, max: 29, label: 'Starting Out', icon: '🔴' },
    LEARNING: { min: 30, max: 59, label: 'Learning', icon: '🟠' },
    GETTING_THERE: { min: 60, max: 79, label: 'Getting There', icon: '🟡' },
    STRONG: { min: 80, max: 89, label: 'Strong', icon: '🟢' },
    MASTERED: { min: 90, max: 100, label: 'Mastered', icon: '⭐' },
};

// ─────────────────────────────────────────────
// SCHEDULING CONSTANTS
// ─────────────────────────────────────────────

/**
 * LEARNING PHASE STEPS (same-session, in minutes)
 * 
 * New words go through these steps before graduating.
 * Step index advances on GOOD or EASY answer.
 * Resets to 0 on AGAIN answer.
 * 
 * Step 0: Show immediately after first exposure
 * Step 1: 10 minutes later (short-term recall test)
 * Step 2: End of session ~45-60 min (same-day consolidation)
 */
export const LEARNING_STEPS_MINUTES = [0, 5, 15];

/**
 * RELEARNING STEPS (minutes)
 * Used when a review word fails (lapses back to learning)
 * Shorter than initial learning — word was known before
 */
export const RELEARNING_STEPS_MINUTES = [10];

/**
 * FIRST TWO WEEKS SCHEDULE (days)
 * 
 * After graduating from learning phase, words follow this
 * aggressive schedule for the first two weeks.
 * 
 * Research basis: Ebbinghaus forgetting curve drops fastest
 * in first 48hrs and first week. Frequent early reviews
 * rebuild the memory trace at exactly the right moments.
 * 
 * Index = review number (0-based)
 * Value = days after graduation
 */
export const FIRST_TWO_WEEKS_SCHEDULE = [
    1,   // Review 1: 1 day after graduating
    2,   // Review 2: 2 days after Review 1
    3,   // Review 3: 3 days after Review 2
    5,   // Review 4: 5 days after Review 3
    7,   // Review 5: 7 days after Review 4 (end of week 2)
    10,  // Review 6: 10 days after Review 5
    14,  // Review 7: 14 days after Review 6 (2 weeks)
];

// After completing first two weeks schedule:
// → Switch to standard Anki-style interval × ease factor
// → This is when true long-term spaced repetition begins

/**
 * GRADUATING INTERVALS (days)
 * After completing all learning steps, first review interval
 * 
 * GOOD answer during final learning step → 1 day
 * EASY answer during final learning step → 4 days (skip ahead)
 */
export const GRADUATING_INTERVAL = 1;       // days
export const EASY_GRADUATING_INTERVAL = 4;  // days (EASY button)

/**
 * EASE FACTOR
 * Multiplier applied to interval after standard Anki phase begins
 * 
 * Default: 2.5 (Anki standard)
 * Minimum: 1.3 (word is very hard, never goes below this)
 * Maximum: 2.5 (word is easy, capped here)
 * 
 * Adjustments per answer quality (after first two weeks):
 * AGAIN: -0.20
 * HARD:  -0.15
 * GOOD:  no change
 * EASY:  +0.15
 */
export const EASE_FACTOR = {
    DEFAULT: 2.5,
    MINIMUM: 1.3,
    MAXIMUM: 2.5,
    ADJUSTMENT: {
        again: -0.20,
        hard: -0.15,
        good: 0.00,
        easy: +0.15,
    },
};

/**
 * INTERVAL MULTIPLIERS (after first two weeks)
 * Applied when calculating next interval in standard Anki phase
 */
export const INTERVAL_MULTIPLIER = {
    hard: 1.2,   // Interval × 1.2 (shorter than normal)
    good: null,  // Interval × ease_factor (standard)
    easy: 1.3,   // Interval × ease_factor × 1.3 (longer bonus)
};

/**
 * LAPSE SETTINGS
 * When a review word gets AGAIN (fails)
 */
export const LAPSE_SETTINGS = {
    new_interval_factor: 0.5,  // New interval = old interval × 0.5 (after relearning)
    minimum_interval: 1,       // Minimum days after relearning
    ease_penalty: 0.20,        // Ease factor reduction per lapse
};

/**
 * MAXIMUM INTERVAL
 * Never schedule more than this far in advance
 */
export const MAX_INTERVAL_DAYS = 180; // 6 months

/**
 * SESSION DEFAULTS
 */
export const SESSION_DEFAULTS = {
    new_cards_per_day: 10,     // Default new words per session
    max_new_cards: 50,         // Hard cap on new words per session
    review_order: 'due_date',  // Sort reviews by due date (oldest first)
};

/**
 * QUESTIONS PER REVIEW
 * How many questions to ask per word during review
 * Based on card state and confidence level
 */
export const QUESTIONS_PER_REVIEW = {
    new_graduate: 4,  // Just graduated from learning, need strong evidence
    review_low: 4,  // Review word, confidence < 50% (needs more checks)
    review_normal: 3,  // Review word, confidence 50-89% (standard)
    review_mastered: 2,  // Mastered word, confidence 90%+ (quick check)
    after_lapse: 5,  // Word failed review, confirm relearning
};

/**
 * MINIMUM GAP BETWEEN SAME-WORD QUESTIONS
 * Prevents consecutive same-word questions in interleaved session
 * 
 * gap = max(MIN_GAP_ABSOLUTE, floor(activeWords × MIN_GAP_FACTOR))
 */
export const INTERLEAVING = {
    MIN_GAP_ABSOLUTE: 3,    // Never less than 3 questions apart
    MIN_GAP_FACTOR: 0.6,    // 60% of active words in session
};

// ─────────────────────────────────────────────
// CONFIDENCE CALCULATION WEIGHTS
// ─────────────────────────────────────────────

export const CONFIDENCE_WEIGHTS = {
    lifetime_accuracy: 0.30, // Correct / total all time
    recent_accuracy: 0.40, // Correct in last 10 reviews (heavier weight)
    answer_quality: 0.20, // Average quality rating (again=0, easy=5)
    speed: 0.10, // Answer speed vs baseline
};

export const CONFIDENCE_MODIFIERS = {
    lapse_penalty: 5,    // -5 per lapse (max -20)
    lapse_penalty_max: 20,   // Cap on total lapse penalty
    streak_bonus: 3,    // +3 if last 5 all correct
    graduation_bonus: 10,   // +10 when first graduating from learning
};

export const SPEED_THRESHOLDS = {
    fast: 3,  // < 3s = 100 speed score
    good: 5,  // 3-5s = 80 speed score
    slow: 8,  // 5-8s = 60 speed score
    verySlow: 99, // > 8s = 40 speed score
};

// ─────────────────────────────────────────────
// WORD PROGRESS SCHEMA
// ─────────────────────────────────────────────

/**
 * Creates a fresh word progress object for a new word
 */
export const createWordProgress = (wordId, batchId) => ({

    // IDENTIFICATION
    word_id: wordId,
    batch_id: batchId,

    // ── ANKI SCHEDULING LAYER (hidden from user) ──────────────────
    card_state: CARD_STATE.NEW,
    due_date: null,           // ISO string, null = not scheduled yet
    interval: 0,              // Days until next review
    ease_factor: EASE_FACTOR.DEFAULT,
    learning_step: 0,              // Current step index in LEARNING_STEPS
    first_two_weeks_index: 0,              // Current position in first-two-weeks schedule
    is_in_first_two_weeks: true,           // Still on aggressive schedule?
    lapses: 0,              // Times sent back to learning from review
    graduated_date: null,           // When word first graduated from learning

    // ── CONFIDENCE LAYER (shown to user) ──────────────────────────
    confidence: 0,              // 0-100
    confidence_trend: 0,              // Change from last calculation
    mastery_level: MASTERY_LEVEL.UNSEEN,

    // ── PERFORMANCE STATISTICS ────────────────────────────────────
    times_seen: 0,              // Total exposures including non-quiz
    times_reviewed: 0,              // Total quiz review sessions
    times_correct: 0,              // Total correct answers across all questions
    times_wrong: 0,              // Total wrong answers across all questions

    // Recent performance: last 10 review SESSIONS (not individual questions)
    // 1 = passed session (GOOD or EASY), 0 = failed session (AGAIN)
    recent_sessions: [],

    // Answer quality history: last 10 derived quality ratings
    // 0=again, 2=hard, 4=good, 5=easy
    answer_quality_history: [],

    // Individual question results within sessions
    // [{timestamp, correct, time_ms, question_type, session_id}]
    question_history: [],

    average_answer_time: null,           // ms, rolling average

    // ── TIMESTAMPS ────────────────────────────────────────────────
    first_seen_date: null,
    last_seen_date: null,
    last_review_date: null,
});

// ─────────────────────────────────────────────
// BATCH PROGRESS SCHEMA
// ─────────────────────────────────────────────

export const BATCH_STATUS = {
    LOCKED: 'locked',
    UNLOCKED: 'unlocked',
    IN_PROGRESS: 'in_progress',
    COMPLETED: 'completed',
};

export const createBatchProgress = (batchId) => ({
    batch_id: batchId,
    status: batchId === 1 ? BATCH_STATUS.UNLOCKED : BATCH_STATUS.LOCKED,
    words_seen: 0,
    words_graduated: 0,
    words_mastered: 0,
    test_taken: false,
    test_score: null,
    test_date: null,
    started_date: null,
    completed_date: null,
});

// ─────────────────────────────────────────────
// ROOT PROGRESS SCHEMA
// ─────────────────────────────────────────────

export const createInitialProgress = () => ({
    version: '2.0',               // Schema version (was 1.0 in old system)
    created_at: new Date().toISOString(),
    last_updated: new Date().toISOString(),
    wordProgress: {},                   // key: wordId (string), value: WordProgress
    batchProgress: {},                   // key: batchId (string), value: BatchProgress
    stats: {
        total_words_seen: 0,
        total_words_graduated: 0,
        total_words_mastered: 0,
        total_reviews: 0,
        total_questions_answered: 0,
        total_correct_answers: 0,
        current_streak_days: 0,
        longest_streak_days: 0,
        last_study_date: null,
        total_study_sessions: 0,
    },
    settings: {
        new_cards_per_day: SESSION_DEFAULTS.new_cards_per_day,
        max_new_cards: SESSION_DEFAULTS.max_new_cards,
    },
});
