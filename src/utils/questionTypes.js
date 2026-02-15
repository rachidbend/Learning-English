/**
 * Question Type Definitions
 * Defines available question types, their difficulty, and generation parameters
 */

export const QUESTION_TYPES = {
    TRANSLATION_MATCH: 'translation_match',
    REVERSE_TRANSLATION: 'reverse_translation',
    SENTENCE_COMPLETION: 'sentence_completion',
    // TODO PHASE 9: Add more question types
    // DEFINITION_MATCH: 'definition_match',
    // CONTEXT_IDENTIFICATION: 'context_identification',
    // AUDIO_RECOGNITION: 'audio_recognition',
    // FILL_BLANK_TYPING: 'fill_blank_typing',
    // MATCHING_PAIRS: 'matching_pairs',
    // SENTENCE_ORDERING: 'sentence_ordering',
};

/**
 * Question type metadata
 * Includes difficulty level, distractor requirements, and templates
 */
export const QUESTION_TYPE_METADATA = {
    [QUESTION_TYPES.TRANSLATION_MATCH]: {
        name: 'Translation Match',
        difficulty: 'easy',
        description: 'Select the correct Arabic translation',
        distractor_count: 3,
        distractor_strategy: 'same_pos_different_meaning',
        question_template: 'What does "{word}" mean in Arabic?',
        requires_fields: ['word', 'parts_of_speech[0].translation'],
    },

    [QUESTION_TYPES.REVERSE_TRANSLATION]: {
        name: 'Reverse Translation',
        difficulty: 'easy',
        description: 'Select the English word for Arabic translation',
        distractor_count: 3,
        distractor_strategy: 'similar_words_different_pos',
        question_template: 'What is the English word for "{translation}"?',
        requires_fields: ['word', 'parts_of_speech[0].translation'],
    },

    [QUESTION_TYPES.SENTENCE_COMPLETION]: {
        name: 'Sentence Completion',
        difficulty: 'medium',
        description: 'Complete the sentence with the correct word',
        distractor_count: 3,
        distractor_strategy: 'contextually_similar_words',
        question_template: 'Complete the sentence:\n"{sentence_with_blank}"',
        requires_fields: ['word', 'parts_of_speech[0].examples[0]'],
    },
};

/**
 * Get question type by difficulty level
 */
export const getQuestionTypesByDifficulty = (difficulty) => {
    return Object.entries(QUESTION_TYPE_METADATA)
        .filter(([_, meta]) => meta.difficulty === difficulty)
        .map(([type, _]) => type);
};

/**
 * Get random question type
 */
export const getRandomQuestionType = (excludeTypes = []) => {
    const availableTypes = Object.keys(QUESTION_TYPES)
        .filter(type => !excludeTypes.includes(type));

    return availableTypes[Math.floor(Math.random() * availableTypes.length)];
};

/**
 * Select question type based on user's confidence and history
 * Higher confidence = harder questions
 */
export const selectAdaptiveQuestionType = (confidence, recentHistory = []) => {
    // Get recent performance
    const recentCorrect = recentHistory.slice(-3).filter(q => q.correct).length;

    // If user is doing well (2-3 correct), give harder questions
    if (confidence >= 70 || recentCorrect >= 2) {
        return QUESTION_TYPES.SENTENCE_COMPLETION; // Medium difficulty
    }

    // If struggling, give easier questions
    if (confidence < 40 || recentCorrect === 0) {
        return QUESTION_TYPES.TRANSLATION_MATCH; // Easy
    }

    // Mixed performance - random between easy and medium
    return Math.random() > 0.5
        ? QUESTION_TYPES.TRANSLATION_MATCH
        : QUESTION_TYPES.SENTENCE_COMPLETION;
};

export default QUESTION_TYPES;
