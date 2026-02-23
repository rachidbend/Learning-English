/**
 * ProgressContext.jsx — Wraps existing progressManager.js in a React Context
 *
 * Loads all progress on mount using loadProgress().
 * Exposes progress state and update functions to the whole app.
 * This context replaces any direct localStorage calls in components.
 */

import React, { createContext, useContext, useState, useEffect, useCallback } from 'react';
import {
    loadProgress,
    saveProgress,
    getDueWords,
    getNewWords,
    getLearningWords,
    getWeakWords,
} from '../data/progressManager';

const ProgressContext = createContext(null);

export function ProgressProvider({ children }) {
    const [progress, setProgress] = useState(null);
    const [isLoading, setIsLoading] = useState(true);

    // Load progress on mount
    useEffect(() => {
        try {
            const loaded = loadProgress();
            setProgress(loaded);
        } catch (err) {
            console.error('[ProgressContext] Load failed:', err);
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
            console.error('[ProgressContext] Reload failed:', err);
        }
    }, []);

    // Computed word lists
    const dueWords = progress ? getDueWords(progress) : [];
    const newWords = progress ? getNewWords(progress) : [];
    const learningWords = progress ? getLearningWords(progress) : [];
    const weakWords = progress ? getWeakWords(progress) : [];

    const value = {
        progress,
        isLoading,
        save,
        reload,
        dueWords,
        newWords,
        learningWords,
        weakWords,
    };

    return (
        <ProgressContext.Provider value={value}>
            {children}
        </ProgressContext.Provider>
    );
}

export function useProgress() {
    const context = useContext(ProgressContext);
    if (!context) {
        throw new Error('useProgress must be used within a ProgressProvider');
    }
    return context;
}
