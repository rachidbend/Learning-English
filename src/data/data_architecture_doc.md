# English Learning App - Complete Data Architecture

**Version:** 1.0  
**Date:** February 21, 2026  
**Author:** Data Architecture Team  

---

## Table of Contents

1. [Overview](#overview)
2. [Core Principles](#core-principles)
3. [Storage Architecture](#storage-architecture)
4. [Data Schemas](#data-schemas)
5. [File Structure](#file-structure)
6. [Data Flow](#data-flow)
7. [Sync Strategy](#sync-strategy)
8. [Implementation Guide](#implementation-guide)

---

## Overview

### System Goals

This architecture supports an offline-first English vocabulary learning app for Arabic speakers with the following requirements:

- **Offline-First:** App works completely offline without initial internet connection
- **Pre-Bundled Content:** First 894 words (Beginner 1-3) included in app installation
- **On-Demand Downloads:** Additional batches downloaded when user is ready
- **Content Updates:** Backend content can be updated without app store updates
- **Spaced Repetition:** Scientific scheduling algorithm with user progress tracking
- **Multi-Device Ready:** Designed for future cross-device sync
- **Years of Offline:** Data stored permanently, not cached temporarily

### Tech Stack

- **Frontend:** Flutter (Dart)
- **Local Storage:** SQLite (sqflite package)
- **Backend:** Firebase (Firestore + Storage) or similar
- **Initial Bundle:** Pre-compiled SQLite database included in APK

---

## Core Principles

### 1. Separation of Concerns

Data is separated into 4 distinct domains:

| Domain | Purpose | Storage | Update Frequency | Scope |
|--------|---------|---------|-----------------|-------|
| **Reference Index** | Metadata lookup | Local SQLite | On content update | Global |
| **Word Content** | Teaching data | Local SQLite | On content update | Global |
| **Question Bank** | Assessment data | Local SQLite | On content update | Global |
| **User Progress** | SRS state | Local SQLite + Cloud sync | Every session | Per-user |

### 2. Offline-First Philosophy

```
Priority: Local Storage > Cloud Storage

Local SQLite is the SOURCE OF TRUTH
Cloud is for:
  - Syncing progress across devices
  - Downloading new batches
  - Checking for content updates
```

### 3. Version Control

All content has versions:
- **Major.Minor.Patch** (e.g., 2.1.3)
- Users notified of updates
- Never forced to update
- Can choose when to download

### 4. Batch System

Content organized in batches:
- **Batch 1-9:** Beginner (A1) - 894 words - PRE-INSTALLED
- **Batch 10-18:** Intermediate (A2) - 864 words - Download on-demand
- **Batch 19-27:** Advanced (B1) - 807 words - Download on-demand
- **Batch 28+:** Future expansion

---

## Storage Architecture

### Local Storage (SQLite)

**Database File:** `vocabulary.db`

**Tables:**

```sql
-- Metadata index
word_index

-- Full content
word_content
word_examples

-- Assessment
questions
question_distractors

-- User state
user_profile
user_progress
session_history
```

### Initial App Bundle

**Included in APK:**
```
assets/
├── databases/
│   └── vocabulary_initial.db (contains batches 1-9)
└── audio/ (if added later)
```

**Size estimate:**
- 894 words × ~2KB average = ~1.8 MB
- Total initial database: ~2-3 MB
- Compressed in APK: ~1 MB

### Cloud Storage (Firebase)

**Firestore Collections:**
```
/users/{userId}/
  └── progress/ (user's word progress)
  
/content_versions/ (version manifest)

/batches/ (metadata about available batches)
```

**Cloud Storage Buckets:**
```
/batches/
  ├── batch_10.db.gz (compressed batch databases)
  ├── batch_11.db.gz
  └── ...
  
/audio/ (future)
  ├── run.mp3
  └── ...
```

---

## Data Schemas

### 1. Reference Index Schema

**Table: `word_index`**

Purpose: Lightweight lookup table for quick filtering and navigation

```sql
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
  content_version TEXT DEFAULT '1.0.0',
  
  -- Indexes
  INDEX idx_batch (batch_id),
  INDEX idx_level (level_id),
  INDEX idx_word (word)
);
```

**Example Row:**
```json
{
  "id": 1,
  "word": "run",
  "word_ar": "يجري",
  "pos": "verb",
  "batch_id": 1,
  "level_id": "beginner_1",
  "cefr_level": "A1",
  "coca_rank": 157,
  "has_content": true,
  "has_questions": true,
  "has_audio": false,
  "has_image": false,
  "content_version": "1.0.0"
}
```

---

### 2. Word Content Schema

**Table: `word_content`**

Purpose: Complete linguistic information for teaching

```sql
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
  translation_alternatives TEXT, -- JSON array
  
  -- Forms (JSON object)
  forms TEXT NOT NULL,
  
  -- Pronunciation
  ipa TEXT,
  audio_filename TEXT,
  
  -- Related words (JSON object)
  related_words TEXT,
  
  -- Usage notes
  usage_notes TEXT,
  
  -- Metadata
  difficulty_level TEXT,
  frequency_rank INTEGER,
  
  FOREIGN KEY (word_id) REFERENCES word_index(id)
);
```

**Forms JSON Structure:**

For verbs:
```json
{
  "base": "run",
  "thirdPerson": "runs",
  "past": "ran",
  "pastParticiple": "run",
  "presentParticiple": "running"
}
```

For nouns:
```json
{
  "singular": "cat",
  "plural": "cats"
}
```

For adjectives:
```json
{
  "base": "happy",
  "comparative": "happier",
  "superlative": "happiest"
}
```

**Related Words JSON:**
```json
{
  "synonyms": ["jog", "sprint", "dash"],
  "antonyms": ["walk", "stop"],
  "word_family": ["runner", "running", "ran"]
}
```

**Example Row:**
```json
{
  "word_id": 1,
  "word": "run",
  "word_ar": "يجري",
  "pos": "verb",
  "definition_en": "to move at a speed faster than walking",
  "definition_ar": "التحرك بسرعة أكبر من المشي",
  "translation_primary": "يجري",
  "translation_alternatives": "[\"يدير\", \"يمتد\"]",
  "forms": "{\"base\":\"run\",\"thirdPerson\":\"runs\",\"past\":\"ran\",\"pastParticiple\":\"run\",\"presentParticiple\":\"running\"}",
  "ipa": "/rʌn/",
  "audio_filename": "run.mp3",
  "related_words": "{\"synonyms\":[\"jog\",\"sprint\"],\"antonyms\":[\"walk\",\"stop\"],\"word_family\":[\"runner\",\"running\",\"ran\"]}",
  "usage_notes": "Common in both literal (physical running) and metaphorical (running a business) contexts.",
  "difficulty_level": "basic",
  "frequency_rank": 157
}
```

---

**Table: `word_examples`**

Purpose: Example sentences with highlighting markers

```sql
CREATE TABLE word_examples (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  word_id INTEGER NOT NULL,
  
  -- Sentence with {word} markers
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
  
  FOREIGN KEY (word_id) REFERENCES word_index(id)
);

CREATE INDEX idx_word_examples ON word_examples(word_id);
```

**Example Rows for "run":**
```json
[
  {
    "id": 1,
    "word_id": 1,
    "sentence_en": "I {run} every morning",
    "sentence_ar": "أنا {أجري} كل صباح",
    "form_used": "base",
    "context": "daily_routine",
    "difficulty": "basic",
    "is_primary": true,
    "display_order": 1
  },
  {
    "id": 2,
    "word_id": 1,
    "sentence_en": "She {runs} to work",
    "sentence_ar": "هي {تجري} إلى العمل",
    "form_used": "thirdPerson",
    "context": "transportation",
    "difficulty": "basic",
    "is_primary": true,
    "display_order": 2
  },
  {
    "id": 3,
    "word_id": 1,
    "sentence_en": "They {ran} a marathon last year",
    "sentence_ar": "هم {جروا} ماراثون العام الماضي",
    "form_used": "past",
    "context": "sports",
    "difficulty": "intermediate",
    "is_primary": false,
    "display_order": 3
  },
  {
    "id": 4,
    "word_id": 1,
    "sentence_en": "He's been {running} this company for 10 years",
    "sentence_ar": "لقد كان {يدير} هذه الشركة لمدة 10 سنوات",
    "form_used": "presentParticiple",
    "context": "business",
    "difficulty": "advanced",
    "is_primary": false,
    "display_order": 4
  },
  {
    "id": 5,
    "word_id": 1,
    "sentence_en": "The program {runs} on all devices",
    "sentence_ar": "البرنامج {يعمل} على جميع الأجهزة",
    "form_used": "thirdPerson",
    "context": "technology",
    "difficulty": "advanced",
    "is_primary": false,
    "display_order": 5
  },
  {
    "id": 6,
    "word_id": 1,
    "sentence_en": "My nose is {running}",
    "sentence_ar": "أنفي {يسيل}",
    "form_used": "presentParticiple",
    "context": "health",
    "difficulty": "intermediate",
    "is_primary": false,
    "display_order": 6
  }
]
```

**Display Logic:**
- Show 2 random examples by default
- Mark 2 as `is_primary` for guaranteed display
- Rotate through others for variety
- User can expand to see all

---

### 3. Question Bank Schema

**Table: `questions`**

Purpose: Quiz questions for assessment

```sql
CREATE TABLE questions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  word_id INTEGER NOT NULL,
  
  -- Question identification
  question_type TEXT NOT NULL,
  difficulty TEXT NOT NULL,
  
  -- Prompt
  prompt_text TEXT NOT NULL,
  prompt_language TEXT NOT NULL,
  
  -- Answer
  correct_answer TEXT NOT NULL,
  form_expected TEXT,
  
  -- For sentence completion
  sentence_with_blank TEXT,
  full_sentence TEXT,
  missing_word_position INTEGER,
  
  -- Metadata
  explanation TEXT,
  source_example_id INTEGER,
  
  -- Usage stats
  times_used INTEGER DEFAULT 0,
  avg_success_rate REAL,
  
  FOREIGN KEY (word_id) REFERENCES word_index(id),
  FOREIGN KEY (source_example_id) REFERENCES word_examples(id)
);

CREATE INDEX idx_word_questions ON questions(word_id);
CREATE INDEX idx_question_type ON questions(question_type);
```

**Question Types:**
1. `translation_match` - EN → AR
2. `reverse_translation` - AR → EN
3. `sentence_completion` - Fill blank in sentence

**Example Questions for "run":**

**Type 1: Translation Match**
```json
{
  "id": 1,
  "word_id": 1,
  "question_type": "translation_match",
  "difficulty": "easy",
  "prompt_text": "run",
  "prompt_language": "en",
  "correct_answer": "يجري",
  "form_expected": null,
  "sentence_with_blank": null,
  "full_sentence": null,
  "missing_word_position": null,
  "explanation": "The verb 'run' (يجري) is one of the most common action verbs in English.",
  "source_example_id": null,
  "times_used": 0,
  "avg_success_rate": null
}
```

**Type 2: Reverse Translation**
```json
{
  "id": 2,
  "word_id": 1,
  "question_type": "reverse_translation",
  "difficulty": "medium",
  "prompt_text": "يجري",
  "prompt_language": "ar",
  "correct_answer": "run",
  "form_expected": "base",
  "sentence_with_blank": null,
  "full_sentence": null,
  "missing_word_position": null,
  "explanation": "يجري translates to 'run' in English.",
  "source_example_id": null,
  "times_used": 0,
  "avg_success_rate": null
}
```

**Type 3: Sentence Completion (6+ variations)**
```json
[
  {
    "id": 3,
    "word_id": 1,
    "question_type": "sentence_completion",
    "difficulty": "easy",
    "prompt_text": "I ___ every morning",
    "prompt_language": "en",
    "correct_answer": "run",
    "form_expected": "base",
    "sentence_with_blank": "I ___ every morning",
    "full_sentence": "I run every morning",
    "missing_word_position": 1,
    "explanation": "'Run' fits the context of morning exercise.",
    "source_example_id": 1,
    "times_used": 0,
    "avg_success_rate": null
  },
  {
    "id": 4,
    "word_id": 1,
    "question_type": "sentence_completion",
    "difficulty": "easy",
    "prompt_text": "She ___ to work",
    "prompt_language": "en",
    "correct_answer": "runs",
    "form_expected": "thirdPerson",
    "sentence_with_blank": "She ___ to work",
    "full_sentence": "She runs to work",
    "missing_word_position": 1,
    "explanation": "'Runs' is third person singular form.",
    "source_example_id": 2,
    "times_used": 0,
    "avg_success_rate": null
  },
  {
    "id": 5,
    "word_id": 1,
    "question_type": "sentence_completion",
    "difficulty": "medium",
    "prompt_text": "They ___ a marathon last year",
    "prompt_language": "en",
    "correct_answer": "ran",
    "form_expected": "past",
    "sentence_with_blank": "They ___ a marathon last year",
    "full_sentence": "They ran a marathon last year",
    "missing_word_position": 1,
    "explanation": "'Ran' is the past tense of run.",
    "source_example_id": 3,
    "times_used": 0,
    "avg_success_rate": null
  },
  {
    "id": 6,
    "word_id": 1,
    "question_type": "sentence_completion",
    "difficulty": "hard",
    "prompt_text": "He's been ___ this company for 10 years",
    "prompt_language": "en",
    "correct_answer": "running",
    "form_expected": "presentParticiple",
    "sentence_with_blank": "He's been ___ this company for 10 years",
    "full_sentence": "He's been running this company for 10 years",
    "missing_word_position": 2,
    "explanation": "'Running' in present participle form, meaning 'managing'.",
    "source_example_id": 4,
    "times_used": 0,
    "avg_success_rate": null
  },
  {
    "id": 7,
    "word_id": 1,
    "question_type": "sentence_completion",
    "difficulty": "hard",
    "prompt_text": "The program ___ on all devices",
    "prompt_language": "en",
    "correct_answer": "runs",
    "form_expected": "thirdPerson",
    "sentence_with_blank": "The program ___ on all devices",
    "full_sentence": "The program runs on all devices",
    "missing_word_position": 2,
    "explanation": "'Runs' here means 'operates' or 'works'.",
    "source_example_id": 5,
    "times_used": 0,
    "avg_success_rate": null
  },
  {
    "id": 8,
    "word_id": 1,
    "question_type": "sentence_completion",
    "difficulty": "medium",
    "prompt_text": "My nose is ___",
    "prompt_language": "en",
    "correct_answer": "running",
    "form_expected": "presentParticiple",
    "sentence_with_blank": "My nose is ___",
    "full_sentence": "My nose is running",
    "missing_word_position": 3,
    "explanation": "'Running' here is an idiomatic expression meaning nasal discharge.",
    "source_example_id": 6,
    "times_used": 0,
    "avg_success_rate": null
  }
]
```

---

**Table: `question_distractors`**

Purpose: Pool of wrong answer options for each question

```sql
CREATE TABLE question_distractors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  question_id INTEGER NOT NULL,
  
  -- Distractor text
  distractor_text TEXT NOT NULL,
  
  -- Optional: reason why this is a good distractor
  distractor_note TEXT,
  
  -- Display order (not used for random selection, just for maintenance)
  display_order INTEGER DEFAULT 0,
  
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE INDEX idx_question_distractors ON question_distractors(question_id);
```

**Example Distractors for Question 1 (translation_match):**
```json
[
  { "question_id": 1, "distractor_text": "يأكل", "distractor_note": "eat" },
  { "question_id": 1, "distractor_text": "ينام", "distractor_note": "sleep" },
  { "question_id": 1, "distractor_text": "يكتب", "distractor_note": "write" },
  { "question_id": 1, "distractor_text": "يقرأ", "distractor_note": "read" },
  { "question_id": 1, "distractor_text": "يشرب", "distractor_note": "drink" },
  { "question_id": 1, "distractor_text": "يلعب", "distractor_note": "play" },
  { "question_id": 1, "distractor_text": "يمشي", "distractor_note": "walk" },
  { "question_id": 1, "distractor_text": "يقف", "distractor_note": "stand" },
  { "question_id": 1, "distractor_text": "يجلس", "distractor_note": "sit" },
  { "question_id": 1, "distractor_text": "يسبح", "distractor_note": "swim" }
]
```

**Example Distractors for Question 3 (sentence_completion: "I ___ every morning"):**
```json
[
  { "question_id": 3, "distractor_text": "walk", "distractor_note": "base form verb" },
  { "question_id": 3, "distractor_text": "eat", "distractor_note": "base form verb" },
  { "question_id": 3, "distractor_text": "sleep", "distractor_note": "base form verb" },
  { "question_id": 3, "distractor_text": "work", "distractor_note": "base form verb" },
  { "question_id": 3, "distractor_text": "study", "distractor_note": "base form verb" },
  { "question_id": 3, "distractor_text": "exercise", "distractor_note": "base form verb" },
  { "question_id": 3, "distractor_text": "jog", "distractor_note": "similar meaning" },
  { "question_id": 3, "distractor_text": "swim", "distractor_note": "base form verb" },
  { "question_id": 3, "distractor_text": "drive", "distractor_note": "base form verb" },
  { "question_id": 3, "distractor_text": "cook", "distractor_note": "base form verb" }
]
```

**Selection Algorithm:**
```dart
// When displaying question
List<String> getQuestionOptions(int questionId) {
  // Get correct answer
  String correct = getCorrectAnswer(questionId);
  
  // Get all distractors
  List<String> distractors = getAllDistractors(questionId);
  
  // Shuffle and pick 3
  distractors.shuffle();
  List<String> selected = distractors.take(3).toList();
  
  // Combine and shuffle
  List<String> options = [correct, ...selected];
  options.shuffle();
  
  return options;
}
```

---

### 4. User Progress Schema

**Table: `user_profile`**

Purpose: Basic user information

```sql
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
```

---

**Table: `user_progress`**

Purpose: Spaced repetition state for each word

```sql
CREATE TABLE user_progress (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id TEXT NOT NULL,
  word_id INTEGER NOT NULL,
  
  -- === SCHEDULING STATE ===
  card_state TEXT NOT NULL DEFAULT 'new',
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
  confidence INTEGER DEFAULT 0,
  mastery_level TEXT DEFAULT 'starting',
  
  -- === PERFORMANCE METRICS ===
  times_reviewed INTEGER DEFAULT 0,
  times_correct INTEGER DEFAULT 0,
  times_wrong INTEGER DEFAULT 0,
  
  -- Recent performance (JSON array of 0/1)
  recent_sessions TEXT DEFAULT '[]',
  
  -- Answer quality history (JSON array of 0-5)
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
  FOREIGN KEY (word_id) REFERENCES word_index(id)
);

CREATE INDEX idx_user_word ON user_progress(user_id, word_id);
CREATE INDEX idx_due_date ON user_progress(due_date);
CREATE INDEX idx_card_state ON user_progress(card_state);
```

**Card States:**
- `new` - Not yet seen
- `learning` - In learning steps (0min → 10min → 45min)
- `review` - In review phase (spaced repetition)
- `relearning` - Failed review, back to learning
- `suspended` - User suspended this word

**Mastery Levels:**
- `starting` (0-29%)
- `learning` (30-59%)
- `getting_there` (60-79%)
- `strong` (80-89%)
- `mastered` (90-100%)

**Example Row:**
```json
{
  "id": 1,
  "user_id": "user_abc123",
  "word_id": 1,
  "card_state": "review",
  "due_date": "2026-02-25T10:00:00Z",
  "interval": 7.5,
  "ease_factor": 2.3,
  "learning_step": null,
  "first_two_weeks_index": 4,
  "is_in_first_two_weeks": true,
  "lapses": 1,
  "consecutive_correct": 5,
  "confidence": 73,
  "mastery_level": "strong",
  "times_reviewed": 12,
  "times_correct": 10,
  "times_wrong": 2,
  "recent_sessions": "[1,1,0,1,1,1,1,1,0,1]",
  "answer_quality_history": "[4,3,5,4,5,5,2,4,5,4]",
  "average_answer_time": 3200,
  "first_seen_date": "2026-02-15T10:00:00Z",
  "last_review_date": "2026-02-18T14:30:00Z",
  "graduated_date": "2026-02-15T15:30:00Z",
  "last_synced": "2026-02-18T14:31:00Z",
  "needs_sync": false,
  "version": 5
}
```

---

**Table: `session_history`**

Purpose: Detailed record of each study session

```sql
CREATE TABLE session_history (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id TEXT NOT NULL,
  session_id TEXT NOT NULL UNIQUE,
  
  -- Session metadata
  session_type TEXT NOT NULL,
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

CREATE INDEX idx_user_sessions ON session_history(user_id);
CREATE INDEX idx_session_date ON session_history(started_at);
```

**Session Types:**
- `learning` - Learning new words
- `review` - Reviewing known words
- `mixed` - Both learning and review

---

**Table: `question_attempts`**

Purpose: Individual question answer records

```sql
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
  
  FOREIGN KEY (word_id) REFERENCES word_index(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (session_id) REFERENCES session_history(session_id)
);

CREATE INDEX idx_user_attempts ON question_attempts(user_id);
CREATE INDEX idx_word_attempts ON question_attempts(word_id);
```

---

## File Structure

### SQLite Database Files

**Initial Bundle (In APK):**
```
assets/databases/
└── vocabulary_initial.db
    ├── word_index (894 rows - Batches 1-9)
    ├── word_content (894 rows)
    ├── word_examples (~5,364 rows - 6 per word)
    ├── questions (~7,146 rows - 8 per word average)
    └── question_distractors (~71,460 rows - 10 per question)
```

**Downloaded Batches:**
```
Download from backend, then merge into main database

batch_10.db.gz → Extract → Merge into vocabulary.db
batch_11.db.gz → Extract → Merge into vocabulary.db
...
```

**User Database (Created on Device):**
```
vocabulary.db (combines initial + downloads + user data)
├── [All content tables]
└── [All user tables]
```

---

### Backend Structure

**Firebase Firestore:**
```
/content_versions (collection)
  ├── /current (document)
  │   ├── version: "1.0.0"
  │   ├── updated_at: timestamp
  │   └── changelog: "..."
  │
  └── /batches (subcollection)
      ├── /batch_1 (document)
      │   ├── version: "1.0.0"
      │   ├── size_kb: 450
      │   ├── download_url: "..."
      │   └── word_count: 100
      │
      └── /batch_10 (document)
          └── ...

/users (collection)
  └── /{userId} (document)
      ├── profile: {...}
      │
      └── /progress (subcollection)
          ├── /word_1 (document)
          │   └── [user_progress fields]
          │
          └── /word_2 (document)
              └── ...
```

**Cloud Storage:**
```
gs://your-app.appspot.com/
├── batches/
│   ├── batch_10_v1.0.0.db.gz
│   ├── batch_11_v1.0.0.db.gz
│   └── ...
│
└── audio/ (future)
    ├── run.mp3
    └── ...
```

---

## Data Flow

### App Launch Flow

```
1. App Starts
   ↓
2. Check if vocabulary.db exists locally
   ↓
   NO → Copy assets/databases/vocabulary_initial.db to app directory
   YES → Use existing database
   ↓
3. Initialize user profile (if first time)
   ↓
4. Query due words for today
   ↓
5. Display Dashboard with counts
```

### Content Update Flow

```
1. App goes online (once per day check)
   ↓
2. Query /content_versions/current
   ↓
3. Compare local version with backend version
   ↓
4. IF newer version available:
   ↓
   Show notification: "New content available for Batch 5"
   ↓
   User taps "Update"
   ↓
   Download batch_5_v1.1.0.db.gz from Cloud Storage
   ↓
   Extract and merge into local database
   ↓
   Update local version number
   ↓
   Show success message
```

### Learning Session Flow

```
1. User taps "Learn New Words"
   ↓
2. Query word_index WHERE batch_id IN (user's available batches)
   ↓
3. Filter: card_state = 'new' LIMIT 10
   ↓
4. For each word:
   ↓
   a. Load word_content
   b. Display WordCard with examples
   c. User: "I've studied this"
   d. Load questions (translation_match + sentence_completion)
   e. Show questions sequentially
   f. Record answers in question_attempts
   g. Calculate quality based on performance
   h. Update user_progress (card_state → 'learning', schedule step 1)
   ↓
5. Session complete → Save session_history
   ↓
6. Mark needs_sync = true
```

### Review Session Flow

```
1. User taps "Review Words"
   ↓
2. Query user_progress WHERE due_date <= NOW() AND card_state IN ('review', 'learning')
   ↓
3. Build session with buildSession() algorithm
   ↓
4. For each word in session:
   ↓
   a. Load questions (all 3 types, interleaved)
   b. Show questions
   c. Record answers
   d. After all questions for word complete:
      - Calculate quality (AGAIN/HARD/GOOD/EASY)
      - Update scheduling (interval, ease, due_date)
      - Update confidence score
   ↓
5. Session complete → Save session_history
   ↓
6. Mark needs_sync = true
```

### Sync Flow

```
1. App goes online
   ↓
2. Check if needs_sync = true for any user_progress records
   ↓
3. Batch upload to Firestore:
   ↓
   FOR EACH word WITH needs_sync:
   ↓
   - Compare local version with cloud version
   - IF cloud version > local → Conflict!
     ↓
     Conflict resolution:
     - Keep most recent (by last_review_date)
     - Or merge (take higher confidence, more reviews)
   ↓
   - Upload to /users/{userId}/progress/{wordId}
   - Mark needs_sync = false
   - Update last_synced timestamp
   ↓
4. Download any updates from cloud (if multi-device)
   ↓
5. Mark sync complete
```

---

## Sync Strategy

### Conflict Resolution

**Scenario:** User reviews word on Phone A, then on Phone B (both offline), then both sync.

**Resolution Strategy:**
```
1. Compare last_review_date
2. Keep the record with most recent activity
3. Merge performance metrics:
   - times_reviewed: MAX(phone_a, phone_b)
   - times_correct: MAX(phone_a, phone_b)
   - confidence: MAX(phone_a, phone_b)
   - Use most recent scheduling data (interval, due_date)
```

### Sync Frequency

- **Automatic:** Once per day when app opens (if online)
- **Manual:** User can trigger sync from settings
- **After session:** Mark needs_sync, but don't sync immediately (batch later)
- **On logout:** Force sync before logging out

### Offline Tolerance

- **Indefinite:** App works offline forever
- **Sync recommended:** After 7 days, show reminder to sync
- **No forced sync:** Never block user from continuing offline

---

## Implementation Guide

### Phase 1: Initial Setup (Week 1-2)

1. **Create Initial Database**
   ```
   - Generate vocabulary_initial.db with batches 1-9
   - Include all tables with data
   - Compress and add to assets/
   ```

2. **Set Up Local Storage**
   ```dart
   // Initialize database
   import 'package:sqflite/sqflite.dart';
   
   Future<Database> initDatabase() async {
     String path = await getDatabasesPath();
     String dbPath = join(path, 'vocabulary.db');
     
     // Check if exists
     bool exists = await databaseExists(dbPath);
     
     if (!exists) {
       // Copy from assets
       ByteData data = await rootBundle.load('assets/databases/vocabulary_initial.db');
       List<int> bytes = data.buffer.asUint8List();
       await File(dbPath).writeAsBytes(bytes);
     }
     
     return await openDatabase(dbPath);
   }
   ```

3. **Create Data Access Layer**
   ```dart
   // Repository pattern
   class WordRepository {
     Future<WordContent> getWord(int wordId);
     Future<List<Example>> getExamples(int wordId);
     Future<List<Question>> getQuestions(int wordId);
   }
   
   class ProgressRepository {
     Future<UserProgress> getProgress(int wordId);
     Future<void> updateProgress(UserProgress progress);
     Future<List<WordWithProgress>> getDueWords();
   }
   ```

### Phase 2: Core Features (Week 3-4)

1. **Implement Learning Flow**
2. **Implement Review Flow**
3. **Implement Scheduling Engine**
4. **Test with initial 894 words**

### Phase 3: Backend Integration (Week 5-6)

1. **Set Up Firebase Project**
2. **Implement Content Version Check**
3. **Implement Batch Download**
4. **Implement Progress Sync**

### Phase 4: Testing & Polish (Week 7-8)

1. **Test Offline Mode**
2. **Test Sync Conflicts**
3. **Test Content Updates**
4. **Performance Optimization**

---

## Size Estimates

### Initial Bundle
- **Database:** 2-3 MB uncompressed, ~1 MB in APK
- **Total App Size:** 5-7 MB (including Flutter framework)

### Additional Batches
- **Per Batch:** ~200-300 KB compressed
- **Total for all batches (1-27):** ~5-8 MB

### User Data Growth
- **Per word progress:** ~500 bytes
- **After 2000 words:** ~1 MB user data
- **Session history (1 year):** ~5-10 MB

---

## Conclusion

This architecture provides:

✅ **Complete offline functionality** - Works without internet indefinitely  
✅ **Pre-bundled content** - 894 words ready on install  
✅ **Flexible updates** - Content updates without app updates  
✅ **Scientific scheduling** - Spaced repetition built-in  
✅ **Multi-device ready** - Sync architecture in place  
✅ **Scalable** - Easy to add more words and features  

**Next Steps:**
1. Review and approve this architecture
2. Generate sample databases with real data
3. Begin Flutter implementation
4. Build MVP with batches 1-9

---

**Document Version:** 1.0  
**Last Updated:** February 21, 2026
