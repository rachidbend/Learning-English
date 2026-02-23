/**
 * ReviewSummary.jsx — Post-session summary screen
 *
 * Shows score, percentage, performance message, and action buttons.
 */

import React from 'react';
import { motion } from 'framer-motion';
import { duration, easing, prefersReducedMotion } from '../../styles/motion';

const BANDS = [
    { min: 90, color: 'var(--color-accent-primary)', msg: 'Excellent retention. Your memory is strong.' },
    { min: 70, color: 'var(--color-accent-gold)', msg: 'Good session. Keep the consistency.' },
    { min: 50, color: 'var(--color-accent-gold)', msg: 'Some words need more work. You\'ll get there.' },
    { min: 0, color: 'var(--color-error)', msg: 'Tough session. Those words will come back soon.' },
];

export default function ReviewSummary({ results, onDone, onReviewMore, hasMoreDue }) {
    const { wordsReviewed = 0, correct = 0, wrong = 0 } = results || {};
    const total = correct + wrong;
    const percent = total > 0 ? Math.round((correct / total) * 100) : 0;
    const band = BANDS.find((b) => percent >= b.min) || BANDS[3];
    const reduced = prefersReducedMotion();

    return (
        <div style={{
            display: 'flex', flexDirection: 'column', alignItems: 'center',
            justifyContent: 'center', minHeight: '70vh', padding: '32px 24px',
            textAlign: 'center',
        }}>
            {/* Score Circle */}
            <motion.div
                initial={reduced ? {} : { scale: 0.8, opacity: 0 }}
                animate={{ scale: 1, opacity: 1 }}
                transition={reduced ? {} : { duration: duration.slow, ease: easing.decelerate }}
            >
                <div style={{
                    width: '120px', height: '120px', borderRadius: '50%',
                    border: `4px solid ${band.color}`, display: 'flex', flexDirection: 'column',
                    alignItems: 'center', justifyContent: 'center', margin: '0 auto',
                    boxShadow: percent >= 90 ? `0 0 30px ${band.color}40` : 'none',
                }}>
                    <span style={{ fontSize: 'var(--text-3xl)', fontWeight: 'var(--font-weight-bold)', color: band.color }}>
                        {percent}%
                    </span>
                </div>
            </motion.div>

            {/* Score Detail */}
            <p style={{
                fontSize: 'var(--text-lg)', fontWeight: 'var(--font-weight-semibold)',
                color: 'var(--color-text-primary)', marginTop: '20px',
            }}>
                {correct} / {total} Correct
            </p>

            {/* Message */}
            <p style={{
                fontSize: 'var(--text-sm)', color: 'var(--color-text-secondary)',
                marginTop: '8px', maxWidth: '300px', lineHeight: 1.5,
            }}>
                {band.msg}
            </p>

            {/* Buttons */}
            <div style={{ display: 'flex', flexDirection: 'column', gap: '12px', width: '100%', maxWidth: '300px', marginTop: '32px' }}>
                <button
                    onClick={onDone}
                    style={{
                        width: '100%', padding: '14px', borderRadius: 'var(--radius-lg)',
                        border: 'none', fontWeight: 'var(--font-weight-bold)', fontSize: 'var(--text-base)',
                        background: 'linear-gradient(135deg, var(--color-accent-primary), #22c55e)',
                        color: 'var(--color-text-inverse)', cursor: 'pointer',
                    }}
                >
                    Done
                </button>

                {hasMoreDue && (
                    <button
                        onClick={onReviewMore}
                        style={{
                            width: '100%', padding: '14px', borderRadius: 'var(--radius-lg)',
                            border: '1px solid var(--color-border-subtle)', fontWeight: 600,
                            fontSize: 'var(--text-sm)', backgroundColor: 'var(--color-bg-secondary)',
                            color: 'var(--color-text-primary)', cursor: 'pointer',
                        }}
                    >
                        Review More
                    </button>
                )}
            </div>
        </div>
    );
}
