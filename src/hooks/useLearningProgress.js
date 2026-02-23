/**
 * useLearningProgress.js — Central data hook for the Learn tab
 *
 * Derives all display data from vocabulary_data.json + user progress.
 * Handles batch progress computation, unlock logic, and session word selection.
 */

import { useState, useEffect, useCallback, useMemo } from 'react';
import { loadProgress, getDueWords, getWordProgress } from '../data/progressManager';
import { loadBatch, getAllBatchesMetadata } from '../data/wordData';
import { loadSessionPosition, saveSessionPosition } from '../utils/sessionPosition';

const MASTERY_CONFIDENCE = 90; // Word is mastered at >= 90% confidence
const UNLOCK_THRESHOLD = 0.8; // 80% mastered to unlock next batch

export function useLearningProgress() {
    const [progress, setProgress] = useState(null);
    const [allWords, setAllWords] = useState([]);
    const [isLoading, setIsLoading] = useState(true);

    // Load data on mount
    useEffect(() => {
        const init = async () => {
            try {
                const prog = loadProgress();
                setProgress(prog);

                const data = await loadBatch(1);
                if (data?.words) {
                    setAllWords(data.words);
                }
            } catch (err) {
                console.error('[useLearningProgress] Init failed:', err);
            } finally {
                setIsLoading(false);
            }
        };
        init();
    }, []);

    // Reload progress (e.g. after session completes)
    const refreshProgress = useCallback(() => {
        setProgress(loadProgress());
    }, []);

    // Group words by batch_id
    const wordsByBatch = useMemo(() => {
        const map = {};
        allWords.forEach((w) => {
            if (!map[w.batch_id]) map[w.batch_id] = [];
            map[w.batch_id].push(w);
        });
        return map;
    }, [allWords]);

    // Compute progress for a single batch
    const getBatchProgress = useCallback(
        (batchId) => {
            const words = wordsByBatch[batchId] || [];
            const total = words.length;
            if (total === 0) return { total: 0, mastered: 0, learning: 0, new: total, percent: 0 };

            let mastered = 0;
            let learning = 0;
            let newCount = 0;

            words.forEach((w) => {
                const wp = progress?.wordProgress?.[String(w.id)];
                if (!wp || wp.card_state === 'new') {
                    newCount++;
                } else if ((wp.confidence || 0) >= MASTERY_CONFIDENCE) {
                    mastered++;
                } else {
                    learning++;
                }
            });

            return {
                total,
                mastered,
                learning,
                new: newCount,
                percent: total > 0 ? Math.round((mastered / total) * 100) : 0,
            };
        },
        [wordsByBatch, progress]
    );

    // All batches metadata with computed progress
    const batches = useMemo(() => {
        const meta = getAllBatchesMetadata();
        return meta.map((b, i) => {
            const prog = getBatchProgress(b.batch_id);
            const hasWords = (wordsByBatch[b.batch_id] || []).length > 0;

            // Unlock logic: Batch 1 always unlocked.
            // Batch N unlocked when Batch N-1 has >= 80% mastered.
            // TODO: Also require a batch completion test to unlock next batch.
            let unlocked = false;
            if (b.batch_id === 1) {
                unlocked = true;
            } else {
                const prevProg = getBatchProgress(b.batch_id - 1);
                unlocked = prevProg.total > 0 && prevProg.percent >= UNLOCK_THRESHOLD * 100;
            }

            return {
                ...b,
                ...prog,
                hasWords,
                unlocked,
                status: !hasWords
                    ? 'unavailable'
                    : !unlocked
                        ? 'locked'
                        : prog.mastered === prog.total && prog.total > 0
                            ? 'complete'
                            : prog.learning > 0 || prog.mastered > 0
                                ? 'in_progress'
                                : 'start',
            };
        });
    }, [getBatchProgress, wordsByBatch]);

    // Current batch: first batch that is not complete
    const currentBatch = useMemo(() => {
        const saved = loadSessionPosition();
        if (saved) {
            const found = batches.find((b) => b.batch_id === saved.batchId && b.unlocked);
            if (found && found.status !== 'complete') return found;
        }
        return batches.find((b) => b.unlocked && b.status !== 'complete' && b.hasWords) || batches[0];
    }, [batches]);

    const currentLevel = currentBatch?.level_id || 'beginner_1';

    // Due words count
    const dueWordsCount = useMemo(() => {
        if (!progress) return 0;
        return getDueWords(progress).length;
    }, [progress]);

    // Words for the hero word cloud (8-10 random from current batch)
    const wordsForCloud = useMemo(() => {
        const batchWords = wordsByBatch[currentBatch?.batch_id] || [];
        const shuffled = [...batchWords].sort(() => 0.5 - Math.random());
        return shuffled.slice(0, 10);
    }, [wordsByBatch, currentBatch]);

    // Get N new words from a batch for a session
    const getSessionWords = useCallback(
        (batchId, count) => {
            const words = wordsByBatch[batchId] || [];
            return words
                .filter((w) => {
                    const wp = progress?.wordProgress?.[String(w.id)];
                    return !wp || wp.card_state === 'new';
                })
                .slice(0, count);
        },
        [wordsByBatch, progress]
    );

    // Levels with completion
    const levels = useMemo(() => {
        const levelMap = {};
        allWords.forEach((w) => {
            if (!levelMap[w.level_id]) {
                levelMap[w.level_id] = { id: w.level_id, cefr: w.cefr_level, words: [] };
            }
            levelMap[w.level_id].words.push(w);
        });

        return Object.values(levelMap).map((lvl) => {
            const mastered = lvl.words.filter((w) => {
                const wp = progress?.wordProgress?.[String(w.id)];
                return wp && (wp.confidence || 0) >= MASTERY_CONFIDENCE;
            }).length;
            return { ...lvl, total: lvl.words.length, mastered, percent: Math.round((mastered / lvl.words.length) * 100) };
        });
    }, [allWords, progress]);

    return {
        isLoading,
        currentLevel,
        currentBatch,
        batches,
        levels,
        dueWordsCount,
        wordsForCloud,
        allWords,
        getBatchProgress,
        getSessionWords,
        refreshProgress,
        saveSessionPosition,
    };
}
