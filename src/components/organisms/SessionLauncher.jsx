/**
 * SessionLauncher.jsx — Primary action card for starting a learning session
 *
 * Shows current batch, progress bar, session size selector, and CTA button.
 */

import React, { useState } from 'react';

const SIZE_OPTIONS = [5, 10, 20];

export default function SessionLauncher({ currentBatch, batchProgress, onStartSession }) {
    const [selectedCount, setSelectedCount] = useState(10);

    const { total, mastered, learning, percent } = batchProgress || { total: 0, mastered: 0, learning: 0, percent: 0 };
    const learned = mastered + learning;
    const newAvailable = total - learned;
    const batchComplete = newAvailable <= 0 && total > 0;

    return (
        <div
            style={{
                backgroundColor: 'var(--color-bg-secondary)',
                borderRadius: 'var(--radius-xl)',
                padding: '24px',
            }}
        >
            {/* Batch info */}
            <div style={{ marginBottom: '16px' }}>
                <h2
                    style={{
                        fontSize: 'var(--text-lg)',
                        fontWeight: 'var(--font-weight-bold)',
                        color: 'var(--color-text-primary)',
                        margin: 0,
                    }}
                >
                    {currentBatch?.title || 'Batch 1'}
                </h2>
                <p style={{ fontSize: 'var(--text-sm)', color: 'var(--color-text-secondary)', margin: '4px 0 0' }}>
                    {learned} / {total} words learned in this batch
                </p>
            </div>

            {/* Progress bar */}
            <div style={{ marginBottom: '20px' }}>
                <div style={{ height: '6px', backgroundColor: 'var(--color-bg-tertiary)', borderRadius: 'var(--radius-full)', overflow: 'hidden' }}>
                    <div
                        style={{
                            height: '100%',
                            width: `${percent}%`,
                            background: 'linear-gradient(90deg, var(--color-accent-primary), var(--color-accent-blue))',
                            borderRadius: 'var(--radius-full)',
                            transition: 'width 0.5s ease',
                        }}
                    />
                </div>
                <p style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-muted)', textAlign: 'right', marginTop: '4px' }}>
                    {percent}% mastered
                </p>
            </div>

            {/* Session size selector */}
            {!batchComplete && (
                <div style={{ marginBottom: '16px' }}>
                    <p style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)', marginBottom: '8px', fontWeight: 500 }}>
                        Words per session
                    </p>
                    <div style={{ display: 'flex', gap: '8px' }}>
                        {SIZE_OPTIONS.map((n) => {
                            const isActive = selectedCount === n;
                            const cappedN = Math.min(n, newAvailable);
                            return (
                                <button
                                    key={n}
                                    onClick={() => setSelectedCount(n)}
                                    disabled={cappedN <= 0}
                                    style={{
                                        flex: 1,
                                        padding: '10px 0',
                                        borderRadius: 'var(--radius-full)',
                                        border: 'none',
                                        fontWeight: 600,
                                        fontSize: 'var(--text-sm)',
                                        cursor: cappedN <= 0 ? 'default' : 'pointer',
                                        opacity: cappedN <= 0 ? 0.4 : 1,
                                        backgroundColor: isActive ? 'var(--color-accent-primary)' : 'var(--color-bg-tertiary)',
                                        color: isActive ? 'var(--color-text-inverse)' : 'var(--color-text-secondary)',
                                        transition: 'all 0.2s ease',
                                    }}
                                >
                                    {n}
                                </button>
                            );
                        })}
                    </div>
                </div>
            )}

            {/* CTA Button */}
            <button
                onClick={() => onStartSession(Math.min(selectedCount, newAvailable))}
                disabled={total === 0}
                style={{
                    width: '100%',
                    padding: '16px',
                    borderRadius: 'var(--radius-lg)',
                    border: 'none',
                    fontWeight: 'var(--font-weight-bold)',
                    fontSize: 'var(--text-base)',
                    cursor: total === 0 ? 'default' : 'pointer',
                    background: batchComplete
                        ? 'linear-gradient(135deg, var(--color-accent-blue), var(--color-accent-primary))'
                        : 'linear-gradient(135deg, var(--color-accent-primary), #22c55e)',
                    color: 'var(--color-text-inverse)',
                    boxShadow: 'var(--shadow-glow-green)',
                    transition: 'transform 0.1s ease',
                }}
                onMouseDown={(e) => (e.currentTarget.style.transform = 'scale(0.97)')}
                onMouseUp={(e) => (e.currentTarget.style.transform = 'scale(1)')}
                onMouseLeave={(e) => (e.currentTarget.style.transform = 'scale(1)')}
            >
                {batchComplete ? 'Batch Complete — Start Next Batch' : 'Continue Learning'}
            </button>
        </div>
    );
}
