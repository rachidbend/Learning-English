/**
 * ExitConfirmModal.jsx — "Exit session?" confirmation
 */

import React from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { prefersReducedMotion } from '../../styles/motion';

export default function ExitConfirmModal({ isOpen, onCancel, onConfirm }) {
    const reduced = prefersReducedMotion();

    return (
        <AnimatePresence>
            {isOpen && (
                <>
                    <motion.div
                        initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
                        transition={{ duration: reduced ? 0 : 0.15 }}
                        onClick={onCancel}
                        style={{ position: 'fixed', inset: 0, backgroundColor: 'rgba(0,0,0,0.5)', zIndex: 90 }}
                    />
                    <motion.div
                        initial={reduced ? { opacity: 0 } : { opacity: 0, scale: 0.95 }}
                        animate={{ opacity: 1, scale: 1 }}
                        exit={reduced ? { opacity: 0 } : { opacity: 0, scale: 0.95 }}
                        transition={{ duration: reduced ? 0 : 0.15 }}
                        style={{
                            position: 'fixed', inset: 0, zIndex: 100,
                            display: 'flex', alignItems: 'center', justifyContent: 'center',
                            pointerEvents: 'none',
                        }}
                    >
                        <div style={{
                            backgroundColor: 'var(--color-bg-secondary)', borderRadius: 'var(--radius-xl)',
                            padding: '24px', width: 'calc(100% - 48px)', maxWidth: '340px', textAlign: 'center',
                            pointerEvents: 'auto',
                        }}>
                            <h3 style={{ fontSize: 'var(--text-lg)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-text-primary)', margin: '0 0 8px' }}>
                                Exit session?
                            </h3>
                            <p style={{ fontSize: 'var(--text-sm)', color: 'var(--color-text-secondary)', margin: '0 0 20px', lineHeight: 1.5 }}>
                                Your progress so far will be saved.
                            </p>
                            <div style={{ display: 'flex', gap: '12px' }}>
                                <button onClick={onCancel} style={{
                                    flex: 1, padding: '12px', borderRadius: 'var(--radius-lg)',
                                    border: '1px solid var(--color-border-subtle)', backgroundColor: 'var(--color-bg-tertiary)',
                                    color: 'var(--color-text-primary)', fontWeight: 600, cursor: 'pointer',
                                }}>Cancel</button>
                                <button onClick={onConfirm} style={{
                                    flex: 1, padding: '12px', borderRadius: 'var(--radius-lg)',
                                    border: 'none', backgroundColor: 'var(--color-error)',
                                    color: 'white', fontWeight: 'var(--font-weight-bold)', cursor: 'pointer',
                                }}>Exit</button>
                            </div>
                        </div>
                    </motion.div>
                </>
            )}
        </AnimatePresence>
    );
}
