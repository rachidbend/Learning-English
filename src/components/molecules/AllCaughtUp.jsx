/**
 * AllCaughtUp.jsx — Empty state when no words are due for review
 *
 * Shows sleeping books SVG and next review time.
 */

import React from 'react';

export default function AllCaughtUp({ nextReviewDate }) {
    const timeText = getNextReviewText(nextReviewDate);

    return (
        <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', padding: '32px 16px', textAlign: 'center' }}>
            {/* Sleeping books SVG */}
            <svg width="80" height="80" viewBox="0 0 80 80" fill="none" xmlns="http://www.w3.org/2000/svg">
                <rect x="10" y="30" width="36" height="28" rx="3" stroke="var(--color-text-muted)" strokeWidth="2" fill="var(--color-bg-tertiary)" />
                <rect x="14" y="34" width="28" height="2" rx="1" fill="var(--color-border-subtle)" />
                <rect x="14" y="40" width="22" height="2" rx="1" fill="var(--color-border-subtle)" />
                <rect x="14" y="46" width="16" height="2" rx="1" fill="var(--color-border-subtle)" />
                <rect x="34" y="22" width="36" height="28" rx="3" stroke="var(--color-text-muted)" strokeWidth="2" fill="var(--color-bg-secondary)" transform="rotate(8 52 36)" />
                {/* Zzz */}
                <text x="58" y="18" fontSize="14" fill="var(--color-accent-blue)" fontWeight="600" opacity="0.7">z</text>
                <text x="64" y="12" fontSize="10" fill="var(--color-accent-blue)" fontWeight="600" opacity="0.5">z</text>
                <text x="68" y="8" fontSize="8" fill="var(--color-accent-blue)" fontWeight="600" opacity="0.3">z</text>
            </svg>

            <h3 style={{ fontSize: 'var(--text-lg)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-text-primary)', margin: '16px 0 6px' }}>
                You're all caught up
            </h3>

            <p style={{ fontSize: 'var(--text-sm)', color: 'var(--color-text-secondary)', maxWidth: '280px', lineHeight: 1.5 }}>
                {timeText}
            </p>
        </div>
    );
}

function getNextReviewText(nextDate) {
    if (!nextDate) return 'Start learning words to begin your review journey';

    const now = new Date();
    const diff = nextDate.getTime() - now.getTime();
    const hours = Math.ceil(diff / (1000 * 60 * 60));
    const days = Math.ceil(diff / (1000 * 60 * 60 * 24));

    if (hours <= 0) return 'Check back soon';
    if (hours <= 1) return 'Next review in about 1 hour';
    if (hours < 24) return `Next review in ${hours} hours`;
    if (days === 1) return 'Next review tomorrow';
    return `Next review in ${days} days`;
}
