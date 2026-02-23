/**
 * WordDefinitionSheet.jsx — Bottom sheet for word definitions
 *
 * Opens when user taps a vocabulary word in the story reader.
 * Shows word, translation, definition, IPA, and example sentence.
 * Uses parseHighlighting from security_guidelines.md for examples.
 */

import React from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { duration, easing, prefersReducedMotion } from '../../styles/motion';
import { parseHighlighting } from '../../utils/textTokenizer';

export default function WordDefinitionSheet({ word, isOpen, onClose }) {
    const reduced = prefersReducedMotion();

    // Find primary example sentence
    const primaryExample = word?.examples?.find((e) => e.is_primary) || word?.examples?.[0];

    return (
        <AnimatePresence>
            {isOpen && word && (
                <>
                    {/* Overlay */}
                    <motion.div
                        key="overlay"
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        exit={{ opacity: 0 }}
                        transition={{ duration: reduced ? 0 : 0.2 }}
                        onClick={onClose}
                        style={{
                            position: 'fixed', inset: 0, backgroundColor: 'rgba(0,0,0,0.6)', zIndex: 90,
                        }}
                    />

                    {/* Sheet */}
                    <motion.div
                        key="sheet"
                        initial={reduced ? { opacity: 0 } : { y: '100%' }}
                        animate={reduced ? { opacity: 1 } : { y: 0 }}
                        exit={reduced ? { opacity: 0 } : { y: '100%' }}
                        transition={{ duration: reduced ? 0 : duration.normal, ease: easing.decelerate }}
                        style={{
                            position: 'fixed', bottom: 0, left: 0, right: 0, zIndex: 100,
                            backgroundColor: 'var(--color-bg-tertiary)', borderRadius: '24px 24px 0 0',
                            padding: '12px 24px 32px', maxHeight: '60vh', overflow: 'auto',
                        }}
                    >
                        {/* Drag handle */}
                        <div style={{ display: 'flex', justifyContent: 'center', marginBottom: '16px' }}>
                            <div style={{ width: '40px', height: '4px', backgroundColor: 'var(--color-border-subtle)', borderRadius: '2px' }} />
                        </div>

                        {/* Word */}
                        <h3 style={{ fontSize: 'var(--text-2xl)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-text-primary)', margin: 0 }}>
                            {word.word}
                        </h3>

                        {/* Part of speech badge */}
                        {word.pos && (
                            <span style={{
                                display: 'inline-block', fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)',
                                backgroundColor: 'var(--color-bg-secondary)', padding: '2px 8px',
                                borderRadius: 'var(--radius-full)', marginTop: '6px',
                            }}>
                                {word.pos}
                            </span>
                        )}

                        {/* IPA pronunciation */}
                        {word.pronunciation?.ipa && (
                            <p style={{ fontSize: 'var(--text-sm)', color: 'var(--color-text-muted)', fontFamily: 'monospace', marginTop: '8px' }}>
                                {word.pronunciation.ipa}
                            </p>
                        )}

                        {/* Arabic translation */}
                        {word.word_ar && (
                            <p style={{
                                fontSize: 'var(--text-xl)', color: 'var(--color-accent-gold)',
                                fontFamily: 'var(--font-arabic)', direction: 'rtl', marginTop: '12px',
                            }}>
                                {word.word_ar}
                            </p>
                        )}

                        {/* English definition */}
                        {word.definition?.en && (
                            <p style={{ fontSize: 'var(--text-sm)', color: 'var(--color-text-secondary)', marginTop: '12px', lineHeight: 1.5 }}>
                                {word.definition.en}
                            </p>
                        )}

                        {/* Example sentence */}
                        {primaryExample && (
                            <div style={{
                                marginTop: '16px', padding: '12px', backgroundColor: 'var(--color-bg-secondary)',
                                borderRadius: 'var(--radius-md)', borderLeft: '3px solid var(--color-accent-blue)',
                            }}>
                                <p style={{ fontSize: 'var(--text-sm)', color: 'var(--color-text-primary)', margin: 0, lineHeight: 1.5 }}>
                                    <span dangerouslySetInnerHTML={{ __html: parseHighlighting(primaryExample.en) }} />
                                </p>
                                {primaryExample.ar && (
                                    <p style={{
                                        fontSize: 'var(--text-sm)', color: 'var(--color-text-secondary)',
                                        fontFamily: 'var(--font-arabic)', direction: 'rtl', marginTop: '6px',
                                    }}>
                                        {primaryExample.ar}
                                    </p>
                                )}
                            </div>
                        )}
                    </motion.div>
                </>
            )}
        </AnimatePresence>
    );
}
