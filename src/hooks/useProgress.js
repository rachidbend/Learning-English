/**
 * useProgress Hook
 * React hook for managing progress in components
 */

import { useState, useEffect } from 'react';
import {
    loadProgress,
    saveProgress,
    markWordAsSeen,
    updateWordConfidence,
    getWeakWords,
    updateBatchTest
} from '../data/progressManager';

/**
 * Custom hook for progress management
 */
export const useProgress = () => {
    const [progress, setProgress] = useState(null);
    const [isLoading, setIsLoading] = useState(true);

    // Load progress on mount
    useEffect(() => {
        const loaded = loadProgress();
        setProgress(loaded);
        setIsLoading(false);
    }, []);

    // Save progress whenever it changes
    useEffect(() => {
        if (progress && !isLoading) {
            saveProgress(progress);
        }
    }, [progress, isLoading]);

    // Helper functions that update state
    const markSeen = (wordId, batchId) => {
        setProgress(prev => {
            const updated = { ...prev };
            markWordAsSeen(updated, wordId, batchId);
            return updated;
        });
    };

    const updateConfidence = (wordId, correct, questionType) => {
        setProgress(prev => {
            const updated = { ...prev };
            updateWordConfidence(updated, wordId, correct, questionType);
            return updated;
        });
    };

    const completeBatchTest = (batchId, score, passed) => {
        setProgress(prev => {
            const updated = { ...prev };
            updateBatchTest(updated, batchId, score, passed);
            return updated;
        });
    };

    const getWeak = () => {
        return progress ? getWeakWords(progress) : [];
    };

    return {
        progress,
        isLoading,
        markSeen,
        updateConfidence,
        completeBatchTest,
        getWeak,
        setProgress
    };
};

export default useProgress;
