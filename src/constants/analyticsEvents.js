/**
 * analyticsEvents.js — Approved event name constants
 *
 * Always use these constants when calling analytics.track().
 * Never use raw strings for event names.
 */

export const EVENTS = {
    APP_OPENED: 'app_opened',
    TAB_SWITCHED: 'tab_switched',
    LEARNING_SESSION_STARTED: 'learning_session_started',
    LEARNING_SESSION_COMPLETED: 'learning_session_completed',
    LEARNING_SESSION_ABANDONED: 'learning_session_abandoned',
    REVIEW_SESSION_STARTED: 'review_session_started',
    REVIEW_SESSION_COMPLETED: 'review_session_completed',
    QUESTION_ANSWERED: 'question_answered',
    STORY_OPENED: 'story_opened',
    STORY_COMPLETED: 'story_completed',
    STORY_QUIZ_COMPLETED: 'story_quiz_completed',
    WORD_TAPPED_IN_STORY: 'word_tapped_in_story',
    GRAMMAR_HUB_OPENED: 'grammar_hub_opened',
    BATCH_UNLOCKED: 'batch_unlocked',
    WORD_MASTERED: 'word_mastered',
    ERROR_OCCURRED: 'error_occurred',
    OFFLINE_SESSION: 'offline_session',
};
