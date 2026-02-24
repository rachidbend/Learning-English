/**
 * SessionHeader.jsx — Dark-themed session header
 *
 * Shows Study/Quiz label, word counter, graduated count,
 * progress bar, and exit button.
 */

import React from 'react';

export default function SessionHeader({
    phase, currentWordIndex, totalWords, graduatedCount, onExit,
}) {
    const label = phase === 'quiz' ? 'Quiz' : 'Study';
    const progressPercent = totalWords > 0
        ? Math.round((graduatedCount / totalWords) * 100) : 0;

    return (
        <header style={{
            backgroundColor: 'var(--color-bg-secondary)',
            borderBottom: '1px solid var(--color-border-subtle)',
            position: 'sticky', top: 0, zIndex: 10,
            padding: '12px 16px',
        }}>
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
                <span style={{
                    fontSize: 'var(--text-base)', fontWeight: 'var(--font-weight-semibold)',
                    color: 'var(--color-text-primary)',
                }}>
                    {label}
                </span>

                <div style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                    <span style={{ fontSize: 'var(--text-sm)', color: 'var(--color-text-secondary)' }}>
                        Word {Math.min(currentWordIndex + 1, totalWords)} of {totalWords} · {graduatedCount} graduated
                    </span>
                    <button onClick={onExit} style={{
                        background: 'none', border: 'none', cursor: 'pointer',
                        color: 'var(--color-text-secondary)', padding: '4px',
                    }}>
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round">
                            <line x1="18" y1="6" x2="6" y2="18" /><line x1="6" y1="6" x2="18" y2="18" />
                        </svg>
                    </button>
                </div>
            </div>

            {/* Progress bar */}
            <div style={{
                height: '3px', backgroundColor: 'var(--color-border-subtle)',
                borderRadius: '2px', marginTop: '8px', overflow: 'hidden',
            }}>
                <div style={{
                    height: '100%', width: `${progressPercent}%`,
                    backgroundColor: 'var(--color-accent-primary)',
                    borderRadius: '2px', transition: 'width 0.5s ease',
                }} />
            </div>
        </header>
    );
}
