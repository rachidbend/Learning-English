/**
 * StoryQuiz.jsx — Comprehension quiz for a story
 *
 * 4-question quiz with immediate feedback, explanations, and results.
 */

import React, { useState, useCallback } from 'react';
import { motion } from 'framer-motion';
import { prefersReducedMotion } from '../../styles/motion';

export default function StoryQuiz({ story, onComplete, onReadAgain }) {
    const [currentQ, setCurrentQ] = useState(0);
    const [selectedIdx, setSelectedIdx] = useState(null);
    const [score, setScore] = useState(0);
    const [showResults, setShowResults] = useState(false);
    const reduced = prefersReducedMotion();

    const questions = story?.quiz || [];
    const question = questions[currentQ];
    const isLast = currentQ === questions.length - 1;
    const hasAnswered = selectedIdx !== null;
    const isCorrect = hasAnswered && selectedIdx === question?.correct_index;

    const handleAnswer = useCallback((idx) => {
        if (hasAnswered) return;
        setSelectedIdx(idx);
        if (idx === question.correct_index) setScore((s) => s + 1);
    }, [hasAnswered, question]);

    const handleNext = useCallback(() => {
        if (isLast) {
            const finalScore = score + (isCorrect ? 0 : 0); // score already updated
            onComplete(finalScore >= 0 ? score : 0, questions.length);
            setShowResults(true);
        } else {
            setCurrentQ((q) => q + 1);
            setSelectedIdx(null);
        }
    }, [isLast, score, isCorrect, onComplete, questions.length]);

    if (!story || questions.length === 0) return null;

    // Results Screen
    if (showResults) {
        const pct = Math.round((score / questions.length) * 100);
        const color = pct >= 80 ? 'var(--color-accent-primary)' : pct >= 60 ? 'var(--color-accent-gold)' : 'var(--color-error)';

        return (
            <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', minHeight: '70vh', padding: '32px 24px', textAlign: 'center' }}>
                <div style={{
                    width: '100px', height: '100px', borderRadius: '50%', border: `4px solid ${color}`,
                    display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center',
                }}>
                    <span style={{ fontSize: 'var(--text-2xl)', fontWeight: 'var(--font-weight-bold)', color }}>{pct}%</span>
                </div>
                <p style={{ fontSize: 'var(--text-lg)', fontWeight: 'var(--font-weight-semibold)', color: 'var(--color-text-primary)', marginTop: '20px' }}>
                    {score} / {questions.length} Correct
                </p>
                <p style={{ fontSize: 'var(--text-sm)', color: 'var(--color-text-secondary)', marginTop: '8px' }}>
                    {pct >= 80 ? 'Great comprehension!' : pct >= 60 ? 'Good effort, keep reading!' : 'Try reading the story again.'}
                </p>
                <div style={{ display: 'flex', flexDirection: 'column', gap: '12px', width: '100%', maxWidth: '280px', marginTop: '32px' }}>
                    <button onClick={() => { setShowResults(false); onComplete(score, questions.length); }}
                        style={{ width: '100%', padding: '14px', borderRadius: 'var(--radius-lg)', border: 'none', fontWeight: 'var(--font-weight-bold)', fontSize: 'var(--text-base)', background: 'linear-gradient(135deg, var(--color-accent-primary), #22c55e)', color: 'var(--color-text-inverse)', cursor: 'pointer' }}>
                        Done
                    </button>
                    <button onClick={onReadAgain}
                        style={{ width: '100%', padding: '14px', borderRadius: 'var(--radius-lg)', border: '1px solid var(--color-border-subtle)', fontWeight: 600, fontSize: 'var(--text-sm)', backgroundColor: 'var(--color-bg-secondary)', color: 'var(--color-text-primary)', cursor: 'pointer' }}>
                        Read Again
                    </button>
                </div>
            </div>
        );
    }

    // Question View
    return (
        <div style={{ padding: '16px', minHeight: '100vh', backgroundColor: 'var(--color-bg-primary)' }}>
            {/* Header */}
            <div style={{ textAlign: 'center', marginBottom: '8px' }}>
                <h3 style={{ fontSize: 'var(--text-base)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-text-primary)', margin: '0 0 4px' }}>
                    {story.title}
                </h3>
                <p style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)' }}>
                    Question {currentQ + 1} of {questions.length}
                </p>
            </div>

            {/* Progress bar */}
            <div style={{ height: '4px', backgroundColor: 'var(--color-bg-tertiary)', borderRadius: 'var(--radius-full)', marginBottom: '24px', overflow: 'hidden' }}>
                <div style={{ height: '100%', width: `${((currentQ + (hasAnswered ? 1 : 0)) / questions.length) * 100}%`, background: 'linear-gradient(90deg, var(--color-accent-primary), var(--color-accent-blue))', borderRadius: 'var(--radius-full)', transition: 'width 0.3s ease' }} />
            </div>

            {/* Question */}
            <p style={{ fontSize: 'var(--text-lg)', fontWeight: 'var(--font-weight-semibold)', color: 'var(--color-text-primary)', marginBottom: '20px', lineHeight: 1.5 }}>
                {question.question}
            </p>

            {/* Options */}
            <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
                {question.options.map((opt, i) => {
                    const isSelected = selectedIdx === i;
                    const isCorrectOpt = i === question.correct_index;
                    let bg = 'var(--color-bg-secondary)';
                    let border = '1px solid var(--color-border-subtle)';
                    let icon = null;

                    if (hasAnswered) {
                        if (isCorrectOpt) {
                            bg = 'var(--color-accent-primary-dim)';
                            border = '1.5px solid var(--color-accent-primary)';
                            icon = '✓';
                        } else if (isSelected) {
                            bg = 'var(--color-error-dim, rgba(239,68,68,0.15))';
                            border = '1.5px solid var(--color-error)';
                            icon = '✗';
                        }
                    }

                    return (
                        <button key={i} onClick={() => handleAnswer(i)} disabled={hasAnswered}
                            style={{
                                display: 'flex', alignItems: 'center', gap: '12px', width: '100%',
                                padding: '14px 16px', backgroundColor: bg, borderRadius: 'var(--radius-lg)',
                                border, cursor: hasAnswered ? 'default' : 'pointer', textAlign: 'left',
                                transition: 'all 0.15s ease',
                            }}>
                            <span style={{ flex: 1, fontSize: 'var(--text-sm)', color: 'var(--color-text-primary)' }}>{opt}</span>
                            {icon && <span style={{ fontSize: 'var(--text-lg)', fontWeight: 'var(--font-weight-bold)', color: isCorrectOpt ? 'var(--color-accent-primary)' : 'var(--color-error)' }}>{icon}</span>}
                        </button>
                    );
                })}
            </div>

            {/* Explanation + Next */}
            {hasAnswered && (
                <motion.div
                    initial={reduced ? {} : { opacity: 0, y: 8 }}
                    animate={{ opacity: 1, y: 0 }}
                    style={{ marginTop: '16px' }}
                >
                    <p style={{ fontSize: 'var(--text-sm)', color: 'var(--color-text-secondary)', padding: '12px', backgroundColor: 'var(--color-bg-tertiary)', borderRadius: 'var(--radius-md)', lineHeight: 1.5 }}>
                        {question.explanation}
                    </p>
                    <button onClick={handleNext}
                        style={{ width: '100%', padding: '14px', marginTop: '12px', borderRadius: 'var(--radius-lg)', border: 'none', fontWeight: 'var(--font-weight-bold)', fontSize: 'var(--text-base)', background: 'linear-gradient(135deg, var(--color-accent-primary), #22c55e)', color: 'var(--color-text-inverse)', cursor: 'pointer' }}>
                        {isLast ? 'See Results' : 'Next Question'}
                    </button>
                </motion.div>
            )}
        </div>
    );
}
