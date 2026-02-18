/**
 * useProgress.js
 *
 * React hook for managing progress state (v2 — spaced repetition system).
 * Centralizes progress loading, saving, and computed values.
 *
 * Usage:
 *   const { progress, isLoading, save, dueWords, stats } = useProgress();
 */

import { useState, useEffect, useCallback } from 'react';
import {
    loadProgress,
    saveProgress,
    getDueWords,
    getNewWords,
    getLearningWords,
    getWeakWords,
} from '../data/progressManager';

export const useProgress = () => {
    const [progress, setProgress] = useState(null);
    const [isLoading, setIsLoading] = useState(true);

    // Load progress on mount
    useEffect(() => {
        try {
            const loaded = loadProgress();
            setProgress(loaded);
        } catch (err) {
            console.error('[useProgress] Load failed:', err);
        } finally {
            setIsLoading(false);
        }
    }, []);

    // Save and update state
    const save = useCallback((updatedProgress) => {
        setProgress(updatedProgress);
        saveProgress(updatedProgress);
    }, []);

    // Reload from localStorage (e.g. after DevPanel changes)
    const reload = useCallback(() => {
        try {
            const loaded = loadProgress();
            setProgress(loaded);
        } catch (err) {
            console.error('[useProgress] Reload failed:', err);
        }
    }, []);

    // Computed word lists
    const dueWords = progress ? getDueWords(progress) : [];
    const newWords = progress ? getNewWords(progress) : [];
    const learningWords = progress ? getLearningWords(progress) : [];
    const weakWords = progress ? getWeakWords(progress) : [];

    // Computed stats
    const stats = progress ? computeStats(progress) : null;

    return {
        progress,
        isLoading,
        save,
        reload,
        dueWords,
        newWords,
        learningWords,
        weakWords,
        stats,
    };
};

/**
 * Compute summary stats from progress data.
 */
const computeStats = (progress) => {
    const words = Object.values(progress.wordProgress || {});

    const totalWords = words.length;
    const wordsInReview = words.filter(w => w.card_state === 'review').length;
    const wordsLearning = words.filter(w => w.card_state === 'learning').length;
    const wordsMastered = words.filter(w => (w.confidence || 0) >= 90).length;

    // Average confidence across non-new words
    const activeWords = words.filter(w => w.card_state !== 'new');
    const avgConfidence = activeWords.length > 0
        ? Math.round(activeWords.reduce((sum, w) => sum + (w.confidence || 0), 0) / activeWords.length)
        : 0;

    return {
        totalWords,
        wordsInReview,
        wordsLearning,
        wordsMastered,
        avgConfidence,
        streak: progress.stats?.current_streak_days || 0,
        totalSessions: progress.stats?.total_sessions || 0,
    };
};

export default useProgress;
