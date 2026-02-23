/**
 * LearnHero.jsx — Hero section with floating word cloud and greeting
 *
 * Decorative word cloud with subtle drift animation.
 * Respects prefers-reduced-motion.
 */

import React from 'react';
import { motion } from 'framer-motion';
import { duration, easing, prefersReducedMotion } from '../../styles/motion';

const WORD_POSITIONS = [
    { x: '5%', y: '10%', delay: 0 },
    { x: '70%', y: '5%', delay: 0.3 },
    { x: '15%', y: '35%', delay: 0.6 },
    { x: '65%', y: '30%', delay: 0.2 },
    { x: '2%', y: '60%', delay: 0.5 },
    { x: '72%', y: '55%', delay: 0.4 },
    { x: '30%', y: '15%', delay: 0.1 },
    { x: '50%', y: '65%', delay: 0.7 },
    { x: '85%', y: '40%', delay: 0.3 },
    { x: '40%', y: '45%', delay: 0.8 },
];

export default function LearnHero({ currentBatch, wordsForCloud, totalMastered, totalWords }) {
    const reduced = prefersReducedMotion();

    return (
        <div
            style={{ background: 'var(--color-bg-secondary)', position: 'relative', overflow: 'hidden' }}
            className="rounded-b-[var(--radius-xl)] px-4 pt-8 pb-6"
        >
            {/* Word Cloud */}
            <div style={{ position: 'relative', height: '180px' }}>
                {wordsForCloud.slice(0, 10).map((word, i) => {
                    const pos = WORD_POSITIONS[i] || WORD_POSITIONS[0];
                    return (
                        <motion.span
                            key={word.id}
                            style={{
                                position: 'absolute',
                                left: pos.x,
                                top: pos.y,
                                fontSize: '0.75rem',
                                color: 'var(--color-text-muted)',
                                fontWeight: 500,
                                whiteSpace: 'nowrap',
                                opacity: 0.6,
                                pointerEvents: 'none',
                            }}
                            initial={reduced ? {} : { opacity: 0, y: 10 }}
                            animate={
                                reduced
                                    ? { opacity: 0.6 }
                                    : {
                                        opacity: [0.4, 0.7, 0.4],
                                        y: [0, -6, 0],
                                    }
                            }
                            transition={
                                reduced
                                    ? { duration: 0 }
                                    : {
                                        duration: 4 + i * 0.3,
                                        repeat: Infinity,
                                        delay: pos.delay,
                                        ease: 'easeInOut',
                                    }
                            }
                        >
                            {word.word} <span style={{ fontFamily: 'var(--font-arabic)' }}>/ {word.word_ar}</span>
                        </motion.span>
                    );
                })}

                {/* Open Book SVG */}
                <div style={{ position: 'absolute', left: '50%', top: '50%', transform: 'translate(-50%, -50%)' }}>
                    <svg width="56" height="56" viewBox="0 0 56 56" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M8 14C8 12 12 10 20 10C24 10 27 11 28 12C29 11 32 10 36 10C44 10 48 12 48 14V42C48 42 44 40 36 40C32 40 29 41 28 42C27 41 24 40 20 40C12 40 8 42 8 42V14Z" stroke="var(--color-accent-blue)" strokeWidth="2" fill="var(--color-accent-blue-dim)" fillOpacity="0.3" />
                        <line x1="28" y1="12" x2="28" y2="42" stroke="var(--color-accent-blue)" strokeWidth="1.5" strokeOpacity="0.5" />
                        <path d="M14 18H22M14 24H20M34 18H42M34 24H40" stroke="var(--color-text-muted)" strokeWidth="1" strokeLinecap="round" strokeOpacity="0.4" />
                    </svg>
                </div>
            </div>

            {/* Greeting */}
            <div style={{ textAlign: 'center', marginTop: '8px' }}>
                <h1
                    style={{
                        fontSize: 'var(--text-2xl)',
                        fontWeight: 'var(--font-weight-bold)',
                        color: 'var(--color-text-primary)',
                        margin: 0,
                    }}
                >
                    Ready to Learn?
                </h1>
                <p
                    style={{
                        fontSize: 'var(--text-sm)',
                        color: 'var(--color-text-secondary)',
                        marginTop: '4px',
                    }}
                >
                    {currentBatch?.title || 'Batch 1'} · {totalMastered} / {totalWords} Words Mastered
                </p>
            </div>
        </div>
    );
}
