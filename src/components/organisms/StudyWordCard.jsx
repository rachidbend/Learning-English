/**
 * StudyWordCard.jsx — Redesigned dark-themed word study card
 *
 * Full layout: word + POS + audio, Arabic translation, divider,
 * toggle for translations/definitions, 2 example sentences,
 * expanded definitions, "I've got it →" CTA.
 */

import React, { useState, useCallback } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { prefersReducedMotion } from '../../styles/motion';

/** Parse {bracketed} text into JSX spans with highlight */
function renderHighlighted(text) {
    if (!text) return null;
    const parts = text.split(/\{|\}/);
    return parts.map((part, i) =>
        i % 2 === 1
            ? <span key={i} style={{ fontWeight: 'var(--font-weight-bold)', color: 'var(--color-accent-blue)' }}>{part}</span>
            : <span key={i}>{part}</span>
    );
}

export default function StudyWordCard({ word, onNext }) {
    const [showTranslations, setShowTranslations] = useState(false);
    const [showMore, setShowMore] = useState(false);
    const [audioPlaying, setAudioPlaying] = useState(false);
    const reduced = prefersReducedMotion();

    if (!word) return null;

    const allExamples = word.examples || [];
    const primary = allExamples.filter(e => e.is_primary);
    const firstTwo = primary.length >= 2 ? primary.slice(0, 2) : allExamples.slice(0, 2);
    const rest = allExamples.filter(e => !firstTwo.includes(e));

    const handleAudio = useCallback(() => {
        try {
            const src = word.pronunciation?.audio;
            if (!src) return;
            const a = new Audio(src);
            setAudioPlaying(true);
            a.play().catch(() => { });
            a.onended = () => setAudioPlaying(false);
            a.onerror = () => setAudioPlaying(false);
        } catch { /* silent */ }
    }, [word]);

    const fade = reduced
        ? { initial: { opacity: 0 }, animate: { opacity: 1 }, exit: { opacity: 0 }, transition: { duration: 0 } }
        : { initial: { opacity: 0, y: 8 }, animate: { opacity: 1, y: 0 }, exit: { opacity: 0, y: 8 }, transition: { duration: 0.2 } };

    return (
        <div style={{ padding: '20px 16px', minHeight: 'calc(100vh - 120px)', display: 'flex', flexDirection: 'column' }}>
            {/* Word + POS + Audio */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '10px', flexWrap: 'wrap' }}>
                <h1 style={{ fontSize: 'var(--text-3xl)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-text-primary)', margin: 0 }}>
                    {word.word}
                </h1>
                {word.pos && (
                    <span style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)', backgroundColor: 'var(--color-bg-tertiary)', padding: '2px 10px', borderRadius: 'var(--radius-full)' }}>
                        {word.pos}
                    </span>
                )}
                <button onClick={handleAudio} style={{
                    width: 40, height: 40, borderRadius: '50%', border: 'none', cursor: 'pointer',
                    backgroundColor: 'var(--color-bg-tertiary)', display: 'flex', alignItems: 'center', justifyContent: 'center',
                }}>
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke={audioPlaying ? 'var(--color-accent-blue)' : 'var(--color-text-secondary)'} strokeWidth="2" strokeLinecap="round">
                        <polygon points="11 5 6 9 2 9 2 15 6 15 11 19 11 5" fill={audioPlaying ? 'var(--color-accent-blue)' : 'var(--color-text-secondary)'} fillOpacity="0.3" />
                        <path d="M15.54 8.46a5 5 0 010 7.07" />
                    </svg>
                </button>
            </div>

            {/* Arabic word — always visible */}
            <p style={{ fontFamily: 'var(--font-arabic)', fontSize: 'var(--text-2xl)', color: 'var(--color-accent-gold)', direction: 'rtl', marginTop: '8px' }}>
                {word.word_ar}
            </p>

            <div style={{ height: 1, backgroundColor: 'var(--color-border-subtle)', margin: '16px 0' }} />

            {/* Toggle */}
            <div style={{ display: 'flex', justifyContent: 'flex-end', marginBottom: '12px' }}>
                <button onClick={() => setShowTranslations(!showTranslations)} style={{
                    display: 'flex', alignItems: 'center', gap: '6px', padding: '6px 14px',
                    borderRadius: 'var(--radius-full)', backgroundColor: 'var(--color-bg-tertiary)', cursor: 'pointer',
                    border: `1px solid ${showTranslations ? 'var(--color-accent-blue)' : 'var(--color-border-subtle)'}`,
                    color: showTranslations ? 'var(--color-accent-blue)' : 'var(--color-text-secondary)',
                    fontSize: 'var(--text-xs)', fontWeight: 500, transition: 'all 0.15s ease',
                }}>
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z" /><circle cx="12" cy="12" r="3" />
                    </svg>
                    {showTranslations ? 'Hide Translations' : 'Show Translations'}
                </button>
            </div>

            {/* Sentences card */}
            <div style={{ backgroundColor: 'var(--color-bg-secondary)', borderRadius: 'var(--radius-xl)', padding: '20px', border: '1px solid var(--color-border-subtle)' }}>
                {firstTwo.map((ex, i) => (
                    <div key={i} style={{ marginBottom: i < firstTwo.length - 1 ? '16px' : 0 }}>
                        <p style={{ color: 'var(--color-text-primary)', fontSize: 'var(--text-base)', lineHeight: 1.6 }}>
                            {renderHighlighted(ex.en)}
                        </p>
                        <AnimatePresence>
                            {showTranslations && ex.ar && (
                                <motion.p {...fade} style={{ fontFamily: 'var(--font-arabic)', color: 'var(--color-text-secondary)', fontSize: 'var(--text-sm)', direction: 'rtl', marginTop: '4px' }}>
                                    {ex.ar}
                                </motion.p>
                            )}
                        </AnimatePresence>
                    </div>
                ))}

                {/* Definitions (toggle ON) */}
                <AnimatePresence>
                    {showTranslations && (
                        <motion.div {...fade} style={{ marginTop: '16px', borderTop: '1px solid var(--color-border-subtle)', paddingTop: '16px' }}>
                            <p style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-muted)', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: '6px' }}>Definition</p>
                            {word.definition?.en && <p style={{ color: 'var(--color-text-secondary)', fontSize: 'var(--text-sm)', marginBottom: '4px' }}>{word.definition.en}</p>}
                            {word.definition?.ar && <p style={{ fontFamily: 'var(--font-arabic)', color: 'var(--color-text-secondary)', fontSize: 'var(--text-sm)', direction: 'rtl', marginBottom: '8px' }}>{word.definition.ar}</p>}
                            {word.usage_notes && <p style={{ color: 'var(--color-text-muted)', fontSize: 'var(--text-xs)', fontStyle: 'italic' }}>{word.usage_notes}</p>}

                            {rest.length > 0 && !showMore && (
                                <button onClick={() => setShowMore(true)} style={{ background: 'none', border: 'none', color: 'var(--color-accent-blue)', fontSize: 'var(--text-sm)', cursor: 'pointer', fontWeight: 500, marginTop: '12px' }}>
                                    More Examples ({rest.length})
                                </button>
                            )}
                            {showMore && rest.map((ex, i) => (
                                <div key={i} style={{ marginTop: '12px' }}>
                                    <p style={{ color: 'var(--color-text-primary)', fontSize: 'var(--text-base)', lineHeight: 1.6 }}>{renderHighlighted(ex.en)}</p>
                                    {ex.ar && <p style={{ fontFamily: 'var(--font-arabic)', color: 'var(--color-text-secondary)', fontSize: 'var(--text-sm)', direction: 'rtl', marginTop: '4px' }}>{ex.ar}</p>}
                                </div>
                            ))}
                        </motion.div>
                    )}
                </AnimatePresence>
            </div>

            {/* CTA */}
            <div style={{ flex: 1 }} />
            <button onClick={onNext} style={{
                width: '100%', padding: '16px', borderRadius: 'var(--radius-md)', border: 'none',
                fontWeight: 'var(--font-weight-bold)', fontSize: 'var(--text-base)', cursor: 'pointer',
                background: 'linear-gradient(135deg, var(--color-accent-primary), #22c55e)',
                color: 'var(--color-text-inverse)', marginTop: '20px',
            }}>
                I've got it →
            </button>
        </div>
    );
}
