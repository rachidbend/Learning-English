/**
 * StoryIllustration.jsx — Inline SVG illustrations for story cards
 *
 * 4 variants: school, market, family, city
 * Used across story cards and the reader header.
 */

import React from 'react';

const illustrations = {
    school: (
        <svg width="100%" height="100%" viewBox="0 0 80 60" fill="none">
            <rect x="15" y="20" width="50" height="35" rx="3" stroke="var(--color-accent-blue)" strokeWidth="1.5" fill="var(--color-accent-blue-dim)" fillOpacity="0.3" />
            <rect x="35" y="35" width="10" height="20" rx="1" fill="var(--color-accent-blue)" fillOpacity="0.4" />
            <polygon points="10,20 40,5 70,20" stroke="var(--color-accent-blue)" strokeWidth="1.5" fill="var(--color-accent-blue-dim)" fillOpacity="0.2" />
            <rect x="22" y="28" width="8" height="8" rx="1" stroke="var(--color-text-muted)" strokeWidth="1" fill="none" />
            <rect x="50" y="28" width="8" height="8" rx="1" stroke="var(--color-text-muted)" strokeWidth="1" fill="none" />
            <circle cx="40" cy="14" r="3" fill="var(--color-accent-gold)" fillOpacity="0.7" />
        </svg>
    ),
    market: (
        <svg width="100%" height="100%" viewBox="0 0 80 60" fill="none">
            <rect x="5" y="25" width="22" height="30" rx="2" stroke="var(--color-accent-gold)" strokeWidth="1.5" fill="var(--color-accent-gold-dim)" fillOpacity="0.3" />
            <rect x="30" y="20" width="22" height="35" rx="2" stroke="var(--color-accent-primary)" strokeWidth="1.5" fill="var(--color-accent-primary)" fillOpacity="0.15" />
            <rect x="55" y="25" width="22" height="30" rx="2" stroke="var(--color-accent-blue)" strokeWidth="1.5" fill="var(--color-accent-blue-dim)" fillOpacity="0.3" />
            <path d="M5 25 Q16 15 27 25" stroke="var(--color-accent-gold)" strokeWidth="1.5" fill="var(--color-accent-gold-dim)" fillOpacity="0.2" />
            <path d="M30 20 Q41 10 52 20" stroke="var(--color-accent-primary)" strokeWidth="1.5" fill="var(--color-accent-primary)" fillOpacity="0.1" />
            <path d="M55 25 Q66 15 77 25" stroke="var(--color-accent-blue)" strokeWidth="1.5" fill="var(--color-accent-blue-dim)" fillOpacity="0.2" />
            <circle cx="16" cy="38" r="4" fill="var(--color-accent-gold)" fillOpacity="0.5" />
            <circle cx="41" cy="35" r="3" fill="var(--color-accent-primary)" fillOpacity="0.4" />
            <circle cx="66" cy="38" r="4" fill="var(--color-accent-blue)" fillOpacity="0.5" />
        </svg>
    ),
    family: (
        <svg width="100%" height="100%" viewBox="0 0 80 60" fill="none">
            <circle cx="25" cy="20" r="8" stroke="var(--color-accent-blue)" strokeWidth="1.5" fill="var(--color-accent-blue-dim)" fillOpacity="0.3" />
            <circle cx="55" cy="20" r="8" stroke="var(--color-accent-gold)" strokeWidth="1.5" fill="var(--color-accent-gold-dim)" fillOpacity="0.3" />
            <circle cx="40" cy="22" r="6" stroke="var(--color-accent-primary)" strokeWidth="1.5" fill="var(--color-accent-primary)" fillOpacity="0.2" />
            <path d="M15 55 Q25 35 35 55" stroke="var(--color-accent-blue)" strokeWidth="1.5" fill="var(--color-accent-blue-dim)" fillOpacity="0.2" />
            <path d="M45 55 Q55 35 65 55" stroke="var(--color-accent-gold)" strokeWidth="1.5" fill="var(--color-accent-gold-dim)" fillOpacity="0.2" />
            <path d="M30 55 Q40 38 50 55" stroke="var(--color-accent-primary)" strokeWidth="1.5" fill="var(--color-accent-primary)" fillOpacity="0.15" />
            <line x1="25" y1="28" x2="25" y2="40" stroke="var(--color-accent-blue)" strokeWidth="1" />
            <line x1="55" y1="28" x2="55" y2="40" stroke="var(--color-accent-gold)" strokeWidth="1" />
            <line x1="40" y1="28" x2="40" y2="38" stroke="var(--color-accent-primary)" strokeWidth="1" />
        </svg>
    ),
    city: (
        <svg width="100%" height="100%" viewBox="0 0 80 60" fill="none">
            <rect x="8" y="15" width="14" height="40" rx="2" stroke="var(--color-accent-blue)" strokeWidth="1.5" fill="var(--color-accent-blue-dim)" fillOpacity="0.3" />
            <rect x="25" y="8" width="14" height="47" rx="2" stroke="var(--color-accent-primary)" strokeWidth="1.5" fill="var(--color-accent-primary)" fillOpacity="0.15" />
            <rect x="42" y="20" width="14" height="35" rx="2" stroke="var(--color-accent-gold)" strokeWidth="1.5" fill="var(--color-accent-gold-dim)" fillOpacity="0.3" />
            <rect x="59" y="12" width="14" height="43" rx="2" stroke="var(--color-accent-blue)" strokeWidth="1.5" fill="var(--color-accent-blue-dim)" fillOpacity="0.2" />
            <rect x="12" y="22" width="4" height="4" rx="0.5" fill="var(--color-text-muted)" fillOpacity="0.4" />
            <rect x="12" y="30" width="4" height="4" rx="0.5" fill="var(--color-text-muted)" fillOpacity="0.4" />
            <rect x="29" y="15" width="4" height="4" rx="0.5" fill="var(--color-text-muted)" fillOpacity="0.4" />
            <rect x="29" y="23" width="4" height="4" rx="0.5" fill="var(--color-text-muted)" fillOpacity="0.4" />
            <rect x="29" y="31" width="4" height="4" rx="0.5" fill="var(--color-text-muted)" fillOpacity="0.4" />
        </svg>
    ),
};

export default function StoryIllustration({ type, style }) {
    return (
        <div style={{ width: '100%', height: '100%', display: 'flex', alignItems: 'center', justifyContent: 'center', ...style }}>
            {illustrations[type] || illustrations.city}
        </div>
    );
}
