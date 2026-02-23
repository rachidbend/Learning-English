/**
 * sessionPosition.js — Persists user's last session position
 *
 * Saves which level and batch the user last studied so the app
 * can resume from that position on next visit.
 *
 * localStorage key: 'last_session_position'
 */

const POSITION_KEY = 'last_session_position';

export function saveSessionPosition(levelId, batchId) {
    try {
        const data = {
            levelId,
            batchId,
            lastStudiedDate: new Date().toISOString(),
        };
        localStorage.setItem(POSITION_KEY, JSON.stringify(data));
    } catch (e) {
        console.warn('[sessionPosition] Save failed:', e);
    }
}

export function loadSessionPosition() {
    try {
        const raw = localStorage.getItem(POSITION_KEY);
        return raw ? JSON.parse(raw) : null;
    } catch (e) {
        console.warn('[sessionPosition] Load failed:', e);
        return null;
    }
}

export function clearSessionPosition() {
    try {
        localStorage.removeItem(POSITION_KEY);
    } catch (e) {
        console.warn('[sessionPosition] Clear failed:', e);
    }
}
