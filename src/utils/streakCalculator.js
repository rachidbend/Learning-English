/**
 * streakCalculator.js — Daily session streak utilities
 *
 * Reads streak data from the progress object's stats field.
 * The existing ReviewSession already updates current_streak_days
 * and longest_streak_days in progress.stats on session completion.
 *
 * This utility also manages a lightweight session_log in localStorage
 * for more accurate streak tracking across both learning and review sessions.
 */

const SESSION_LOG_KEY = 'session_log';

/**
 * Log a completed session for today.
 * Appends today's date (YYYY-MM-DD) to the session log if not already present.
 */
export function logSessionCompletion() {
    const today = getDateString(new Date());
    const log = loadSessionLog();

    if (!log.includes(today)) {
        log.push(today);
        // Keep only last 90 days to prevent unbounded growth
        const trimmed = log.slice(-90);
        try {
            localStorage.setItem(SESSION_LOG_KEY, JSON.stringify(trimmed));
        } catch (e) {
            console.warn('[streakCalculator] Save failed:', e);
        }
    }
}

/**
 * Calculate the current consecutive day streak.
 * Counts backward from today — streak breaks on any skipped day.
 * Today counts if a session was completed today.
 */
export function calculateCurrentStreak() {
    const log = loadSessionLog();
    if (log.length === 0) return 0;

    const dates = new Set(log);
    let streak = 0;
    const now = new Date();

    for (let i = 0; i < 365; i++) {
        const d = new Date(now);
        d.setDate(d.getDate() - i);
        const key = getDateString(d);

        if (dates.has(key)) {
            streak++;
        } else {
            break;
        }
    }

    return streak;
}

/**
 * Calculate the longest streak ever achieved.
 */
export function calculateLongestStreak() {
    const log = loadSessionLog();
    if (log.length === 0) return 0;

    const sorted = [...new Set(log)].sort();
    let longest = 1;
    let current = 1;

    for (let i = 1; i < sorted.length; i++) {
        const prev = new Date(sorted[i - 1]);
        const curr = new Date(sorted[i]);
        const diffDays = Math.round((curr - prev) / 86400000);

        if (diffDays === 1) {
            current++;
            longest = Math.max(longest, current);
        } else {
            current = 1;
        }
    }

    return longest;
}

function loadSessionLog() {
    try {
        const raw = localStorage.getItem(SESSION_LOG_KEY);
        return raw ? JSON.parse(raw) : [];
    } catch {
        return [];
    }
}

function getDateString(date) {
    return date.toISOString().split('T')[0];
}
