/**
 * Quiz Validator
 * Validates generated questions for quality and correctness
 */

/**
 * Validate single question structure
 */
export const validateQuestion = (question) => {
    const errors = [];

    // Check required fields
    if (!question.id) errors.push('Missing question ID');
    if (!question.word_id) errors.push('Missing word_id');
    if (!question.question_type) errors.push('Missing question_type');
    if (!question.question) errors.push('Missing question text');
    if (!question.options || !Array.isArray(question.options)) {
        errors.push('Missing or invalid options array');
    }
    if (typeof question.correct_index !== 'number') {
        errors.push('Missing or invalid correct_index');
    }

    // Check options
    if (question.options) {
        if (question.options.length < 2) {
            errors.push('Need at least 2 options');
        }
        if (question.options.length > 6) {
            errors.push('Too many options (max 6)');
        }

        // Check for duplicate options
        const uniqueOptions = new Set(question.options);
        if (uniqueOptions.size !== question.options.length) {
            errors.push('Duplicate options found');
        }

        // Check correct index is valid
        if (question.correct_index < 0 || question.correct_index >= question.options.length) {
            errors.push('correct_index out of range');
        }
    }

    return {
        valid: errors.length === 0,
        errors
    };
};

/**
 * Validate quiz object
 */
export const validateQuiz = (quiz) => {
    const errors = [];

    if (!quiz.questions || !Array.isArray(quiz.questions)) {
        errors.push('Missing or invalid questions array');
        return { valid: false, errors };
    }

    if (quiz.questions.length === 0) {
        errors.push('Quiz has no questions');
    }

    // Validate each question
    quiz.questions.forEach((q, index) => {
        const result = validateQuestion(q);
        if (!result.valid) {
            errors.push(`Question ${index + 1}: ${result.errors.join(', ')}`);
        }
    });

    return {
        valid: errors.length === 0,
        errors,
        total_questions: quiz.questions.length,
        valid_questions: quiz.questions.filter(q => validateQuestion(q).valid).length
    };
};

/**
 * Check question quality
 * Detects potential issues that don't break functionality but reduce quality
 */
export const assessQuestionQuality = (question, targetWord, allWords) => {
    const warnings = [];
    const suggestions = [];

    // Check if distractors are too similar to correct answer
    const correctAnswer = question.options[question.correct_index];
    question.options.forEach((option, index) => {
        if (index !== question.correct_index) {
            // Check length similarity
            if (Math.abs(option.length - correctAnswer.length) <= 2) {
                warnings.push(`Distractor "${option}" has similar length to correct answer`);
            }

            // Check if starts with same letter
            if (option[0].toLowerCase() === correctAnswer[0].toLowerCase()) {
                suggestions.push(`Consider distractors that don't start with "${correctAnswer[0]}"`);
            }
        }
    });

    // Check if question text is clear
    if (question.question.length < 10) {
        warnings.push('Question text is very short');
    }

    if (question.question.length > 200) {
        warnings.push('Question text is very long');
    }

    return {
        quality_score: Math.max(0, 100 - (warnings.length * 20) - (suggestions.length * 10)),
        warnings,
        suggestions
    };
};

export default {
    validateQuestion,
    validateQuiz,
    assessQuestionQuality
};
