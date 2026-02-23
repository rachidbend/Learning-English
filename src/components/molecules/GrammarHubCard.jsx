/**
 * GrammarHubCard.jsx — CTA card for Grammar Hub navigation
 *
 * Fires GRAMMAR_HUB_OPENED analytics event on tap.
 */

import React from 'react';
import { analytics } from '../../analytics/events';
import { EVENTS } from '../../constants/analyticsEvents';

export default function GrammarHubCard({ onNavigate }) {
    const handleTap = () => {
        analytics.track(EVENTS.GRAMMAR_HUB_OPENED);
        onNavigate();
    };

    return (
        <button
            onClick={handleTap}
            style={{
                display: 'flex',
                alignItems: 'center',
                gap: '16px',
                width: '100%',
                padding: '16px 20px',
                backgroundColor: 'var(--color-bg-secondary)',
                borderRadius: 'var(--radius-xl)',
                border: 'none',
                cursor: 'pointer',
                transition: 'background-color 0.2s ease',
                textAlign: 'left',
            }}
            onMouseEnter={(e) => (e.currentTarget.style.backgroundColor = 'var(--color-bg-tertiary)')}
            onMouseLeave={(e) => (e.currentTarget.style.backgroundColor = 'var(--color-bg-secondary)')}
        >
            {/* Notebook + pencil SVG */}
            <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                <rect x="8" y="4" width="20" height="32" rx="3" stroke="var(--color-accent-gold)" strokeWidth="2" fill="var(--color-accent-gold-dim)" fillOpacity="0.3" />
                <line x1="14" y1="12" x2="24" y2="12" stroke="var(--color-text-muted)" strokeWidth="1.5" strokeLinecap="round" />
                <line x1="14" y1="18" x2="22" y2="18" stroke="var(--color-text-muted)" strokeWidth="1.5" strokeLinecap="round" />
                <line x1="14" y1="24" x2="20" y2="24" stroke="var(--color-text-muted)" strokeWidth="1.5" strokeLinecap="round" />
                <path d="M30 8L34 12L26 20L22 20L22 16L30 8Z" fill="var(--color-accent-gold)" fillOpacity="0.6" />
            </svg>

            <div style={{ flex: 1 }}>
                <p style={{ fontSize: 'var(--text-base)', fontWeight: 'var(--font-weight-semibold)', color: 'var(--color-text-primary)', margin: 0 }}>
                    Grammar Hub
                </p>
                <p style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)', margin: '2px 0 0' }}>
                    Master essential rules
                </p>
            </div>

            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-muted)" strokeWidth="2" strokeLinecap="round">
                <polyline points="9 18 15 12 9 6" />
            </svg>
        </button>
    );
}
