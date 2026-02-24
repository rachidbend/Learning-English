/**
 * QuizCard.jsx — Redesigned dark-themed quiz screen
 *
 * Question type pill, letter badges, correct/wrong states,
 * "Next Word →" CTA after answering.
 */

import React, { useState, useCallback } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { QUESTION_TYPE_METADATA } from '../../utils/questionTypes';
import { prefersReducedMotion } from '../../styles/motion';

const LETTERS = ['A', 'B', 'C', 'D'];

export default function QuizCard({ question, onAnswer }) {
    const [selected, setSelected] = useState(null);
    const [answered, setAnswered] = useState(false);
    const reduced = prefersReducedMotion();

    if (!question) return null;

    const meta = QUESTION_TYPE_METADATA[question.type] || {};
    const isArabicOptions = question.type?.includes('ar') || question.type?.includes('arabic');

    const handleSelect = useCallback((idx) => {
        if (answered) return;
        setSelected(idx);
        setAnswered(true);
        const isCorrect = idx === question.correct_index;
        // Delay to show feedback before advancing
        setTimeout(() => onAnswer(isCorrect, idx), 1200);
    }, [answered, question, onAnswer]);

    const getOptionStyle = (idx) => {
        if (!answered) {
            return {
                bg: 'var(--color-bg-secondary)', border: 'var(--color-border-subtle)',
                badgeBg: 'var(--color-bg-tertiary)', badgeColor: 'var(--color-text-secondary)',
            };
        }
        const isCorrect = idx === question.correct_index;
        const isSelected = idx === selected;
        if (isCorrect) {
            return {
                bg: 'var(--color-accent-primary-dim)', border: 'var(--color-accent-primary)',
                badgeBg: 'var(--color-accent-primary-dim)', badgeColor: 'var(--color-accent-primary)',
            };
        }
        if (isSelected && !isCorrect) {
            return {
                bg: 'var(--color-error-dim, rgba(239,68,68,0.15))', border: 'var(--color-error)',
                badgeBg: 'var(--color-error-dim, rgba(239,68,68,0.15))', badgeColor: 'var(--color-error)',
            };
        }
        return {
            bg: 'var(--color-bg-secondary)', border: 'var(--color-border-subtle)',
            badgeBg: 'var(--color-bg-tertiary)', badgeColor: 'var(--color-text-muted)',
        };
    };

    const renderBadge = (idx, style) => {
        if (!answered) return LETTERS[idx];
        if (idx === question.correct_index) return '✓';
        if (idx === selected && idx !== question.correct_index) return '✕';
        return LETTERS[idx];
    };

    return (
        <div style={{ padding: '20px 16px', minHeight: 'calc(100vh - 120px)', display: 'flex', flexDirection: 'column' }}>
            {/* Question type pill */}
            <div style={{ marginBottom: '16px' }}>
                <span style={{
                    display: 'inline-block', fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)',
                    backgroundColor: 'var(--color-bg-tertiary)', padding: '4px 12px', borderRadius: 'var(--radius-full)',
                }}>
                    {meta.label || question.type}
                </span>
            </div>

            {/* Question text */}
            <h2 style={{
                fontSize: 'var(--text-xl)', fontWeight: 'var(--font-weight-semibold)',
                color: 'var(--color-text-primary)', margin: '0 0 8px', lineHeight: 1.4,
                fontFamily: question.type?.includes('ar_to_en') ? 'var(--font-arabic)' : 'inherit',
                direction: question.type?.includes('ar_to_en') ? 'rtl' : 'ltr',
            }}>
                {question.question_text}
            </h2>

            {/* Context hint */}
            {question.context && (
                <p style={{ fontSize: 'var(--text-sm)', color: 'var(--color-text-muted)', fontStyle: 'italic', marginBottom: '20px' }}>
                    {question.context}
                </p>
            )}

            {/* Options */}
            <div style={{ display: 'flex', flexDirection: 'column', gap: '10px', marginTop: '8px' }}>
                {(question.options || []).map((option, idx) => {
                    const s = getOptionStyle(idx);
                    return (
                        <button key={idx} onClick={() => handleSelect(idx)} disabled={answered}
                            style={{
                                display: 'flex', alignItems: 'center', gap: '12px', width: '100%',
                                padding: '16px', borderRadius: 'var(--radius-lg)', cursor: answered ? 'default' : 'pointer',
                                backgroundColor: s.bg, border: `1px solid ${s.border}`, textAlign: 'left',
                                transition: 'all 0.2s ease', opacity: answered && idx !== selected && idx !== question.correct_index ? 0.5 : 1,
                            }}
                        >
                            <div style={{
                                width: '28px', height: '28px', borderRadius: '50%', flexShrink: 0,
                                backgroundColor: s.badgeBg, display: 'flex', alignItems: 'center', justifyContent: 'center',
                                fontSize: 'var(--text-sm)', fontWeight: 'var(--font-weight-bold)', color: s.badgeColor,
                                transition: 'all 0.2s ease',
                            }}>
                                {renderBadge(idx, s)}
                            </div>
                            <span style={{
                                fontSize: 'var(--text-base)', color: 'var(--color-text-primary)',
                                fontFamily: isArabicOptions ? 'var(--font-arabic)' : 'inherit',
                                direction: isArabicOptions ? 'rtl' : 'ltr', flex: 1,
                            }}>
                                {option}
                            </span>
                        </button>
                    );
                })}
            </div>

            {/* Bottom hint / Next button */}
            <div style={{ flex: 1 }} />
            <AnimatePresence mode="wait">
                {!answered ? (
                    <motion.p key="hint"
                        initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
                        transition={{ duration: reduced ? 0 : 0.2 }}
                        style={{ textAlign: 'center', color: 'var(--color-text-muted)', fontSize: 'var(--text-sm)', padding: '16px 0' }}
                    >
                        Select an answer to continue
                    </motion.p>
                ) : (
                    <motion.div key="next"
                        initial={reduced ? { opacity: 0 } : { opacity: 0, y: 8 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ duration: reduced ? 0 : 0.2 }}
                        style={{ paddingTop: '16px' }}
                    >
                        <div style={{
                            textAlign: 'center', marginBottom: '12px',
                            fontSize: 'var(--text-sm)', fontWeight: 600,
                            color: selected === question.correct_index ? 'var(--color-accent-primary)' : 'var(--color-error)',
                        }}>
                            {selected === question.correct_index ? '✓ Correct!' : '✕ Incorrect'}
                        </div>
                    </motion.div>
                )}
            </AnimatePresence>
        </div>
    );
}
