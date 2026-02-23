/**
 * StoryReader.jsx — Immersive story reading experience
 *
 * Each word is individually tappable for definition lookup.
 * Scroll tracking enables the Take Quiz button at end of story.
 */

import React, { useState, useRef, useCallback, useEffect } from 'react';
import { tokenizeText } from '../../utils/textTokenizer';

export default function StoryReader({ story, onClose, onTakeQuiz, onWordTap, isRead }) {
    const [highlightedIdx, setHighlightedIdx] = useState(null); // "para-word" key
    const [reachedEnd, setReachedEnd] = useState(isRead || false);
    const [tooltip, setTooltip] = useState(null);
    const scrollRef = useRef(null);

    // Track scroll position to enable Take Quiz
    const handleScroll = useCallback(() => {
        const el = scrollRef.current;
        if (!el || reachedEnd) return;
        const threshold = el.scrollHeight - el.clientHeight - 40;
        if (el.scrollTop >= threshold) setReachedEnd(true);
    }, [reachedEnd]);

    useEffect(() => {
        const el = scrollRef.current;
        if (el) el.addEventListener('scroll', handleScroll, { passive: true });
        return () => el?.removeEventListener('scroll', handleScroll);
    }, [handleScroll]);

    // Check if content fits without scrolling (short stories)
    useEffect(() => {
        const el = scrollRef.current;
        if (el && el.scrollHeight <= el.clientHeight + 20) {
            setReachedEnd(true);
        }
    }, [story]);

    const handleWordTap = useCallback((cleanWord, key) => {
        setHighlightedIdx(key);
        setTooltip(null);

        const wordData = onWordTap(cleanWord);
        if (!wordData) {
            setTooltip('Word not in vocabulary yet');
            setTimeout(() => setTooltip(null), 2000);
        }
    }, [onWordTap]);

    if (!story) return null;

    return (
        <div style={{ display: 'flex', flexDirection: 'column', height: '100vh', backgroundColor: 'var(--color-bg-primary)' }}>
            {/* Header */}
            <header style={{
                display: 'flex', alignItems: 'center', justifyContent: 'space-between',
                padding: '16px 20px', borderBottom: '1px solid var(--color-border-subtle)',
            }}>
                <h2 style={{ fontSize: 'var(--text-base)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-text-primary)', margin: 0, flex: 1 }}>
                    {story.title}
                </h2>
                <button onClick={onClose} style={{ background: 'none', border: 'none', cursor: 'pointer', padding: '8px', color: 'var(--color-text-muted)' }}>
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round">
                        <line x1="18" y1="6" x2="6" y2="18" /><line x1="6" y1="6" x2="18" y2="18" />
                    </svg>
                </button>
            </header>

            {/* Reading area */}
            <div ref={scrollRef} style={{
                flex: 1, overflow: 'auto', padding: '24px 24px 100px',
                backgroundColor: 'var(--color-bg-secondary)', position: 'relative',
            }}>
                {story.content.map((para) => {
                    const tokens = tokenizeText(para.text);
                    return (
                        <p key={para.paragraph_id} style={{
                            fontSize: 'var(--text-lg)', lineHeight: 1.75, color: 'var(--color-text-primary)',
                            marginBottom: '16px', fontWeight: 400,
                        }}>
                            {tokens.map((tok, wi) => {
                                const key = `${para.paragraph_id}-${wi}`;
                                const isHighlighted = highlightedIdx === key;
                                return (
                                    <span key={key}>
                                        <span
                                            onClick={() => handleWordTap(tok.cleanWord, key)}
                                            style={{
                                                cursor: 'pointer', padding: '2px 1px', borderRadius: '3px',
                                                backgroundColor: isHighlighted ? 'var(--color-accent-blue-dim)' : 'transparent',
                                                transition: 'background-color 0.15s ease',
                                            }}
                                        >
                                            {tok.text}
                                        </span>
                                        {' '}
                                    </span>
                                );
                            })}
                        </p>
                    );
                })}

                {/* Tooltip for unknown words */}
                {tooltip && (
                    <div style={{
                        position: 'fixed', bottom: '100px', left: '50%', transform: 'translateX(-50%)',
                        backgroundColor: 'var(--color-bg-tertiary)', color: 'var(--color-text-secondary)',
                        padding: '8px 16px', borderRadius: 'var(--radius-full)', fontSize: 'var(--text-xs)',
                        fontWeight: 500, boxShadow: 'var(--shadow-md)', zIndex: 50,
                    }}>
                        {tooltip}
                    </div>
                )}
            </div>

            {/* Take Quiz footer */}
            <div style={{
                position: 'sticky', bottom: 0, padding: '16px 24px',
                backgroundColor: 'var(--color-bg-primary)', borderTop: '1px solid var(--color-border-subtle)',
            }}>
                <button
                    onClick={reachedEnd ? onTakeQuiz : undefined}
                    disabled={!reachedEnd}
                    style={{
                        width: '100%', padding: '16px', borderRadius: 'var(--radius-lg)',
                        border: 'none', fontWeight: 'var(--font-weight-bold)', fontSize: 'var(--text-base)',
                        background: reachedEnd
                            ? 'linear-gradient(135deg, var(--color-accent-primary), #22c55e)'
                            : 'var(--color-bg-tertiary)',
                        color: reachedEnd ? 'var(--color-text-inverse)' : 'var(--color-text-muted)',
                        cursor: reachedEnd ? 'pointer' : 'default',
                        transition: 'all 0.3s ease',
                    }}
                >
                    {reachedEnd ? 'Take Quiz' : 'Read to the end to unlock quiz'}
                </button>
            </div>
        </div>
    );
}
