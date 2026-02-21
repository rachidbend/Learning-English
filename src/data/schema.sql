-- ============================================
-- English Learning App - SQLite Schema
-- Version: 1.0
-- Date: February 21, 2026
-- ============================================

-- Drop tables if they exist (for clean rebuild)
DROP TABLE IF EXISTS question_attempts;
DROP TABLE IF EXISTS session_history;
DROP TABLE IF EXISTS user_progress;
DROP TABLE IF EXISTS user_profile;
DROP TABLE IF EXISTS question_distractors;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS word_examples;
DROP TABLE IF EXISTS word_content;
DROP TABLE IF EXISTS word_index;

-- ============================================
-- 1. WORD INDEX (Metadata & Reference)
-- ============================================

CREATE TABLE word_index (
  id INTEGER PRIMARY KEY,
  word TEXT NOT NULL,
  word_ar TEXT NOT NULL,
  pos TEXT NOT NULL,
  
  -- Organization
  batch_id INTEGER NOT NULL,
  level_id TEXT NOT NULL,
  cefr_level TEXT NOT NULL,
  
  -- Frequency
  coca_rank INTEGER,
  
  -- Availability flags
  has_content BOOLEAN DEFAULT 1,
  has_questions BOOLEAN DEFAULT 1,
  has_audio BOOLEAN DEFAULT 0,
  has_image BOOLEAN DEFAULT 0,
  
  -- Metadata
  content_version TEXT DEFAULT '1.0.0'
);

CREATE INDEX idx_word_index_batch ON word_index(batch_id);
CREATE INDEX idx_word_index_level ON word_index(level_id);
CREATE INDEX idx_word_index_word ON word_index(word);
CREATE INDEX idx_word_index_cefr ON word_index(cefr_level);

-- ============================================
-- 2. WORD CONTENT (Full Linguistic Data)
-- ============================================

CREATE TABLE word_content (
  word_id INTEGER PRIMARY KEY,
  word TEXT NOT NULL,
  word_ar TEXT NOT NULL,
  pos TEXT NOT NULL,
  
  -- Definitions
  definition_en TEXT,
  definition_ar TEXT,
  
  -- Translations
  translation_primary TEXT NOT NULL,
  translation_alternatives TEXT, -- JSON array: ["alt1", "alt2"]
  
  -- Forms (JSON object)
  -- For verbs: {"base":"run","thirdPerson":"runs","past":"ran",...}
  -- For nouns: {"singular":"cat","plural":"cats"}
  forms TEXT NOT NULL,
  
  -- Pronunciation
  ipa TEXT,
  audio_filename TEXT,
  
  -- Related words (JSON object)
  -- {"synonyms":["jog"],"antonyms":["walk"],"word_family":["runner"]}
  related_words TEXT,
  
  -- Usage notes
  usage_notes TEXT,
  
  -- Metadata
  difficulty_level TEXT,
  frequency_rank INTEGER,
  
  FOREIGN KEY (word_id) REFERENCES word_index(id) ON DELETE CASCADE
);

-- ============================================
-- 3. WORD EXAMPLES (Example Sentences)
-- ============================================

CREATE TABLE word_examples (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  word_id INTEGER NOT NULL,
  
  -- Sentence with {word} markers for highlighting
  sentence_en TEXT NOT NULL,
  sentence_ar TEXT NOT NULL,
  
  -- Form info
  form_used TEXT NOT NULL,
  
  -- Context
  context TEXT,
  difficulty TEXT,
  
  -- Display priority
  is_primary BOOLEAN DEFAULT 0,
  display_order INTEGER DEFAULT 0,
  
  FOREIGN KEY (word_id) REFERENCES word_index(id) ON DELETE CASCADE
);

CREATE INDEX idx_word_examples_word ON word_examples(word_id);
CREATE INDEX idx_word_examples_primary ON word_examples(is_primary);

-- ============================================
-- 4. QUESTIONS (Quiz Questions)
-- ============================================

CREATE TABLE questions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  word_id INTEGER NOT NULL,
  
  -- Question identification
  question_type TEXT NOT NULL, -- translation_match, reverse_translation, sentence_completion
  difficulty TEXT NOT NULL, -- easy, medium, hard
  
  -- Prompt
  prompt_text TEXT NOT NULL,
  prompt_language TEXT NOT NULL, -- en, ar
  
  -- Answer
  correct_answer TEXT NOT NULL,
  form_expected TEXT,
  
  -- For sentence completion only
  sentence_with_blank TEXT,
  full_sentence TEXT,
  missing_word_position INTEGER,
  
  -- Metadata
  explanation TEXT,
  source_example_id INTEGER,
  
  -- Usage stats (updated by app)
  times_used INTEGER DEFAULT 0,
  avg_success_rate REAL,
  
  FOREIGN KEY (word_id) REFERENCES word_index(id) ON DELETE CASCADE,
  FOREIGN KEY (source_example_id) REFERENCES word_examples(id) ON DELETE SET NULL
);

CREATE INDEX idx_questions_word ON questions(word_id);
CREATE INDEX idx_questions_type ON questions(question_type);

-- ============================================
-- 5. QUESTION DISTRACTORS (Wrong Answers Pool)
-- ============================================

CREATE TABLE question_distractors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  question_id INTEGER NOT NULL,
  
  -- Distractor text
  distractor_text TEXT NOT NULL,
  
  -- Optional: note about why this is a good distractor
  distractor_note TEXT,
  
  -- Display order (for maintenance, not for selection)
  display_order INTEGER DEFAULT 0,
  
  FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
);

CREATE INDEX idx_question_distractors_question ON question_distractors(question_id);

-- ============================================
-- 6. USER PROFILE
-- ============================================

CREATE TABLE user_profile (
  user_id TEXT PRIMARY KEY,
  username TEXT,
  email TEXT,
  
  -- Settings
  native_language TEXT DEFAULT 'ar',
  target_language TEXT DEFAULT 'en',
  daily_goal INTEGER DEFAULT 20,
  
  -- Stats
  total_words_seen INTEGER DEFAULT 0,
  total_words_mastered INTEGER DEFAULT 0,
  current_streak_days INTEGER DEFAULT 0,
  longest_streak_days INTEGER DEFAULT 0,
  
  -- Timestamps
  created_at TEXT NOT NULL,
  last_active TEXT,
  
  -- Sync
  last_synced TEXT,
  sync_enabled BOOLEAN DEFAULT 0
);

-- ============================================
-- 7. USER PROGRESS (Spaced Repetition State)
-- ============================================

CREATE TABLE user_progress (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id TEXT NOT NULL,
  word_id INTEGER NOT NULL,
  
  -- === SCHEDULING STATE ===
  card_state TEXT NOT NULL DEFAULT 'new', -- new, learning, review, relearning, suspended
  due_date TEXT,
  interval REAL DEFAULT 0,
  ease_factor REAL DEFAULT 2.5,
  
  -- Learning phase
  learning_step INTEGER,
  first_two_weeks_index INTEGER,
  is_in_first_two_weeks BOOLEAN DEFAULT 1,
  
  -- Lapse tracking
  lapses INTEGER DEFAULT 0,
  consecutive_correct INTEGER DEFAULT 0,
  
  -- === CONFIDENCE & MASTERY ===
  confidence INTEGER DEFAULT 0, -- 0-100
  mastery_level TEXT DEFAULT 'starting', -- starting, learning, getting_there, strong, mastered
  
  -- === PERFORMANCE METRICS ===
  times_reviewed INTEGER DEFAULT 0,
  times_correct INTEGER DEFAULT 0,
  times_wrong INTEGER DEFAULT 0,
  
  -- Recent performance (JSON array of 0/1 for last 10 sessions)
  recent_sessions TEXT DEFAULT '[]',
  
  -- Answer quality history (JSON array of 0-5 for last 10 sessions)
  answer_quality_history TEXT DEFAULT '[]',
  
  -- Average time in milliseconds
  average_answer_time INTEGER,
  
  -- === TIMESTAMPS ===
  first_seen_date TEXT,
  last_review_date TEXT,
  graduated_date TEXT,
  
  -- === SYNC STATUS ===
  last_synced TEXT,
  needs_sync BOOLEAN DEFAULT 1,
  version INTEGER DEFAULT 1,
  
  UNIQUE(user_id, word_id),
  FOREIGN KEY (word_id) REFERENCES word_index(id) ON DELETE CASCADE
);

CREATE INDEX idx_user_progress_user_word ON user_progress(user_id, word_id);
CREATE INDEX idx_user_progress_due ON user_progress(due_date);
CREATE INDEX idx_user_progress_state ON user_progress(card_state);
CREATE INDEX idx_user_progress_sync ON user_progress(needs_sync);

-- ============================================
-- 8. SESSION HISTORY (Study Sessions)
-- ============================================

CREATE TABLE session_history (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id TEXT NOT NULL,
  session_id TEXT NOT NULL UNIQUE,
  
  -- Session metadata
  session_type TEXT NOT NULL, -- learning, review, mixed
  started_at TEXT NOT NULL,
  ended_at TEXT,
  duration_seconds INTEGER,
  
  -- Performance
  words_reviewed INTEGER DEFAULT 0,
  questions_answered INTEGER DEFAULT 0,
  questions_correct INTEGER DEFAULT 0,
  
  -- Quality breakdown
  quality_again INTEGER DEFAULT 0,
  quality_hard INTEGER DEFAULT 0,
  quality_good INTEGER DEFAULT 0,
  quality_easy INTEGER DEFAULT 0,
  
  -- Sync
  synced BOOLEAN DEFAULT 0
);

CREATE INDEX idx_session_history_user ON session_history(user_id);
CREATE INDEX idx_session_history_date ON session_history(started_at);

-- ============================================
-- 9. QUESTION ATTEMPTS (Individual Answers)
-- ============================================

CREATE TABLE question_attempts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id TEXT NOT NULL,
  session_id TEXT NOT NULL,
  word_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  
  -- Answer details
  user_answer TEXT,
  correct_answer TEXT NOT NULL,
  is_correct BOOLEAN NOT NULL,
  time_taken_ms INTEGER NOT NULL,
  
  -- Timestamp
  answered_at TEXT NOT NULL,
  
  FOREIGN KEY (word_id) REFERENCES word_index(id) ON DELETE CASCADE,
  FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE,
  FOREIGN KEY (session_id) REFERENCES session_history(session_id) ON DELETE CASCADE
);

CREATE INDEX idx_question_attempts_user ON question_attempts(user_id);
CREATE INDEX idx_question_attempts_word ON question_attempts(word_id);
CREATE INDEX idx_question_attempts_session ON question_attempts(session_id);

-- ============================================
-- METADATA TABLE (Database Version Tracking)
-- ============================================

CREATE TABLE IF NOT EXISTS db_metadata (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL
);

-- Insert initial metadata
INSERT INTO db_metadata (key, value) VALUES ('schema_version', '1.0.0');
INSERT INTO db_metadata (key, value) VALUES ('created_at', datetime('now'));
INSERT INTO db_metadata (key, value) VALUES ('content_version', '1.0.0');

-- ============================================
-- END OF SCHEMA
-- ============================================
