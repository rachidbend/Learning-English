/**
 * Progress Manager Tests
 * Run in browser console to verify functionality
 */

import {
    loadProgress,
    saveProgress,
    clearProgress,
    markWordAsSeen,
    updateWordConfidence,
    getWeakWords,
    updateBatchTest,
    getStorageInfo,
    printProgressSummary
} from '../progressManager';
import { WORD_STATUS, BATCH_STATUS } from '../progressStructure';

/**
 * Run all tests
 */
export const runProgressTests = () => {
    console.log('🧪 Starting Progress Manager Tests...\n');

    let passed = 0;
    let failed = 0;

    // Test 1: Load initial progress
    console.log('TEST 1: Load Initial Progress');
    try {
        clearProgress();
        const progress = loadProgress();

        if (progress.version === '1.0' &&
            progress.createdAt &&
            Object.keys(progress.wordProgress).length === 0) {
            console.log('✅ PASS: Initial structure correct\n');
            passed++;
        } else {
            console.log('❌ FAIL: Initial structure incorrect\n');
            failed++;
        }
    } catch (e) {
        console.log('❌ FAIL:', e.message, '\n');
        failed++;
    }

    // Test 2: Mark word as seen
    console.log('TEST 2: Mark Word as Seen');
    try {
        let progress = loadProgress();
        markWordAsSeen(progress, 1, 1);
        saveProgress(progress);

        // Reload and verify
        progress = loadProgress();
        const word1 = progress.wordProgress['1'];

        if (word1.status === WORD_STATUS.SEEN &&
            word1.times_seen === 1 &&
            word1.first_seen_date) {
            console.log('✅ PASS: Word marked as seen correctly\n');
            passed++;
        } else {
            console.log('❌ FAIL: Word status incorrect\n');
            failed++;
        }
    } catch (e) {
        console.log('❌ FAIL:', e.message, '\n');
        failed++;
    }

    // Test 3: Update confidence
    console.log('TEST 3: Update Confidence (Correct Answer)');
    try {
        let progress = loadProgress();
        updateWordConfidence(progress, 1, true, 'translation_match');
        saveProgress(progress);

        progress = loadProgress();
        const word1 = progress.wordProgress['1'];

        if (word1.confidence > 0 &&
            word1.times_correct === 1 &&
            word1.times_tested === 1 &&
            word1.quiz_history.length === 1) {
            console.log('✅ PASS: Confidence updated correctly\n');
            passed++;
        } else {
            console.log('❌ FAIL: Confidence update incorrect\n');
            failed++;
        }
    } catch (e) {
        console.log('❌ FAIL:', e.message, '\n');
        failed++;
    }

    // Test 4: Multiple updates reach mastery
    console.log('TEST 4: Reach Mastery Status');
    try {
        let progress = loadProgress();

        // Answer correctly multiple times
        for (let i = 0; i < 10; i++) {
            updateWordConfidence(progress, 1, true);
        }
        saveProgress(progress);

        progress = loadProgress();
        const word1 = progress.wordProgress['1'];

        if (word1.confidence >= 90 &&
            word1.status === WORD_STATUS.MASTERED) {
            console.log('✅ PASS: Mastery reached\n');
            passed++;
        } else {
            console.log('❌ FAIL: Did not reach mastery (confidence:', word1.confidence, ')\n');
            failed++;
        }
    } catch (e) {
        console.log('❌ FAIL:', e.message, '\n');
        failed++;
    }

    // Test 5: Confidence decreases on wrong answer
    console.log('TEST 5: Confidence Decreases on Wrong Answer');
    try {
        let progress = loadProgress();
        const beforeConfidence = progress.wordProgress['1'].confidence;

        updateWordConfidence(progress, 1, false);
        saveProgress(progress);

        progress = loadProgress();
        const afterConfidence = progress.wordProgress['1'].confidence;

        if (afterConfidence < beforeConfidence &&
            progress.wordProgress['1'].times_incorrect === 1) {
            console.log('✅ PASS: Confidence decreased\n');
            passed++;
        } else {
            console.log('❌ FAIL: Confidence did not decrease\n');
            failed++;
        }
    } catch (e) {
        console.log('❌ FAIL:', e.message, '\n');
        failed++;
    }

    // Test 6: Get weak words
    console.log('TEST 6: Get Weak Words');
    try {
        let progress = loadProgress();

        // Create some weak words
        markWordAsSeen(progress, 2, 1);
        markWordAsSeen(progress, 3, 1);
        updateWordConfidence(progress, 2, false);
        updateWordConfidence(progress, 3, false);
        saveProgress(progress);

        progress = loadProgress();
        const weakWords = getWeakWords(progress);

        if (weakWords.length >= 2 && weakWords.includes(2) && weakWords.includes(3)) {
            console.log('✅ PASS: Weak words identified\n');
            passed++;
        } else {
            console.log('❌ FAIL: Weak words not identified correctly\n');
            failed++;
        }
    } catch (e) {
        console.log('❌ FAIL:', e.message, '\n');
        failed++;
    }

    // Test 7: Batch test completion
    console.log('TEST 7: Batch Test Completion');
    try {
        let progress = loadProgress();
        updateBatchTest(progress, 1, 95, true);
        saveProgress(progress);

        progress = loadProgress();
        const batch1 = progress.batchProgress['1'];
        const batch2 = progress.batchProgress['2'];

        if (batch1.status === BATCH_STATUS.COMPLETED &&
            batch1.test_score === 95 &&
            batch2?.status === BATCH_STATUS.UNLOCKED) {
            console.log('✅ PASS: Batch completion works\n');
            passed++;
        } else {
            console.log('❌ FAIL: Batch completion incorrect\n');
            failed++;
        }
    } catch (e) {
        console.log('❌ FAIL:', e.message, '\n');
        failed++;
    }

    // Test 8: Persistence across sessions
    console.log('TEST 8: Data Persists');
    try {
        const progress1 = loadProgress();
        const wordsCount = Object.keys(progress1.wordProgress).length;

        // Simulate page reload by loading again
        const progress2 = loadProgress();
        const wordsCount2 = Object.keys(progress2.wordProgress).length;

        if (wordsCount === wordsCount2 && wordsCount > 0) {
            console.log('✅ PASS: Data persists\n');
            passed++;
        } else {
            console.log('❌ FAIL: Data does not persist\n');
            failed++;
        }
    } catch (e) {
        console.log('❌ FAIL:', e.message, '\n');
        failed++;
    }

    // Summary
    console.log('===================');
    console.log('📊 TEST SUMMARY');
    console.log('===================');
    console.log(`✅ Passed: ${passed}`);
    console.log(`❌ Failed: ${failed}`);
    console.log(`Total: ${passed + failed}`);
    console.log('===================\n');

    // Print current progress
    printProgressSummary();

    return { passed, failed };
};

// Export for use in browser console
if (typeof window !== 'undefined') {
    window.runProgressTests = runProgressTests;
}
