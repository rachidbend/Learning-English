/**
 * BottomNavBar.jsx — Primary navigation bar with 5 tabs
 *
 * Tabs: Learn, Review, Stories, Bank & Stats, Account
 * Active tab shows icon in accent-blue with label.
 * Inactive tabs show muted icon, no label.
 * Fires TAB_SWITCHED analytics event on tab change.
 */

import React from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { analytics } from '../../analytics/events';
import { EVENTS } from '../../constants/analyticsEvents';
import { duration, easing, prefersReducedMotion } from '../../styles/motion';

const TABS = [
    {
        id: 'learn',
        label: 'Learn',
        icon: (
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20" />
                <path d="M4 4.5A2.5 2.5 0 0 1 6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15z" />
            </svg>
        ),
    },
    {
        id: 'review',
        label: 'Review',
        icon: (
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14" />
                <polyline points="22 4 12 14.01 9 11.01" />
            </svg>
        ),
    },
    {
        id: 'stories',
        label: 'Stories',
        icon: (
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z" />
                <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z" />
            </svg>
        ),
    },
    {
        id: 'bank',
        label: 'Bank',
        icon: (
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                <line x1="18" y1="20" x2="18" y2="10" />
                <line x1="12" y1="20" x2="12" y2="4" />
                <line x1="6" y1="20" x2="6" y2="14" />
            </svg>
        ),
    },
    {
        id: 'account',
        label: 'Account',
        icon: (
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
                <circle cx="12" cy="7" r="4" />
            </svg>
        ),
    },
];

export default function BottomNavBar({ activeTab, onTabChange }) {
    const reduced = prefersReducedMotion();

    const handleTabClick = (tabId) => {
        if (tabId === activeTab) return;
        analytics.track(EVENTS.TAB_SWITCHED, {
            from_tab: activeTab,
            to_tab: tabId,
        });
        onTabChange(tabId);
    };

    return (
        <nav
            style={{
                height: '64px',
                backgroundColor: 'var(--color-bg-secondary)',
                borderTop: '1px solid var(--color-border-subtle)',
                paddingBottom: 'env(safe-area-inset-bottom, 0px)',
            }}
            className="fixed bottom-0 left-0 right-0 z-50 flex items-center justify-around"
        >
            {TABS.map((tab) => {
                const isActive = tab.id === activeTab;
                return (
                    <button
                        key={tab.id}
                        onClick={() => handleTabClick(tab.id)}
                        className="flex flex-col items-center justify-center flex-1 h-full transition-colors"
                        style={{
                            color: isActive
                                ? 'var(--color-accent-blue)'
                                : 'var(--color-text-muted)',
                            background: 'none',
                            border: 'none',
                            cursor: 'pointer',
                        }}
                    >
                        <div className="mb-1">{tab.icon}</div>
                        <AnimatePresence>
                            {isActive && (
                                <motion.span
                                    initial={reduced ? { opacity: 1 } : { opacity: 0, y: 4 }}
                                    animate={{ opacity: 1, y: 0 }}
                                    exit={reduced ? { opacity: 0 } : { opacity: 0, y: 4 }}
                                    transition={{
                                        duration: reduced ? 0 : duration.fast,
                                        ease: easing.standard,
                                    }}
                                    style={{
                                        fontSize: '0.625rem',
                                        fontWeight: 600,
                                        lineHeight: 1,
                                    }}
                                >
                                    {tab.label}
                                </motion.span>
                            )}
                        </AnimatePresence>
                    </button>
                );
            })}
        </nav>
    );
}
