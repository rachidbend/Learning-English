/**
 * useReviewData.js — Central hook for the Review tab
 *
 * Derives due words, 7-day forecast, retention rate, streak,
 * and session stats from raw progress data.
 */

import { useState, useEffect, useCallback, useMemo } from 'react';
import { loadProgress, getDueWords, getNow } from '../data/progressManager';
import { loadBatch } from '../data/wordData';
import { calculateCurrentStreak } from '../utils/streakCalculator';

const LAST_SESSION_KEY = 'last_review_session';

export function useReviewData() {
    const [progress, setProgress] = useState(null);
    const [allWords, setAllWords] = useState([]);
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
        const init = async () => {
            try {
                setProgress(loadProgress());
                const data = await loadBatch(1);
                if (data?.words) setAllWords(data.words);
            } catch (err) {
                console.error('[useReviewData] Init failed:', err);
            } finally {
                setIsLoading(false);
            }
        };
        init();
    }, []);

    const refreshData = useCallback(() => {
        setProgress(loadProgress());
    }, []);

    // Due words right now
    const dueWordProgress = useMemo(() => {
        if (!progress) return [];
        return getDueWords(progress);
    }, [progress]);

    const dueNow = dueWordProgress.length;

    // Map due word IDs to actual word objects
    const dueWords = useMemo(() => {
        const dueIds = new Set(dueWordProgress.map((wp) => wp.word_id));
        return allWords.filter((w) => dueIds.has(w.id));
    }, [dueWordProgress, allWords]);

    // Overdue count (due before today midnight)
    const overdueCount = useMemo(() => {
        const todayStart = new Date(getNow());
        todayStart.setHours(0, 0, 0, 0);
        return dueWordProgress.filter((wp) => new Date(wp.due_date) < todayStart).length;
    }, [dueWordProgress]);

    // 7-day forecast
    const forecast = useMemo(() => {
        if (!progress) return Array(7).fill(null).map((_, i) => ({ date: '', label: '', count: 0, isToday: i === 0 }));

        const now = getNow();
        const days = [];
        const dayLabels = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
        const wordEntries = Object.values(progress.wordProgress || {});

        for (let i = 0; i < 7; i++) {
            const d = new Date(now);
            d.setDate(d.getDate() + i);
            const dayStart = new Date(d);
            dayStart.setHours(0, 0, 0, 0);
            const dayEnd = new Date(d);
            dayEnd.setHours(23, 59, 59, 999);

            const count = wordEntries.filter((wp) => {
                if (!wp.due_date || wp.card_state === 'new') return false;
                const due = new Date(wp.due_date);
                return i === 0 ? due <= dayEnd : due >= dayStart && due <= dayEnd;
            }).length;

            days.push({
                date: d.toISOString().split('T')[0],
                label: i === 0 ? 'Today' : dayLabels[d.getDay()],
                count,
                isToday: i === 0,
            });
        }
        return days;
    }, [progress]);

    // Retention rate
    const { retentionRate, totalReviewed } = useMemo(() => {
        if (!progress) return { retentionRate: 0, totalReviewed: 0 };
        const entries = Object.values(progress.wordProgress || {});
        let totalCorrect = 0;
        let totalWrong = 0;
        let reviewed = 0;

        entries.forEach((wp) => {
            if (wp.times_correct > 0 || wp.times_wrong > 0) {
                reviewed++;
                totalCorrect += wp.times_correct || 0;
                totalWrong += wp.times_wrong || 0;
            }
        });

        const total = totalCorrect + totalWrong;
        return {
            retentionRate: total > 0 ? Math.round((totalCorrect / total) * 100) : 0,
            totalReviewed: reviewed,
        };
    }, [progress]);

    // Streak
    const currentStreak = calculateCurrentStreak();

    // Last session stats
    const lastSessionStats = useMemo(() => {
        try {
            const raw = localStorage.getItem(LAST_SESSION_KEY);
            return raw ? JSON.parse(raw) : null;
        } catch { return null; }
    }, []);

    // Next review date (for empty state)
    const nextReviewDate = useMemo(() => {
        if (!progress) return null;
        const entries = Object.values(progress.wordProgress || {});
        const now = getNow();
        let earliest = null;

        entries.forEach((wp) => {
            if (!wp.due_date || wp.card_state === 'new') return;
            const due = new Date(wp.due_date);
            if (due > now && (!earliest || due < earliest)) earliest = due;
        });

        return earliest;
    }, [progress]);

    return {
        isLoading,
        dueNow,
        dueToday: dueNow,
        overdueCount,
        forecast,
        retentionRate,
        totalReviewed,
        currentStreak,
        dueWords,
        hasWordsToReview: dueNow > 0,
        lastSessionStats,
        nextReviewDate,
        refreshData,
    };
}
