/**
 * QuizCard.jsx — Unified dark-themed quiz card
 *
 * Question type pill, question text, letter badges,
 * correct/wrong states, feedback message.
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
    const isArabicQuestion = question.questionLanguage === 'ar' || question.type?.includes('ar_to_en');

    const handleSelect = useCallback((idx) => {
        if (answered) return;
        setSelected(idx);
        setAnswered(true);
        const isCorrect = idx === question.correct_index;
        setTimeout(() => onAnswer(isCorrect, idx), 1200);
    }, [answered, question, onAnswer]);

    const getOptionStyle = (idx) => {
        if (!answered) {
            return { bg: 'var(--color-bg-tertiary)', border: 'var(--color-border-subtle)', badgeBg: 'var(--color-bg-primary)', badgeColor: 'var(--color-text-secondary)' };
        }
        if (idx === question.correct_index) {
            return { bg: 'var(--color-accent-primary-dim)', border: 'var(--color-accent-primary)', badgeBg: 'var(--color-accent-primary-dim)', badgeColor: 'var(--color-accent-primary)' };
        }
        if (idx === selected && idx !== question.correct_index) {
            return { bg: 'var(--color-error-dim, rgba(239,68,68,0.15))', border: 'var(--color-error)', badgeBg: 'var(--color-error-dim, rgba(239,68,68,0.15))', badgeColor: 'var(--color-error)' };
        }
        return { bg: 'var(--color-bg-tertiary)', border: 'var(--color-border-subtle)', badgeBg: 'var(--color-bg-primary)', badgeColor: 'var(--color-text-muted)' };
    };

    const renderBadge = (idx) => {
        if (!answered) return LETTERS[idx];
        if (idx === question.correct_index) return '✓';
        if (idx === selected && idx !== question.correct_index) return '✕';
        return LETTERS[idx];
    };

    return (
        <div style={{ padding: '16px', paddingTop: '80px', paddingBottom: '100px' }}>
            {/* Unified quiz card */}
            <div style={{
                backgroundColor: 'var(--color-bg-secondary)',
                border: '1px solid var(--color-border-subtle)',
                borderRadius: 'var(--radius-xl)',
                padding: '24px',
            }}>
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
                    color: 'var(--color-text-primary)', margin: '0 0 20px', lineHeight: 1.4,
                    fontFamily: isArabicQuestion ? 'var(--font-arabic)' : 'inherit',
                    direction: isArabicQuestion ? 'rtl' : 'ltr',
                }}>
                    {question.question || question.question_text || `What is the translation of "${question.word}"?`}
                </h2>

                {/* Divider */}
                <div style={{ height: 1, backgroundColor: 'var(--color-border-subtle)', marginBottom: '20px' }} />

                {/* Options */}
                <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
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
                                    width: 28, height: 28, borderRadius: '50%', flexShrink: 0,
                                    backgroundColor: s.badgeBg, display: 'flex', alignItems: 'center', justifyContent: 'center',
                                    fontSize: 'var(--text-sm)', fontWeight: 'var(--font-weight-bold)', color: s.badgeColor,
                                    transition: 'all 0.2s ease',
                                }}>
                                    {renderBadge(idx)}
                                </div>
                                <span style={{
                                    fontSize: 'var(--text-base)', color: 'var(--color-text-primary)',
                                    fontFamily: /[\u0600-\u06FF]/.test(option) ? 'var(--font-arabic)' : 'inherit',
                                    direction: /[\u0600-\u06FF]/.test(option) ? 'rtl' : 'ltr',
                                    textAlign: /[\u0600-\u06FF]/.test(option) ? 'right' : 'left',
                                    flex: 1,
                                }}>
                                    {option}
                                </span>
                            </button>
                        );
                    })}
                </div>

                {/* Feedback */}
                <AnimatePresence mode="wait">
                    {!answered ? (
                        <motion.p key="hint"
                            initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
                            transition={{ duration: reduced ? 0 : 0.2 }}
                            style={{ textAlign: 'center', color: 'var(--color-text-muted)', fontSize: 'var(--text-sm)', marginTop: '20px', marginBottom: 0 }}
                        >
                            Select an answer to continue
                        </motion.p>
                    ) : (
                        <motion.div key="result"
                            initial={reduced ? { opacity: 0 } : { opacity: 0, y: 8 }}
                            animate={{ opacity: 1, y: 0 }}
                            transition={{ duration: reduced ? 0 : 0.2 }}
                            style={{
                                textAlign: 'center', marginTop: '20px', fontSize: 'var(--text-sm)', fontWeight: 600,
                                color: selected === question.correct_index ? 'var(--color-accent-primary)' : 'var(--color-error)',
                            }}
                        >
                            {selected === question.correct_index ? '✓ Correct!' : '✕ Incorrect'}
                        </motion.div>
                    )}
                </AnimatePresence>
            </div>
        </div>
    );
}
