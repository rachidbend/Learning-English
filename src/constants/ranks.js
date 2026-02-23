/**
 * ranks.js — Rank thresholds based on total mastered words
 *
 * Reused by Bank & Stats tab (Phase 5) and Account tab (Phase 6).
 */

export const RANKS = [
    { name: 'Oxford Novice', min: 0 },
    { name: 'Oxford Apprentice', min: 50 },
    { name: 'Novice Architect', min: 150 },
    { name: 'Word Builder', min: 300 },
    { name: 'Language Craftsman', min: 500 },
    { name: 'Oxford Scholar', min: 800 },
    { name: 'Master Linguist', min: 1200 },
    { name: 'Oxford Master', min: 2000 },
    { name: 'Language Legend', min: 3000 },
];

/**
 * Get the current rank and next rank for a given mastered count.
 */
export function getRankInfo(totalMastered) {
    let current = RANKS[0];
    let next = RANKS[1] || null;

    for (let i = RANKS.length - 1; i >= 0; i--) {
        if (totalMastered >= RANKS[i].min) {
            current = RANKS[i];
            next = RANKS[i + 1] || null;
            break;
        }
    }

    return {
        currentRank: current.name,
        nextRank: next ? next.name : null,
        wordsToNextRank: next ? next.min - totalMastered : 0,
    };
}
