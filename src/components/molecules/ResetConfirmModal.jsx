/**
 * ResetConfirmModal.jsx — Confirmation modal for resetting all progress
 */

import React from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { prefersReducedMotion } from '../../styles/motion';

export default function ResetConfirmModal({ isOpen, onCancel, onConfirm }) {
    const reduced = prefersReducedMotion();

    return (
        <AnimatePresence>
            {isOpen && (
                <>
                    <motion.div
                        initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
                        transition={{ duration: reduced ? 0 : 0.2 }}
                        onClick={onCancel}
                        style={{ position: 'fixed', inset: 0, backgroundColor: 'rgba(0,0,0,0.6)', zIndex: 90 }}
                    />
                    <motion.div
                        initial={reduced ? { opacity: 0 } : { opacity: 0, scale: 0.95 }}
                        animate={{ opacity: 1, scale: 1 }}
                        exit={reduced ? { opacity: 0 } : { opacity: 0, scale: 0.95 }}
                        transition={{ duration: reduced ? 0 : 0.2 }}
                        style={{
                            position: 'fixed', top: '50%', left: '50%', transform: 'translate(-50%, -50%)',
                            zIndex: 100, backgroundColor: 'var(--color-bg-secondary)', borderRadius: 'var(--radius-xl)',
                            padding: '24px', width: 'calc(100% - 48px)', maxWidth: '360px', textAlign: 'center',
                        }}
                    >
                        <h3 style={{ fontSize: 'var(--text-lg)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-text-primary)', margin: '0 0 8px' }}>
                            Are you sure?
                        </h3>
                        <p style={{ fontSize: 'var(--text-sm)', color: 'var(--color-text-secondary)', lineHeight: 1.5, margin: '0 0 20px' }}>
                            This will delete all your progress. This cannot be undone.
                        </p>
                        <div style={{ display: 'flex', gap: '12px' }}>
                            <button onClick={onCancel} style={{
                                flex: 1, padding: '12px', borderRadius: 'var(--radius-lg)',
                                border: '1px solid var(--color-border-subtle)', backgroundColor: 'var(--color-bg-tertiary)',
                                color: 'var(--color-text-primary)', fontWeight: 600, cursor: 'pointer',
                            }}>Cancel</button>
                            <button onClick={onConfirm} style={{
                                flex: 1, padding: '12px', borderRadius: 'var(--radius-lg)',
                                border: 'none', backgroundColor: 'var(--color-error)', color: 'white',
                                fontWeight: 'var(--font-weight-bold)', cursor: 'pointer',
                            }}>Reset Everything</button>
                        </div>
                    </motion.div>
                </>
            )}
        </AnimatePresence>
    );
}
