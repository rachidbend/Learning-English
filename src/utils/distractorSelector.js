/**
 * Distractor Selection Utilities
 * Smart algorithms to select plausible but incorrect answer choices
 */

/**
 * Shuffle array using Fisher-Yates algorithm
 */
const shuffleArray = (array) => {
    const shuffled = [...array];
    for (let i = shuffled.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
    }
    return shuffled;
};

/**
 * STRATEGY 1: Same POS, Different Meaning
 * Used for translation match questions
 * Selects words with same part of speech but different meanings
 */
export const selectSamePOSDistractors = (targetWord, allWords, count = 3) => {
    const targetPOS = targetWord.parts_of_speech[0].pos;

    // Filter words with same POS but different from target
    const candidates = allWords.filter(word =>
        word.id !== targetWord.id &&
        word.parts_of_speech.some(pos => pos.pos === targetPOS)
    );

    // Shuffle and take required count
    const shuffled = shuffleArray(candidates);
    return shuffled.slice(0, count);
};

/**
 * STRATEGY 2: Similar Words, Different POS
 * Used for reverse translation questions
 * Selects words that might be confused with target
 */
export const selectSimilarWordDistractors = (targetWord, allWords, count = 3) => {
    // Get words with similar length or starting letter
    const targetLength = targetWord.word.length;
    const targetFirstLetter = targetWord.word[0].toLowerCase();

    const candidates = allWords.filter(word => {
        if (word.id === targetWord.id) return false;

        const lengthDiff = Math.abs(word.word.length - targetLength);
        const sameFirstLetter = word.word[0].toLowerCase() === targetFirstLetter;

        // Prefer words with similar length OR same first letter
        return lengthDiff <= 2 || sameFirstLetter;
    });

    // If not enough candidates, fall back to random words
    if (candidates.length < count) {
        const remaining = allWords.filter(w =>
            w.id !== targetWord.id &&
            !candidates.includes(w)
        );
        candidates.push(...shuffleArray(remaining));
    }

    const shuffled = shuffleArray(candidates);
    return shuffled.slice(0, count);
};

/**
 * STRATEGY 3: Contextually Similar Words
 * Used for sentence completion questions
 * Selects words that could grammatically fit but are semantically wrong
 */
export const selectContextualDistractors = (targetWord, allWords, count = 3) => {
    const targetPOS = targetWord.parts_of_speech[0].pos;

    // Priority 1: Same POS (grammatically plausible)
    const samePOS = allWords.filter(word =>
        word.id !== targetWord.id &&
        word.parts_of_speech.some(pos => pos.pos === targetPOS)
    );

    // Priority 2: Common words (harder to eliminate)
    const commonWords = samePOS.filter(word => word.oxford_rank <= 500);

    // Use common words if available, otherwise any same POS
    const candidates = commonWords.length >= count ? commonWords : samePOS;

    const shuffled = shuffleArray(candidates);
    return shuffled.slice(0, count);
};

/**
 * STRATEGY 4: Random Distractors (fallback)
 * Used when other strategies can't find enough candidates
 */
export const selectRandomDistractors = (targetWord, allWords, count = 3) => {
    const candidates = allWords.filter(word => word.id !== targetWord.id);
    const shuffled = shuffleArray(candidates);
    return shuffled.slice(0, count);
};

/**
 * Master distractor selector
 * Chooses appropriate strategy based on question type
 */
export const selectDistractors = (
    targetWord,
    allWords,
    strategy,
    count = 3
) => {
    // Ensure we have enough words
    if (allWords.length < count + 1) {
        console.warn('Not enough words for distractors');
        return [];
    }

    let distractors;

    switch (strategy) {
        case 'same_pos_different_meaning':
            distractors = selectSamePOSDistractors(targetWord, allWords, count);
            break;

        case 'similar_words_different_pos':
            distractors = selectSimilarWordDistractors(targetWord, allWords, count);
            break;

        case 'contextually_similar_words':
            distractors = selectContextualDistractors(targetWord, allWords, count);
            break;

        default:
            distractors = selectRandomDistractors(targetWord, allWords, count);
    }

    // Fallback if not enough distractors found
    if (distractors.length < count) {
        const remaining = selectRandomDistractors(targetWord, allWords, count - distractors.length);
        distractors.push(...remaining);
    }

    return distractors.slice(0, count);
};

export default {
    selectDistractors,
    selectSamePOSDistractors,
    selectSimilarWordDistractors,
    selectContextualDistractors,
    selectRandomDistractors,
};
