/**
 * OfflineIndicator.jsx — Slim banner when device is offline
 */

import React from 'react';
import { AnimatePresence, motion } from 'framer-motion';
import { useNetworkStatus } from '../../hooks/useNetworkStatus';
import { prefersReducedMotion } from '../../styles/motion';

export default function OfflineIndicator() {
    const { isOnline } = useNetworkStatus();
    const reduced = prefersReducedMotion();

    return (
        <AnimatePresence>
            {!isOnline && (
                <motion.div
                    initial={reduced ? { opacity: 0 } : { y: -36, opacity: 0 }}
                    animate={reduced ? { opacity: 1 } : { y: 0, opacity: 1 }}
                    exit={reduced ? { opacity: 0 } : { y: -36, opacity: 0 }}
                    transition={{ duration: reduced ? 0 : 0.2 }}
                    style={{
                        height: '36px', display: 'flex', alignItems: 'center', gap: '8px',
                        padding: '0 16px', backgroundColor: 'var(--color-bg-tertiary)',
                        borderLeft: '3px solid var(--color-warning, var(--color-accent-gold))',
                    }}
                >
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-muted)" strokeWidth="2" strokeLinecap="round">
                        <line x1="1" y1="1" x2="23" y2="23" />
                        <path d="M16.72 11.06A10.94 10.94 0 0119 12.55" />
                        <path d="M5 12.55a10.94 10.94 0 015.17-2.39" />
                        <path d="M10.71 5.05A16 16 0 0122.56 9" />
                        <path d="M1.42 9a15.91 15.91 0 014.7-2.88" />
                        <path d="M8.53 16.11a6 6 0 016.95 0" />
                        <line x1="12" y1="20" x2="12.01" y2="20" />
                    </svg>
                    <span style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)' }}>
                        You're offline — all features still work
                    </span>
                </motion.div>
            )}
        </AnimatePresence>
    );
}
