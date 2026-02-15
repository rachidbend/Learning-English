/**
 * Quiz Generator Manual Test
 * Open browser console and run: window.testQuizGeneration()
 */

import { generateQuestion, generateQuiz } from './quizGenerator';
import QUESTION_TYPES from './questionTypes';
import { validateQuestion, validateQuiz } from './quizValidator';
import { loadBatch } from '../data/wordData';

/**
 * Test quiz generation with actual batch data
 */
export const testQuizGeneration = async () => {
    console.log('=== Testing Quiz Generation ===\n');

    // Load word data
    const batch = await loadBatch(1);
    const words = batch.words;

    console.log(`✓ Loaded ${words.length} words from batch 1\n`);

    // Test 1: Translation Match
    console.log('TEST 1: Translation Match Question');
    console.log('-----------------------------------');
    const word1 = words[0];
    const q1 = generateQuestion(word1, words, QUESTION_TYPES.TRANSLATION_MATCH);
    console.log('Word:', word1.word);
    console.log('Question:', q1.question);
    console.log('Options:', q1.options);
    console.log('Correct answer:', q1.options[q1.correct_index]);
    const validation1 = validateQuestion(q1);
    console.log('Valid:', validation1.valid ? '✓' : '✗');
    if (!validation1.valid) console.log('Errors:', validation1.errors);
    console.log('');

    // Test 2: Reverse Translation
    console.log('TEST 2: Reverse Translation Question');
    console.log('------------------------------------');
    const q2 = generateQuestion(word1, words, QUESTION_TYPES.REVERSE_TRANSLATION);
    console.log('Question:', q2.question);
    console.log('Options:', q2.options);
    console.log('Correct answer:', q2.options[q2.correct_index]);
    const validation2 = validateQuestion(q2);
    console.log('Valid:', validation2.valid ? '✓' : '✗');
    console.log('');

    // Test 3: Sentence Completion
    console.log('TEST 3: Sentence Completion Question');
    console.log('------------------------------------');
    const q3 = generateQuestion(word1, words, QUESTION_TYPES.SENTENCE_COMPLETION);
    console.log('Question:', q3.question);
    console.log('Options:', q3.options);
    console.log('Correct answer:', q3.options[q3.correct_index]);
    const validation3 = validateQuestion(q3);
    console.log('Valid:', validation3.valid ? '✓' : '✗');
    console.log('');

    // Test 4: Generate Full Quiz
    console.log('TEST 4: Generate Full Quiz (5 words, 2 questions each)');
    console.log('-------------------------------------------------------');
    const wordsToTest = words.slice(0, 5);
    const quiz = generateQuiz(wordsToTest, words, {
        questionsPerWord: 2,
        shuffle: true
    });
    console.log(`✓ Generated quiz with ${quiz.total_questions} questions`);
    const quizValidation = validateQuiz(quiz);
    console.log('Quiz valid:', quizValidation.valid ? '✓' : '✗');
    console.log('Valid questions:', `${quizValidation.valid_questions}/${quizValidation.total_questions}`);
    if (!quizValidation.valid) {
        console.log('Errors:', quizValidation.errors);
    }
    console.log('');

    // Test 5: Check for Duplicates
    console.log('TEST 5: Checking for Duplicate Options');
    console.log('---------------------------------------');
    let duplicatesFound = 0;
    quiz.questions.forEach((q, index) => {
        const unique = new Set(q.options);
        if (unique.size !== q.options.length) {
            console.warn(`Question ${index + 1} has duplicate options:`, q.options);
            duplicatesFound++;
        }
    });
    console.log(duplicatesFound === 0
        ? '✓ No duplicates found'
        : `✗ Found ${duplicatesFound} questions with duplicates`
    );
    console.log('');

    // Test 6: Verify Correct Answers
    console.log('TEST 6: Verify Correct Answers');
    console.log('-------------------------------');
    let incorrectAnswers = 0;
    quiz.questions.forEach((q, index) => {
        const word = words.find(w => w.id === q.word_id);
        const correctOption = q.options[q.correct_index];

        if (q.question_type === QUESTION_TYPES.TRANSLATION_MATCH) {
            const expectedAnswer = word.parts_of_speech[0].translation;
            if (correctOption !== expectedAnswer) {
                console.warn(
                    `Question ${index + 1}: Wrong answer. Expected "${expectedAnswer}", got "${correctOption}"`
                );
                incorrectAnswers++;
            }
        } else if (q.question_type === QUESTION_TYPES.REVERSE_TRANSLATION) {
            const expectedAnswer = word.word;
            if (correctOption !== expectedAnswer) {
                console.warn(
                    `Question ${index + 1}: Wrong answer. Expected "${expectedAnswer}", got "${correctOption}"`
                );
                incorrectAnswers++;
            }
        }
    });
    console.log(incorrectAnswers === 0
        ? '✓ All correct answers valid'
        : `✗ Found ${incorrectAnswers} incorrect answers`
    );
    console.log('');

    // Test 7: Sample Questions Display
    console.log('TEST 7: Sample Questions');
    console.log('------------------------');
    console.log('Here are 3 sample questions from the quiz:\n');
    quiz.questions.slice(0, 3).forEach((q, index) => {
        console.log(`Question ${index + 1} (${q.question_type}):`);
        console.log(q.question);
        q.options.forEach((opt, i) => {
            const marker = i === q.correct_index ? '✓' : ' ';
            console.log(`  ${marker} ${i + 1}. ${opt}`);
        });
        console.log('');
    });

    console.log('=== All Tests Complete ===\n');
    console.log('Summary:');
    console.log('- Total quiz questions:', quiz.total_questions);
    console.log('- Valid questions:', quizValidation.valid_questions);
    console.log('- Duplicates found:', duplicatesFound);
    console.log('- Incorrect answers:', incorrectAnswers);
    console.log('- Overall status:',
        quizValidation.valid && duplicatesFound === 0 && incorrectAnswers === 0
            ? '✓ ALL TESTS PASSED'
            : '✗ SOME TESTS FAILED'
    );

    return quiz;
};

// Export for browser console
if (typeof window !== 'undefined') {
    window.testQuizGeneration = testQuizGeneration;
}

export default testQuizGeneration;
