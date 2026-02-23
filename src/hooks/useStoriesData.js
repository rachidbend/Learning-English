/**
 * useStoriesData.js — Central hook for the Stories tab
 *
 * PURPOSE:
 * This hook manages ALL state and logic for the Stories tab.
 * It replaces what would otherwise be scattered across multiple components.
 *
 * WHAT IT DOES:
 * 1. LOADS story data from stories_data.json and vocabulary data for word lookups
 * 2. MANAGES view state (library → reader → quiz) and transitions
 * 3. TRACKS progress per story (read status, quiz scores) in localStorage
 * 4. HANDLES story unlock logic (story N requires story N-1 to be read)
 * 5. PROVIDES word lookup for the tap-to-define feature in the reader
 *
 * DATA FLOW:
 * stories_data.json → levels/stories → merged with progress from localStorage
 * vocabulary_data.json → loaded for word lookup when user taps a word in reader
 *
 * PERSISTENCE:
 * Story progress is saved to localStorage under key 'stories_progress'
 * Structure: { [storyId]: { read: bool, quizScore: number, quizCompleted: bool } }
 */

import { useState, useEffect, useCallback, useMemo } from 'react';
import storiesData from '../data/stories_data.json';
import { loadBatch } from '../data/wordData';
import { analytics } from '../analytics/events';

const PROGRESS_KEY = 'stories_progress';

export function useStoriesData() {
    // ── View State ──────────────────────────────────────────────
    // Controls which view is rendered: 'library' | 'reader' | 'quiz'
    const [view, setView] = useState('library');

    // ── Selection State ─────────────────────────────────────────
    // Which level the user picked in the level selector (null = show level list)
    const [selectedLevelId, setSelectedLevelId] = useState(null);
    // Which story is currently being read/quizzed
    const [activeStoryId, setActiveStoryId] = useState(null);

    // ── Data ────────────────────────────────────────────────────
    // All vocabulary words loaded from batch 1 for the word lookup feature
    const [vocabWords, setVocabWords] = useState([]);
    // Per-story progress loaded from localStorage
    const [progress, setProgress] = useState({});

    // ── Timer ───────────────────────────────────────────────────
    // Tracks when user opened a story, for STORY_COMPLETED duration
    const [storyOpenTime, setStoryOpenTime] = useState(null);

    // Load vocabulary data and saved progress on mount
    useEffect(() => {
        const init = async () => {
            const data = await loadBatch(1);
            if (data?.words) setVocabWords(data.words);
            setProgress(loadStoriesProgress());
        };
        init();
    }, []);

    // ── Levels with computed progress ───────────────────────────
    // Each level gets: total stories, read count, and completion percentage
    const levels = useMemo(() => {
        return storiesData.levels.map((lvl) => {
            const total = lvl.stories.length;
            const readCount = lvl.stories.filter((s) => progress[s.id]?.read).length;
            return {
                ...lvl,
                totalStories: total,
                readCount,
                percent: total > 0 ? Math.round((readCount / total) * 100) : 0,
                hasStories: total > 0,
            };
        });
    }, [progress]);

    // Currently selected level object
    const selectedLevel = levels.find((l) => l.level_id === selectedLevelId) || null;

    // ── Stories for selected level, with progress and lock status ──
    // Story 1 is always unlocked. Story N requires story N-1 to be read.
    const storiesForLevel = useMemo(() => {
        if (!selectedLevel) return [];
        const stories = selectedLevel.stories || [];
        return stories.map((s, i) => ({
            ...s,
            progress: progress[s.id] || { read: false, quizScore: 0, quizCompleted: false },
            locked: i > 0 && !progress[stories[i - 1]?.id]?.read,
        }));
    }, [selectedLevel, progress]);

    // ── Active story object (full data for reader/quiz) ─────────
    const activeStory = useMemo(() => {
        if (!activeStoryId) return null;
        for (const lvl of storiesData.levels) {
            const found = lvl.stories.find((s) => s.id === activeStoryId);
            if (found) return found;
        }
        return null;
    }, [activeStoryId]);

    // ── Story Progress Helpers ──────────────────────────────────

    const getStoryProgress = useCallback((storyId) => {
        return progress[storyId] || { read: false, quizScore: 0, quizCompleted: false };
    }, [progress]);

    const isStoryLocked = useCallback((storyId) => {
        const story = storiesForLevel.find((s) => s.id === storyId);
        return story?.locked ?? false;
    }, [storiesForLevel]);

    // ── Navigation Actions ──────────────────────────────────────

    const setSelectedLevel = useCallback((levelId) => {
        setSelectedLevelId(levelId);
    }, []);

    // Open a story → transition to reader view
    const openStory = useCallback((storyId) => {
        setActiveStoryId(storyId);
        setStoryOpenTime(Date.now());
        setView('reader');
        analytics.track('STORY_OPENED', { story_id: storyId });
    }, []);

    // Close reader → back to library
    const closeStory = useCallback(() => {
        setActiveStoryId(null);
        setStoryOpenTime(null);
        setView('library');
    }, []);

    // Mark story as read (called when user scrolls to end)
    const markStoryRead = useCallback((storyId) => {
        const updated = { ...progress, [storyId]: { ...progress[storyId], read: true } };
        setProgress(updated);
        saveStoriesProgress(updated);
        const dur = storyOpenTime ? Math.round((Date.now() - storyOpenTime) / 1000) : 0;
        analytics.track('STORY_COMPLETED', { story_id: storyId, duration_seconds: dur });
    }, [progress, storyOpenTime]);

    // Open quiz for active story
    const openQuiz = useCallback(() => {
        setView('quiz');
    }, []);

    // Complete quiz with score → save and return to library
    const completeQuiz = useCallback((score, total) => {
        if (!activeStoryId) return;
        const pct = total > 0 ? Math.round((score / total) * 100) : 0;
        const updated = {
            ...progress,
            [activeStoryId]: { ...progress[activeStoryId], read: true, quizScore: score, quizCompleted: true },
        };
        setProgress(updated);
        saveStoriesProgress(updated);
        analytics.track('STORY_QUIZ_COMPLETED', { story_id: activeStoryId, score_percent: pct });
    }, [activeStoryId, progress]);

    // ── Word Lookup ─────────────────────────────────────────────
    // Searches vocabulary_data for a word match (case-insensitive)
    const lookupWord = useCallback((wordText) => {
        if (!wordText) return null;
        const clean = wordText.toLowerCase().trim();
        return vocabWords.find((w) => w.word.toLowerCase() === clean) || null;
    }, [vocabWords]);

    return {
        view, levels, selectedLevel, setSelectedLevel,
        storiesForLevel, activeStory, activeStoryId,
        getStoryProgress, isStoryLocked,
        openStory, closeStory, markStoryRead,
        openQuiz, completeQuiz, lookupWord,
    };
}

// ── localStorage Helpers ──────────────────────────────────────

function loadStoriesProgress() {
    try {
        const raw = localStorage.getItem(PROGRESS_KEY);
        return raw ? JSON.parse(raw) : {};
    } catch { return {}; }
}

function saveStoriesProgress(data) {
    try {
        localStorage.setItem(PROGRESS_KEY, JSON.stringify(data));
    } catch (e) {
        console.warn('[useStoriesData] Save failed:', e);
    }
}
