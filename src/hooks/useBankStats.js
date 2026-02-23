/**
 * useBankStats.js — Central hook for the Bank & Stats tab
 *
 * Derives all display data from progress + vocabulary:
 * - Hero stats (mastered, learning, seen, retention)
 * - Milestone progress toward 3,000-word goal
 * - Rank calculation from RANKS constants
 * - Streak from streakCalculator
 * - Weekly growth (words mastered per day, last 7 days)
 * - Word bank categorized lists for the modal
 */

import { useState, useEffect, useMemo } from 'react';
import { loadProgress, getNow } from '../data/progressManager';
import { loadBatch } from '../data/wordData';
import { calculateConfidence } from '../engine/confidenceCalculator';
import { calculateCurrentStreak, calculateLongestStreak } from '../utils/streakCalculator';
import { getRankInfo } from '../constants/ranks';

const MILESTONE_TARGET = 3000;

export function useBankStats() {
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
                console.error('[useBankStats] Init failed:', err);
            } finally {
                setIsLoading(false);
            }
        };
        init();
    }, []);

    // ── Categorize words by mastery ─────────────────────────────
    const { masteredWords, learningWords, newWords, totalMastered, totalLearning, totalSeen } = useMemo(() => {
        if (!progress || allWords.length === 0) {
            return { masteredWords: [], learningWords: [], newWords: allWords, totalMastered: 0, totalLearning: 0, totalSeen: 0 };
        }

        const mastered = [], learning = [], unseen = [];
        let seen = 0;

        allWords.forEach((word) => {
            const wp = progress.wordProgress?.[word.id];
            if (!wp || wp.card_state === 'new') {
                unseen.push(word);
                return;
            }
            seen++;
            const conf = calculateConfidence(wp);
            if (conf >= 90) {
                mastered.push({ ...word, _confidence: conf, _wp: wp });
            } else {
                learning.push({ ...word, _confidence: conf, _wp: wp });
            }
        });

        return {
            masteredWords: mastered, learningWords: learning, newWords: unseen,
            totalMastered: mastered.length, totalLearning: learning.length, totalSeen: seen,
        };
    }, [progress, allWords]);

    // ── Retention rate ──────────────────────────────────────────
    const retentionRate = useMemo(() => {
        if (!progress) return 0;
        const entries = Object.values(progress.wordProgress || {});
        let correct = 0, wrong = 0;
        entries.forEach((wp) => {
            correct += wp.times_correct || 0;
            wrong += wp.times_wrong || 0;
        });
        const total = correct + wrong;
        return total > 0 ? Math.round((correct / total) * 100) : 0;
    }, [progress]);

    // ── Milestone ───────────────────────────────────────────────
    const milestonePercent = Math.min(100, Math.round((totalMastered / MILESTONE_TARGET) * 100));
    const { currentRank, nextRank, wordsToNextRank } = getRankInfo(totalMastered);

    // ── Streaks ─────────────────────────────────────────────────
    const currentStreak = calculateCurrentStreak();
    const longestStreak = calculateLongestStreak();

    // ── Weekly growth ───────────────────────────────────────────
    const weeklyGrowth = useMemo(() => {
        const now = getNow();
        const dayLabels = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
        const days = [];

        for (let i = 6; i >= 0; i--) {
            const d = new Date(now);
            d.setDate(d.getDate() - i);
            const dayStr = d.toISOString().split('T')[0];
            const dayStart = new Date(dayStr + 'T00:00:00');
            const dayEnd = new Date(dayStr + 'T23:59:59');

            let count = 0;
            if (progress) {
                Object.values(progress.wordProgress || {}).forEach((wp) => {
                    if (!wp.last_review_date) return;
                    const rev = new Date(wp.last_review_date);
                    if (rev >= dayStart && rev <= dayEnd) {
                        const conf = calculateConfidence(wp);
                        if (conf >= 90) count++;
                    }
                });
            }

            days.push({
                label: i === 0 ? 'Today' : dayLabels[d.getDay()],
                wordsLearned: count,
                isToday: i === 0,
            });
        }
        return days;
    }, [progress]);

    return {
        isLoading,
        totalMastered, totalLearning, totalSeen, retentionRate,
        milestoneTarget: MILESTONE_TARGET, milestonePercent,
        currentRank, nextRank, wordsToNextRank,
        currentStreak, longestStreak,
        weeklyGrowth,
        masteredWords, learningWords, newWords,
        allWords,
    };
}
