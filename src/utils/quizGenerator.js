/**
 * Quiz Question Generator
 * Dynamically generates quiz questions from word data
 * 
 * TODO FUTURE: This dynamic generation approach is temporary for MVP.
 * Replace with curated, pre-written questions and answers for:
 * - Better quality control
 * - Perfect grammar and context
 * - No edge cases with word forms (e.g., have/has, irregular verbs)
 * - Appropriate difficulty progression
 * - Professional educational content
 */

import QUESTION_TYPES, { QUESTION_TYPE_METADATA } from './questionTypes';
import { selectDistractors } from './distractorSelector';

/**
 * Standard question object structure
 * All generators return this format
 */
const createQuestionObject = (
    word,
    questionType,
    questionText,
    options,
    correctIndex,
    metadata = {}
) => {
    return {
        id: `q_${word.id}_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
        word_id: word.id,
        word: word.word,
        question_type: questionType,
        question: questionText,
        options: options,
        correct_index: correctIndex,
        difficulty: QUESTION_TYPE_METADATA[questionType].difficulty,
        timestamp: new Date().toISOString(),
        metadata: {
            pos: word.parts_of_speech[0].pos,
            oxford_rank: word.oxford_rank,
            ...metadata
        }
    };
};

/**
 * Shuffle options and update correct index
 * Ensures correct answer isn't always in same position
 */
const shuffleOptions = (options, correctIndex) => {
    const shuffled = options.map((option, index) => ({
        text: option,
        wasCorrect: index === correctIndex
    }));

    // Fisher-Yates shuffle
    for (let i = shuffled.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
    }

    // Find new correct index
    const newCorrectIndex = shuffled.findIndex(opt => opt.wasCorrect);
    const finalOptions = shuffled.map(opt => opt.text);

    return { options: finalOptions, correctIndex: newCorrectIndex };
};

// ============================================================
// QUESTION GENERATOR 1: TRANSLATION MATCH
// ============================================================

/**
 * Generate "What does X mean in Arabic?" question
 * 
 * Example:
 * Q: What does "run" mean in Arabic?
 * Options:
 * - يجري، يركض (correct)
 * - يمشي، يسير (walk)
 * - يقفز، ينط (jump)
 * - يسبح، يعوم (swim)
 */
export const generateTranslationMatchQuestion = (targetWord, allWords) => {
    // Get target translation
    const targetTranslation = targetWord.parts_of_speech[0].translation;

    // Get metadata for this question type
    const metadata = QUESTION_TYPE_METADATA[QUESTION_TYPES.TRANSLATION_MATCH];

    // Select distractors
    const distractorWords = selectDistractors(
        targetWord,
        allWords,
        metadata.distractor_strategy,
        metadata.distractor_count
    );

    // Build options array
    const options = [
        targetTranslation, // Correct answer
        ...distractorWords.map(w => w.parts_of_speech[0].translation)
    ];

    // Shuffle options
    const { options: shuffledOptions, correctIndex } = shuffleOptions(options, 0);

    // Generate question text
    const questionText = `What does "${targetWord.word}" mean in Arabic?`;

    return createQuestionObject(
        targetWord,
        QUESTION_TYPES.TRANSLATION_MATCH,
        questionText,
        shuffledOptions,
        correctIndex,
        {
            original_correct_answer: targetTranslation,
            distractors: distractorWords.map(w => w.id)
        }
    );
};

// ============================================================
// QUESTION GENERATOR 2: REVERSE TRANSLATION
// ============================================================

/**
 * Generate "What is the English word for X?" question
 * 
 * Example:
 * Q: What is the English word for "يجري"?
 * Options:
 * - run (correct)
 * - walk
 * - jump
 * - swim
 */
export const generateReverseTranslationQuestion = (targetWord, allWords) => {
    const targetTranslation = targetWord.parts_of_speech[0].translation;
    const metadata = QUESTION_TYPE_METADATA[QUESTION_TYPES.REVERSE_TRANSLATION];

    // Select distractors
    const distractorWords = selectDistractors(
        targetWord,
        allWords,
        metadata.distractor_strategy,
        metadata.distractor_count
    );

    // Build options array
    const options = [
        targetWord.word, // Correct answer
        ...distractorWords.map(w => w.word)
    ];

    // Shuffle
    const { options: shuffledOptions, correctIndex } = shuffleOptions(options, 0);

    // Question text
    const questionText = `What is the English word for "${targetTranslation}"?`;

    return createQuestionObject(
        targetWord,
        QUESTION_TYPES.REVERSE_TRANSLATION,
        questionText,
        shuffledOptions,
        correctIndex,
        {
            original_correct_answer: targetWord.word,
            distractors: distractorWords.map(w => w.id)
        }
    );
};

// ============================================================
// QUESTION GENERATOR 3: SENTENCE COMPLETION
// ============================================================

/**
 * Generate sentence completion question
 * Uses actual example sentences from word data
 * 
 * Example:
 * Q: Complete the sentence:
 *    "I _____ every morning before work."
 * Options:
 * - run (correct)
 * - sleep
 * - eat
 * - think
 */
export const generateSentenceCompletionQuestion = (targetWord, allWords) => {
    const metadata = QUESTION_TYPE_METADATA[QUESTION_TYPES.SENTENCE_COMPLETION];

    // Get all examples and try to find one where we can create a valid blank
    const examples = targetWord.parts_of_speech[0].examples;
    let bestExample = null;
    let bestBlank = null;
    let replacedWord = null;

    // Try each example to find the best one
    for (const example of examples) {
        const sentence = example.sentence.replace(/\{|\}/g, '');
        const result = tryCreateBlank(sentence, targetWord.word);

        if (result.success) {
            bestExample = example;
            bestBlank = result.blank;
            replacedWord = result.replacedWord;
            break; // Found a good one, use it
        }
    }

    // Fallback: if no good example found, skip this word for sentence completion
    // Instead, use the first example but mark it  
    if (!bestExample) {
        bestExample = examples[0];
        const sentence = examples[0].sentence.replace(/\{|\}/g, '');
        bestBlank = sentence + ' _____';
        replacedWord = null;
    }

    // Select distractors
    const distractorWords = selectDistractors(
        targetWord,
        allWords,
        metadata.distractor_strategy,
        metadata.distractor_count
    );

    // Build options
    const options = [
        targetWord.word,
        ...distractorWords.map(w => w.word)
    ];

    // Shuffle
    const { options: shuffledOptions, correctIndex } = shuffleOptions(options, 0);

    // Question text
    const questionText = `Complete the sentence:\n"${bestBlank}"`;

    return createQuestionObject(
        targetWord,
        QUESTION_TYPES.SENTENCE_COMPLETION,
        questionText,
        shuffledOptions,
        correctIndex,
        {
            original_sentence: bestExample.sentence,
            context: bestExample.context,
            original_correct_answer: targetWord.word,
            replaced_word: replacedWord,
            distractors: distractorWords.map(w => w.id)
        }
    );
};

/**
 * Helper: Try to create a valid blank in a sentence
 */
const tryCreateBlank = (sentence, baseWord) => {
    // Strategy 1: Exact match
    const exactRegex = new RegExp(`\\b(${escapeRegex(baseWord)})\\b`, 'gi');
    if (exactRegex.test(sentence)) {
        const blank = sentence.replace(exactRegex, '_____');
        if (isValidBlankPosition(blank, sentence)) {
            return { success: true, blank, replacedWord: baseWord };
        }
    }

    // Strategy 2: Try irregular verb forms (for common verbs)
    const irregularForms = getIrregularVerbForms(baseWord);
    for (const form of irregularForms) {
        const formRegex = new RegExp(`\\b(${escapeRegex(form)})\\b`, 'gi');
        if (formRegex.test(sentence)) {
            const blank = sentence.replace(formRegex, '_____');
            if (isValidBlankPosition(blank, sentence)) {
                return { success: true, blank, replacedWord: form };
            }
        }
    }

    // Strategy 3: Try regular variations
    const variations = [
        baseWord + 's',
        baseWord + 'es',
        baseWord + 'ed',
        baseWord + 'd',
        baseWord + 'ing',
        baseWord.slice(0, -1) + 'ies',
        baseWord.slice(0, -1), // remove last letter (e.g., running → run)
    ];

    for (const variant of variations) {
        if (variant.length < 2) continue; // Skip if too short
        const varRegex = new RegExp(`\\b(${escapeRegex(variant)})\\b`, 'gi');
        if (varRegex.test(sentence)) {
            const blank = sentence.replace(varRegex, '_____');
            if (isValidBlankPosition(blank, sentence)) {
                return { success: true, blank, replacedWord: variant };
            }
        }
    }

    return { success: false };
};

/**
 * Check if blank position is valid
 */
const isValidBlankPosition = (blankSentence, originalSentence) => {
    // Must contain exactly one blank
    const blankCount = (blankSentence.match(/_____/g) || []).length;
    if (blankCount !== 1) return false;

    // Must not end with blank (unless sentence ends with punctuation after blank)
    if (/\s_____\s*$/.test(blankSentence)) {
        return false; // Blank at very end with no punctuation
    }

    // Must have content before and after blank
    const parts = blankSentence.split('_____');
    if (parts.length !== 2) return false;

    const before = parts[0].trim();
    const after = parts[1].trim();

    if (before.length === 0 || after.length === 0) return false;

    // Sentence with blank should be shorter than original
    if (blankSentence.length >= originalSentence.length) return false;

    return true;
};

/**
 * Get irregular verb forms for common English verbs
 */
const getIrregularVerbForms = (baseWord) => {
    const irregulars = {
        'be': ['am', 'is', 'are', 'was', 'were', 'been', 'being'],
        'have': ['has', 'had', 'having'],
        'do': ['does', 'did', 'done', 'doing'],
        'go': ['goes', 'went', 'gone', 'going'],
        'make': ['makes', 'made', 'making'],
        'take': ['takes', 'took', 'taken', 'taking'],
        'come': ['comes', 'came', 'coming'],
        'see': ['sees', 'saw', 'seen', 'seeing'],
        'get': ['gets', 'got', 'gotten', 'getting'],
        'give': ['gives', 'gave', 'given', 'giving'],
        'think': ['thinks', 'thought', 'thinking'],
        'know': ['knows', 'knew', 'known', 'knowing'],
        'say': ['says', 'said', 'saying'],
        'tell': ['tells', 'told', 'telling'],
        'find': ['finds', 'found', 'finding'],
        'feel': ['feels', 'felt', 'feeling'],
        'become': ['becomes', 'became', 'becoming'],
        'leave': ['leaves', 'left', 'leaving'],
        'put': ['puts', 'putting'],
        'mean': ['means', 'meant', 'meaning'],
        'keep': ['keeps', 'kept', 'keeping'],
        'let': ['lets', 'letting'],
        'begin': ['begins', 'began', 'begun', 'beginning'],
        'show': ['shows', 'showed', 'shown', 'showing'],
        'hear': ['hears', 'heard', 'hearing'],
        'run': ['runs', 'ran', 'running'],
        'bring': ['brings', 'brought', 'bringing'],
        'write': ['writes', 'wrote', 'written', 'writing'],
        'sit': ['sits', 'sat', 'sitting'],
        'stand': ['stands', 'stood', 'standing'],
        'lose': ['loses', 'lost', 'losing'],
        'pay': ['pays', 'paid', 'paying'],
        'meet': ['meets', 'met', 'meeting'],
        'set': ['sets', 'setting'],
        'learn': ['learns', 'learned', 'learnt', 'learning'],
        'lead': ['leads', 'led', 'leading'],
        'understand': ['understands', 'understood', 'understanding'],
        'speak': ['speaks', 'spoke', 'spoken', 'speaking'],
        'read': ['reads', 'reading'], // read past = read (same spelling)
        'spend': ['spends', 'spent', 'spending'],
        'grow': ['grows', 'grew', 'grown', 'growing'],
        'win': ['wins', 'won', 'winning'],
        'teach': ['teaches', 'taught', 'teaching'],
        'buy': ['buys', 'bought', 'buying'],
        'send': ['sends', 'sent', 'sending'],
        'build': ['builds', 'built', 'building'],
        'fall': ['falls', 'fell', 'fallen', 'falling'],
        'cut': ['cuts', 'cutting'],
        'sell': ['sells', 'sold', 'selling'],
        'break': ['breaks', 'broke', 'broken', 'breaking'],
        'eat': ['eats', 'ate', 'eaten', 'eating'],
        'catch': ['catches', 'caught', 'catching'],
        'draw': ['draws', 'drew', 'drawn', 'drawing'],
        'choose': ['chooses', 'chose', 'chosen', 'choosing'],
        'drive': ['drives', 'drove', 'driven', 'driving'],
        'fight': ['fights', 'fought', 'fighting'],
        'forget': ['forgets', 'forgot', 'forgotten', 'forgetting'],
        'hide': ['hides', 'hid', 'hidden', 'hiding'],
        'hold': ['holds', 'held', 'holding'],
        'lay': ['lays', 'laid', 'laying'],
        'lie': ['lies', 'lay', 'lain', 'lying'],
        'ride': ['rides', 'rode', 'ridden', 'riding'],
        'ring': ['rings', 'rang', 'rung', 'ringing'],
        'rise': ['rises', 'rose', 'risen', 'rising'],
        'shake': ['shakes', 'shook', 'shaken', 'shaking'],
        'shine': ['shines', 'shone', 'shining'],
        'sing': ['sings', 'sang', 'sung', 'singing'],
        'sink': ['sinks', 'sank', 'sunk', 'sinking'],
        'sleep': ['sleeps', 'slept', 'sleeping'],
        'slide': ['slides', 'slid', 'sliding'],
        'speak': ['speaks', 'spoke', 'spoken', 'speaking'],
        'spring': ['springs', 'sprang', 'sprung', 'springing'],
        'steal': ['steals', 'stole', 'stolen', 'stealing'],
        'stick': ['sticks', 'stuck', 'sticking'],
        'strike': ['strikes', 'struck', 'stricken', 'striking'],
        'swim': ['swims', 'swam', 'swum', 'swimming'],
        'swing': ['swings', 'swung', 'swinging'],
        'tear': ['tears', 'tore', 'torn', 'tearing'],
        'throw': ['throws', 'threw', 'thrown', 'throwing'],
        'wake': ['wakes', 'woke', 'woken', 'waking'],
        'wear': ['wears', 'wore', 'worn', 'wearing'],
    };

    return irregulars[baseWord.toLowerCase()] || [];
};

/**
 * Escape special regex characters
 */
const escapeRegex = (str) => {
    return str.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
};

// ============================================================
// MASTER QUESTION GENERATOR
// ============================================================

/**
 * Generate a quiz question of specified type
 * 
 * @param {Object} targetWord - The word to test
 * @param {Array} allWords - All available words for distractors
 * @param {String} questionType - Type from QUESTION_TYPES
 * @returns {Object} Question object
 */
export const generateQuestion = (targetWord, allWords, questionType = null) => {
    // If no type specified, choose randomly
    if (!questionType) {
        const types = Object.values(QUESTION_TYPES);
        questionType = types[Math.floor(Math.random() * types.length)];
    }

    // Validate word has required data
    if (!targetWord || !targetWord.parts_of_speech || targetWord.parts_of_speech.length === 0) {
        console.error('Invalid word data for quiz generation:', targetWord);
        return null;
    }

    // Generate based on type
    switch (questionType) {
        case QUESTION_TYPES.TRANSLATION_MATCH:
            return generateTranslationMatchQuestion(targetWord, allWords);

        case QUESTION_TYPES.REVERSE_TRANSLATION:
            return generateReverseTranslationQuestion(targetWord, allWords);

        case QUESTION_TYPES.SENTENCE_COMPLETION:
            return generateSentenceCompletionQuestion(targetWord, allWords);

        default:
            console.warn(`Unknown question type: ${questionType}`);
            return generateTranslationMatchQuestion(targetWord, allWords); // Fallback
    }
};

/**
 * Generate multiple questions for a word
 * Useful for testing the same word with different question types
 * 
 * @param {Object} targetWord - Word to test
 * @param {Array} allWords - All words for distractors
 * @param {Number} count - Number of questions (default 2)
 * @param {Array} types - Specific types to use (optional)
 * @returns {Array} Array of question objects
 */
export const generateMultipleQuestions = (
    targetWord,
    allWords,
    count = 2,
    types = null
) => {
    const questions = [];
    const availableTypes = types || Object.values(QUESTION_TYPES);

    for (let i = 0; i < count; i++) {
        // Use different question type for each question
        const typeIndex = i % availableTypes.length;
        const questionType = availableTypes[typeIndex];

        const question = generateQuestion(targetWord, allWords, questionType);
        if (question) {
            questions.push(question);
        }
    }

    return questions;
};

/**
 * Generate a quiz (multiple questions for multiple words)
 * 
 * @param {Array} wordsToTest - Words to include in quiz
 * @param {Array} allWords - All words for distractors
 * @param {Object} options - Configuration options
 * @returns {Object} Quiz object with questions array
 */
export const generateQuiz = (
    wordsToTest,
    allWords,
    options = {}
) => {
    const {
        questionsPerWord = 1,
        questionTypes = null,
        shuffle = true
    } = options;

    const allQuestions = [];

    // Generate questions for each word
    wordsToTest.forEach(word => {
        const questions = generateMultipleQuestions(
            word,
            allWords,
            questionsPerWord,
            questionTypes
        );
        allQuestions.push(...questions);
    });

    // Shuffle questions if requested
    const finalQuestions = shuffle
        ? allQuestions.sort(() => Math.random() - 0.5)
        : allQuestions;

    return {
        id: `quiz_${Date.now()}`,
        created_at: new Date().toISOString(),
        total_questions: finalQuestions.length,
        questions: finalQuestions,
        metadata: {
            words_tested: wordsToTest.map(w => w.id),
            questions_per_word: questionsPerWord,
            shuffled: shuffle
        }
    };
};

// ============================================================
// EXPORTS
// ============================================================

export default {
    generateQuestion,
    generateMultipleQuestions,
    generateQuiz,
    generateTranslationMatchQuestion,
    generateReverseTranslationQuestion,
    generateSentenceCompletionQuestion,
};
