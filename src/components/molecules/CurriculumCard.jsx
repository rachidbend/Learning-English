/**
 * CurriculumCard.jsx — CTA card for Curriculum Explorer
 *
 * Fires 'curriculum_opened' analytics event on tap.
 */

import React from 'react';
import { analytics } from '../../analytics/events';

export default function CurriculumCard({ onNavigate }) {
    const handleTap = () => {
        analytics.track('curriculum_opened');
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
            {/* Compass SVG */}
            <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                <circle cx="20" cy="20" r="14" stroke="var(--color-accent-blue)" strokeWidth="2" fill="var(--color-accent-blue-dim)" fillOpacity="0.3" />
                <polygon points="20,8 23,18 20,16 17,18" fill="var(--color-accent-blue)" fillOpacity="0.7" />
                <polygon points="20,32 17,22 20,24 23,22" fill="var(--color-text-muted)" fillOpacity="0.5" />
                <circle cx="20" cy="20" r="2" fill="var(--color-accent-blue)" />
            </svg>

            <div style={{ flex: 1 }}>
                <p style={{ fontSize: 'var(--text-base)', fontWeight: 'var(--font-weight-semibold)', color: 'var(--color-text-primary)', margin: 0 }}>
                    The Curriculum
                </p>
                <p style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)', margin: '2px 0 0' }}>
                    Explore all levels &amp; exams
                </p>
            </div>

            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-muted)" strokeWidth="2" strokeLinecap="round">
                <polyline points="9 18 15 12 9 6" />
            </svg>
        </button>
    );
}
