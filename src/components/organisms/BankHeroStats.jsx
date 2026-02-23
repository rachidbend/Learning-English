/**
 * BankHeroStats.jsx — 2×2 stat card grid for the Bank tab hero section
 */

import React from 'react';

export default function BankHeroStats({
    currentStreak, totalMastered, currentRank, nextRank,
    wordsToNextRank, retentionRate, milestonePercent,
}) {
    const retColor = retentionRate >= 80
        ? 'var(--color-accent-primary)'
        : retentionRate >= 60
            ? 'var(--color-accent-gold)'
            : 'var(--color-error)';

    const rankPercent = nextRank && wordsToNextRank > 0
        ? Math.min(100, Math.round(((totalMastered) / (totalMastered + wordsToNextRank)) * 100))
        : 100;

    return (
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '12px', padding: '16px' }}>
            {/* Card 1 — Streak */}
            <StatCard bg="var(--color-accent-gold-dim)">
                <FlameIcon />
                <p style={{ fontSize: 'var(--text-2xl)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-accent-gold)', margin: '8px 0 2px' }}>
                    {currentStreak}
                </p>
                <p style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)' }}>Day Streak</p>
            </StatCard>

            {/* Card 2 — Mastered */}
            <StatCard>
                <StarIcon />
                <p style={{ fontSize: 'var(--text-2xl)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-accent-primary)', margin: '8px 0 2px' }}>
                    {totalMastered}
                </p>
                <p style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)' }}>Words Mastered</p>
                <p style={{ fontSize: '0.625rem', color: 'var(--color-text-muted)', marginTop: '2px' }}>of 3,000 goal</p>
            </StatCard>

            {/* Card 3 — Rank */}
            <StatCard>
                <ShieldIcon />
                <p style={{ fontSize: 'var(--text-sm)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-accent-blue)', margin: '8px 0 4px' }}>
                    {currentRank}
                </p>
                <p style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)' }}>Current Rank</p>
                {nextRank && (
                    <>
                        <div style={{ height: '3px', backgroundColor: 'var(--color-bg-tertiary)', borderRadius: 'var(--radius-full)', marginTop: '8px', overflow: 'hidden' }}>
                            <div style={{ height: '100%', width: `${rankPercent}%`, backgroundColor: 'var(--color-accent-blue)', borderRadius: 'var(--radius-full)' }} />
                        </div>
                        <p style={{ fontSize: '0.5625rem', color: 'var(--color-text-muted)', marginTop: '4px' }}>
                            {wordsToNextRank} to {nextRank}
                        </p>
                    </>
                )}
            </StatCard>

            {/* Card 4 — Retention */}
            <StatCard>
                <TargetIcon color={retColor} />
                <p style={{ fontSize: 'var(--text-2xl)', fontWeight: 'var(--font-weight-bold)', color: retColor, margin: '8px 0 2px' }}>
                    {retentionRate}%
                </p>
                <p style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)' }}>Retention Rate</p>
            </StatCard>
        </div>
    );
}

function StatCard({ children, bg }) {
    return (
        <div style={{
            backgroundColor: bg || 'var(--color-bg-secondary)', borderRadius: 'var(--radius-xl)',
            padding: '16px', textAlign: 'center',
        }}>
            {children}
        </div>
    );
}

function FlameIcon() {
    return (
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" style={{ margin: '0 auto' }}>
            <path d="M12 2C10 6 6 9 6 14a6 6 0 0012 0c0-5-4-8-6-12z" stroke="var(--color-accent-gold)" strokeWidth="1.5" fill="var(--color-accent-gold)" fillOpacity="0.2" />
        </svg>
    );
}

function StarIcon() {
    return (
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" style={{ margin: '0 auto' }}>
            <polygon points="12,2 15,9 22,9 16.5,14 18.5,21 12,17 5.5,21 7.5,14 2,9 9,9" stroke="var(--color-accent-primary)" strokeWidth="1.5" fill="var(--color-accent-primary)" fillOpacity="0.2" />
        </svg>
    );
}

function ShieldIcon() {
    return (
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" style={{ margin: '0 auto' }}>
            <path d="M12 3L4 7v5c0 5 3.6 9.5 8 10.5 4.4-1 8-5.5 8-10.5V7l-8-4z" stroke="var(--color-accent-blue)" strokeWidth="1.5" fill="var(--color-accent-blue)" fillOpacity="0.15" />
        </svg>
    );
}

function TargetIcon({ color }) {
    return (
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" style={{ margin: '0 auto' }}>
            <circle cx="12" cy="12" r="10" stroke={color} strokeWidth="1.5" />
            <circle cx="12" cy="12" r="6" stroke={color} strokeWidth="1.5" />
            <circle cx="12" cy="12" r="2" fill={color} />
        </svg>
    );
}
