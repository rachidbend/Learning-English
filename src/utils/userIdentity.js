/**
 * userIdentity.js — Anonymous UID generation and persistence
 *
 * Uses crypto.randomUUID() — no external dependency needed.
 * Generates a UID on first visit, persists in localStorage.
 * Returns the same UID on every subsequent call.
 */

const UID_KEY = 'app_uid';

export function getOrCreateUID() {
    let uid = localStorage.getItem(UID_KEY);

    if (!uid) {
        uid = crypto.randomUUID();
        localStorage.setItem(UID_KEY, uid);
    }

    return uid;
}
