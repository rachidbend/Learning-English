/**
 * BatchGrid.jsx — Level header + 2-column grid of batch cards
 *
 * Shows all batches within the current level with progress.
 */

import React from 'react';
import BatchCard from '../atoms/BatchCard';

export default function BatchGrid({ batches, currentBatchId, onBatchSelect, allWords, progress }) {
    // Level info from the current batch
    const currentLevel = batches.find((b) => b.batch_id === currentBatchId);
    const levelBatches = batches.filter((b) => b.hasWords || b.batch_id <= (currentBatchId || 1) + 2);

    // Level completion
    const totalMastered = levelBatches.reduce((s, b) => s + b.mastered, 0);
    const totalWords = levelBatches.reduce((s, b) => s + b.total, 0);
    const levelPercent = totalWords > 0 ? Math.round((totalMastered / totalWords) * 100) : 0;

    // Group words by batch_id for the cards
    const wordsByBatch = {};
    allWords.forEach((w) => {
        if (!wordsByBatch[w.batch_id]) wordsByBatch[w.batch_id] = [];
        wordsByBatch[w.batch_id].push(w);
    });

    return (
        <div>
            {/* Level header */}
            <div style={{ marginBottom: '16px' }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline' }}>
                    <h3 style={{ fontSize: 'var(--text-base)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-text-primary)', margin: 0 }}>
                        {currentLevel?.level_id ? `Level: ${formatLevelName(currentLevel.level_id)}` : 'Your Batches'}
                    </h3>
                    <span style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)' }}>
                        {levelPercent}% Complete
                    </span>
                </div>
                <div style={{ height: '4px', backgroundColor: 'var(--color-bg-tertiary)', borderRadius: 'var(--radius-full)', marginTop: '8px', overflow: 'hidden' }}>
                    <div
                        style={{
                            height: '100%',
                            width: `${levelPercent}%`,
                            background: 'linear-gradient(90deg, var(--color-accent-primary), var(--color-accent-blue))',
                            borderRadius: 'var(--radius-full)',
                            transition: 'width 0.5s ease',
                        }}
                    />
                </div>
            </div>

            {/* 2-column grid */}
            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '12px' }}>
                {levelBatches.map((batch) => (
                    <BatchCard
                        key={batch.batch_id}
                        batch={batch}
                        isCurrent={batch.batch_id === currentBatchId}
                        words={wordsByBatch[batch.batch_id] || []}
                        progress={progress}
                        onClick={() => onBatchSelect(batch.batch_id)}
                    />
                ))}
            </div>
        </div>
    );
}

function formatLevelName(levelId) {
    if (!levelId) return '';
    return levelId
        .split('_')
        .map((s) => s.charAt(0).toUpperCase() + s.slice(1))
        .join(' ');
}
