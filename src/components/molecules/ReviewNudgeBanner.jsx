/**
 * ReviewNudgeBanner.jsx — Conditional review reminder banner
 *
 * Appears when user has due words. Slides in on mount.
 * Tapping switches to Review tab.
 */

import React from 'react';
import { motion } from 'framer-motion';
import { duration, easing, prefersReducedMotion } from '../../styles/motion';

export default function ReviewNudgeBanner({ dueCount, onReviewTap }) {
    if (!dueCount || dueCount <= 0) return null;

    const reduced = prefersReducedMotion();

    return (
        <motion.button
            onClick={onReviewTap}
            initial={reduced ? { opacity: 1 } : { opacity: 0, y: -12 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: reduced ? 0 : duration.normal, ease: easing.decelerate }}
            style={{
                display: 'flex',
                alignItems: 'center',
                gap: '12px',
                width: '100%',
                padding: '14px 16px',
                backgroundColor: 'var(--color-accent-blue-dim)',
                borderLeft: '3px solid var(--color-accent-blue)',
                borderRadius: 'var(--radius-md)',
                border: 'none',
                cursor: 'pointer',
                textAlign: 'left',
            }}
        >
            {/* Clock icon */}
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="var(--color-accent-blue)" strokeWidth="2" strokeLinecap="round">
                <circle cx="12" cy="12" r="10" />
                <polyline points="12 6 12 12 16 14" />
            </svg>

            <div style={{ flex: 1 }}>
                <p style={{ fontSize: 'var(--text-sm)', fontWeight: 600, color: 'var(--color-text-primary)', margin: 0 }}>
                    You have {dueCount} {dueCount === 1 ? 'word' : 'words'} due for review
                </p>
                <p style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)', margin: '2px 0 0' }}>
                    Keep your memory sharp — review now
                </p>
            </div>

            {/* Chevron */}
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-muted)" strokeWidth="2" strokeLinecap="round">
                <polyline points="9 18 15 12 9 6" />
            </svg>
        </motion.button>
    );
}
