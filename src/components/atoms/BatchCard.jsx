/**
 * BatchCard.jsx — Individual batch card with mini-grid of word progress dots
 *
 * Shows batch name, status badge, and a dot per word colored by state.
 */

import React from 'react';

export default function BatchCard({ batch, isCurrent, words, progress, onClick }) {
    const { title, status, unlocked, total, mastered, learning, batch_id } = batch;

    // Build dot states from actual word data
    const dots = (words || []).map((w) => {
        const wp = progress?.wordProgress?.[String(w.id)];
        if (!wp || wp.card_state === 'new') return 'new';
        if ((wp.confidence || 0) >= 90) return 'mastered';
        return 'learning';
    });

    const DOT_COLORS = {
        mastered: 'var(--color-accent-primary)',
        learning: 'var(--color-accent-blue)',
        new: 'transparent',
    };

    const statusConfig = {
        complete: { label: 'Complete', color: 'var(--color-accent-primary)' },
        in_progress: { label: 'In Progress', color: 'var(--color-accent-blue)' },
        start: { label: 'Start', color: 'var(--color-accent-gold)' },
        locked: { label: 'Locked', color: 'var(--color-text-muted)' },
        unavailable: { label: 'Coming Soon', color: 'var(--color-text-muted)' },
    };

    const cfg = statusConfig[status] || statusConfig.locked;
    const isLocked = status === 'locked' || status === 'unavailable';

    return (
        <button
            onClick={isLocked ? undefined : onClick}
            disabled={isLocked}
            style={{
                backgroundColor: 'var(--color-bg-secondary)',
                borderRadius: 'var(--radius-lg)',
                padding: '16px',
                border: isCurrent ? '1.5px solid var(--color-accent-blue)' : '1px solid var(--color-border-subtle)',
                cursor: isLocked ? 'default' : 'pointer',
                opacity: isLocked ? 0.5 : 1,
                width: '100%',
                textAlign: 'left',
                position: 'relative',
                transition: 'border-color 0.2s ease',
            }}
        >
            {/* Lock overlay */}
            {isLocked && (
                <div style={{ position: 'absolute', top: '12px', right: '12px' }}>
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-muted)" strokeWidth="2" strokeLinecap="round">
                        <rect x="3" y="11" width="18" height="11" rx="2" ry="2" />
                        <path d="M7 11V7a5 5 0 0 1 10 0v4" />
                    </svg>
                </div>
            )}

            {/* Title */}
            <p style={{ fontSize: 'var(--text-sm)', fontWeight: 600, color: 'var(--color-text-primary)', margin: 0, paddingRight: '20px' }}>
                {title?.replace(/^Batch \d+: /, '') || `Batch ${batch_id}`}
            </p>

            {/* Status badge */}
            <span
                style={{
                    display: 'inline-block',
                    fontSize: '0.625rem',
                    fontWeight: 600,
                    color: cfg.color,
                    marginTop: '4px',
                    textTransform: 'uppercase',
                    letterSpacing: '0.5px',
                }}
            >
                {cfg.label}
            </span>

            {/* Mini dot grid */}
            {dots.length > 0 && !isLocked && (
                <div style={{ display: 'flex', flexWrap: 'wrap', gap: '4px', marginTop: '10px' }}>
                    {dots.map((state, i) => (
                        <div
                            key={i}
                            style={{
                                width: '8px',
                                height: '8px',
                                borderRadius: '4px',
                                backgroundColor: DOT_COLORS[state],
                                border: state === 'new' ? '1px solid var(--color-border-subtle)' : 'none',
                            }}
                        />
                    ))}
                </div>
            )}

            {/* Unlock hint for locked batches */}
            {status === 'locked' && (
                <p style={{ fontSize: '0.625rem', color: 'var(--color-text-muted)', margin: '8px 0 0', lineHeight: 1.3 }}>
                    Complete 80% of Batch {batch_id - 1} to unlock
                </p>
            )}
        </button>
    );
}
