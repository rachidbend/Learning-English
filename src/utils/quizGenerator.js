/**
 * NEW Quiz Generator - Uses Pre-Generated Questions
 * Questions come from vocabulary_data.json with distractors included
 */

// Question type selection logic
export function selectQuestionForWord(word, questionType = null) {
    const availableQuestions = word.questions || [];

    if (availableQuestions.length === 0) {
        console.error(`No questions found for word: ${word.word}`);
        return null;
    }

    // Filter by type if specified
    let questions = questionType
        ? availableQuestions.filter(q => q.type === questionType)
        : availableQuestions;

    if (questions.length === 0) {
        // Fallback to any question if type not found
        questions = availableQuestions;
    }

    // Pick random question
    const question = questions[Math.floor(Math.random() * questions.length)];

    // Build options (correct answer + 3 random distractors)
    const distractors = question.distractors || [];
    const shuffledDistractors = shuffle([...distractors]);
    const selectedDistractors = shuffledDistractors.slice(0, 3);

    const options = shuffle([
        question.correct_answer,
        ...selectedDistractors
    ]);

    // Find correct index
    const correctIndex = options.indexOf(question.correct_answer);

    return {
        id: `q_${word.id}_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
        word_id: word.id,
        word: word.word,
        question_type: question.type, // Map 'type' to 'question_type' for compatibility
        type: question.type,
        question: question.prompt?.text || question.prompt_text, // Handle old/new format
        questionLanguage: question.prompt?.language || question.prompt_language,
        correctAnswer: question.correct_answer, // Maintain correct answer
        options: options,
        correct_index: correctIndex, // Required by Quiz component
        explanation: question.explanation,
        fullSentence: question.full_sentence,
        sentenceWithBlank: question.sentence_with_blank,
        metadata: {
            original_sentence: question.full_sentence,
            context: question.explanation
        }
    };
}

// Shuffle helper
function shuffle(array) {
    const newArray = [...array];
    for (let i = newArray.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [newArray[i], newArray[j]] = [newArray[j], newArray[i]];
    }
    return newArray;
}

// Build multiple questions for a word (for session)
export function buildQuestionsForWord(word, count = 3) {
    const questions = [];
    const availableTypes = ['translation_match', 'reverse_translation', 'sentence_completion'];

    // Try to get variety of question types
    for (let i = 0; i < count; i++) {
        const typeIndex = i % availableTypes.length;
        const question = selectQuestionForWord(word, availableTypes[typeIndex]);
        if (question) {
            questions.push(question);
        }
    }

    // If we didn't get enough, add random questions
    while (questions.length < count) {
        const question = selectQuestionForWord(word);
        if (question) {
            questions.push(question);
        } else {
            break;
        }
    }

    return questions;
}

export const generateQuestion = (targetWord, allWords, questionType = null) => {
    return selectQuestionForWord(targetWord, questionType);
};

export default {
    selectQuestionForWord,
    buildQuestionsForWord,
    generateQuestion
};
