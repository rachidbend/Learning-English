/**
 * useAccountData.js — Central hook for the Account tab
 *
 * Manages profile (display name), settings (theme, font size),
 * network status, data export, and progress reset.
 */

import { useState, useCallback } from 'react';
import { useTheme } from '../context/ThemeContext';
import { useNetworkStatus } from '../hooks/useNetworkStatus';
import { loadProgress, clearProgress } from '../data/progressManager';
import { calculateConfidence } from '../engine/confidenceCalculator';
import { getRankInfo } from '../constants/ranks';
import { analytics } from '../analytics/events';
import vocabularyData from '../data/vocabulary_data.json';

const NAME_KEY = 'user_display_name';
const FONT_KEY = 'app_font_size';

export function useAccountData() {
    // ── Profile ─────────────────────────────────────────────────
    const [displayName, setDisplayNameState] = useState(
        () => localStorage.getItem(NAME_KEY) || 'Learner'
    );

    const setDisplayName = useCallback((name) => {
        const trimmed = (name || '').trim() || 'Learner';
        setDisplayNameState(trimmed);
        localStorage.setItem(NAME_KEY, trimmed);
    }, []);

    // Mastery + rank
    const progress = loadProgress();
    let totalMastered = 0;
    let totalSeen = 0;
    Object.values(progress?.wordProgress || {}).forEach((wp) => {
        if (wp.card_state !== 'new') {
            totalSeen++;
            if (calculateConfidence(wp) >= 90) totalMastered++;
        }
    });
    const { currentRank, nextRank, wordsToNextRank } = getRankInfo(totalMastered);

    // ── Settings ────────────────────────────────────────────────
    const { theme, toggleTheme } = useTheme();
    const [fontSize, setFontSizeState] = useState(
        () => localStorage.getItem(FONT_KEY) || 'normal'
    );

    const setFontSize = useCallback((size) => {
        setFontSizeState(size);
        localStorage.setItem(FONT_KEY, size);
        if (size === 'large') {
            document.documentElement.classList.add('font-size-large');
        } else {
            document.documentElement.classList.remove('font-size-large');
        }
        analytics.track('settings_font_size_changed', { new_size: size });
    }, []);

    // Apply on mount
    if (fontSize === 'large') {
        document.documentElement.classList.add('font-size-large');
    }

    const handleToggleTheme = useCallback(() => {
        toggleTheme();
        analytics.track('settings_theme_toggled', { new_theme: theme === 'dark' ? 'light' : 'dark' });
    }, [toggleTheme, theme]);

    // ── Network ─────────────────────────────────────────────────
    const { isOnline } = useNetworkStatus();
    const lastSyncDate = localStorage.getItem('last_sync_date') || null;

    // ── Actions ─────────────────────────────────────────────────
    const handleExportData = useCallback(() => {
        const exportData = {
            exported_at: new Date().toISOString(),
            progress: loadProgress(),
            session_log: JSON.parse(localStorage.getItem('session_log') || '[]'),
            stories_progress: JSON.parse(localStorage.getItem('stories_progress') || '{}'),
        };
        // Strip UID
        if (exportData.progress?.uid) delete exportData.progress.uid;

        const blob = new Blob([JSON.stringify(exportData, null, 2)], { type: 'application/json' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = `vocabulary-progress-${new Date().toISOString().split('T')[0]}.json`;
        a.click();
        URL.revokeObjectURL(url);
        analytics.track('data_exported', { total_words: totalSeen });
    }, [totalSeen]);

    const handleResetProgress = useCallback(() => {
        clearProgress();
        localStorage.removeItem('session_log');
        localStorage.removeItem('stories_progress');
        localStorage.removeItem('last_session_position');
        localStorage.removeItem('last_review_session');
        analytics.track('progress_reset', {});
        window.location.reload();
    }, []);

    return {
        displayName, setDisplayName,
        currentRank, nextRank, wordsToNextRank, totalMastered,
        theme, toggleTheme: handleToggleTheme,
        fontSize, setFontSize,
        isOnline, lastSyncDate,
        totalWordsEncountered: totalSeen,
        handleExportData, handleResetProgress,
    };
}
