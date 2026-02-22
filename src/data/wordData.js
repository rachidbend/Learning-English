import batchesMetadata from './batches.json';

/**
 * Dynamically import a batch by ID
 * @param {number} batchId - The batch ID to load
 * @returns {Promise<Object>} - The batch data
 */
export const loadBatch = async (batchId) => {
    try {
        const batch = await import('./vocabulary_data.json');
        const data = batch.default || batch;

        // Optionally filter by batch_id if that's how we differentiate batches
        // For MVP we just return all words
        return data;
    } catch (error) {
        console.error(`Failed to load batch ${batchId}:`, error);
        return null;
    }
};

/**
 * Load multiple batches at once
 * @param {number[]} batchIds - Array of batch IDs to load
 * @returns {Promise<Object[]>} - Array of batch data
 */
export const loadBatches = async (batchIds) => {
    const promises = batchIds.map(id => loadBatch(id));
    return Promise.all(promises);
};

/**
 * Get all words from specific batches
 * @param {number[]} batchIds - Array of batch IDs
 * @returns {Promise<Array>} - Flattened array of all words
 */
export const getWordsFromBatches = async (batchIds) => {
    const batches = await loadBatches(batchIds);
    return batches
        .filter(batch => batch !== null)
        .flatMap(batch => batch.words);
};

/**
 * Get a single word by ID across all batches
 * @param {number} wordId - The word ID to find
 * @returns {Promise<Object|null>} - The word object or null
 */
export const getWordById = async (wordId) => {
    // Assuming 100 words per batch
    const batchId = Math.ceil(wordId / 100);
    const batch = await loadBatch(batchId);

    if (!batch) return null;

    return batch.words.find(word => word.id === wordId) || null;
};

/**
 * Get words in a specific ID range
 * @param {number} startId - Starting word ID
 * @param {number} endId - Ending word ID
 * @returns {Promise<Array>} - Array of words in range
 */
export const getWordsInRange = async (startId, endId) => {
    const startBatch = Math.ceil(startId / 100);
    const endBatch = Math.ceil(endId / 100);

    const batchIds = [];
    for (let i = startBatch; i <= endBatch; i++) {
        batchIds.push(i);
    }

    const words = await getWordsFromBatches(batchIds);
    return words.filter(word => word.id >= startId && word.id <= endId);
};

/**
 * Get random words from a batch (for quiz generation)
 * @param {number} batchId - The batch to select from
 * @param {number} count - Number of random words to get
 * @param {number[]} excludeIds - Array of word IDs to exclude
 * @returns {Promise<Array>} - Array of random words
 */
export const getRandomWordsFromBatch = async (batchId, count, excludeIds = []) => {
    const batch = await loadBatch(batchId);
    if (!batch) return [];

    const availableWords = batch.words.filter(
        word => !excludeIds.includes(word.id)
    );

    // Shuffle and take first N
    const shuffled = [...availableWords].sort(() => 0.5 - Math.random());
    return shuffled.slice(0, count);
};

/**
 * Get batch metadata
 * @param {number} batchId - The batch ID
 * @returns {Object|null} - Batch metadata or null
 */
export const getBatchMetadata = (batchId) => {
    return batchesMetadata.batches.find(b => b.batch_id === batchId) || null;
};

/**
 * Get all batches metadata
 * @returns {Array} - Array of all batch metadata
 */
export const getAllBatchesMetadata = () => {
    return batchesMetadata.batches;
};

/**
 * Check if a batch is unlocked based on previous batch completion
 * @param {number} batchId - Batch to check
 * @param {Object} userProgress - User's batch progress from localStorage
 * @returns {boolean} - Whether batch is unlocked
 */
export const isBatchUnlocked = (batchId, userProgress) => {
    // Batch 1 is always unlocked
    if (batchId === 1) return true;

    // Check if previous batch is completed
    const previousBatch = userProgress[batchId - 1];
    return previousBatch && previousBatch.status === 'completed';
};

/**
 * Search for words by partial match
 * @param {string} searchTerm - Term to search for
 * @param {number[]} batchIds - Batches to search in
 * @returns {Promise<Array>} - Matching words
 */
export const searchWords = async (searchTerm, batchIds) => {
    const words = await getWordsFromBatches(batchIds);
    const lowerSearch = searchTerm.toLowerCase();

    return words.filter(word => {
        if (word.word.toLowerCase().includes(lowerSearch)) return true;
        if (word.translations?.primary?.includes(searchTerm)) return true;
        return false;
    });
};

export default {
    loadBatch,
    loadBatches,
    getWordsFromBatches,
    getWordById,
    getWordsInRange,
    getRandomWordsFromBatch,
    getBatchMetadata,
    getAllBatchesMetadata,
    isBatchUnlocked,
    searchWords
};
