/**
 * MilestoneTracker.jsx — Progress toward the 3,000-word Oxford goal
 */

import React from 'react';

const TICKS = [500, 1000, 1500, 2000, 2500];

export default function MilestoneTracker({ totalMastered, milestoneTarget, milestonePercent, currentRank }) {
    return (
        <div style={{ padding: '0 16px' }}>
            <div style={{ backgroundColor: 'var(--color-bg-secondary)', borderRadius: 'var(--radius-xl)', padding: '16px' }}>
                <h4 style={{ fontSize: 'var(--text-sm)', fontWeight: 'var(--font-weight-semibold)', color: 'var(--color-text-secondary)', margin: '0 0 16px' }}>
                    Your Oxford Journey
                </h4>

                {/* Progress bar */}
                <div style={{ position: 'relative' }}>
                    <div style={{
                        height: '16px', backgroundColor: 'var(--color-bg-tertiary)',
                        borderRadius: 'var(--radius-full)', overflow: 'hidden',
                    }}>
                        <div style={{
                            height: '100%', width: `${Math.max(milestonePercent, 1)}%`,
                            background: 'linear-gradient(90deg, var(--color-accent-blue), var(--color-accent-primary))',
                            borderRadius: 'var(--radius-full)', transition: 'width 0.6s ease',
                        }} />
                    </div>

                    {/* Tick marks */}
                    {TICKS.map((tick) => {
                        const pos = (tick / milestoneTarget) * 100;
                        const achieved = totalMastered >= tick;
                        return (
                            <div key={tick} style={{
                                position: 'absolute', top: '-2px',
                                left: `${pos}%`, transform: 'translateX(-50%)',
                            }}>
                                <div style={{
                                    width: '3px', height: '20px',
                                    backgroundColor: achieved ? 'var(--color-accent-gold)' : 'var(--color-border-subtle)',
                                    borderRadius: '1px',
                                }} />
                                <p style={{
                                    fontSize: '0.5625rem', color: achieved ? 'var(--color-accent-gold)' : 'var(--color-text-muted)',
                                    textAlign: 'center', marginTop: '4px', whiteSpace: 'nowrap',
                                }}>
                                    {tick >= 1000 ? `${tick / 1000}k` : tick}
                                </p>
                            </div>
                        );
                    })}
                </div>

                {/* Labels */}
                <div style={{ display: 'flex', justifyContent: 'space-between', marginTop: '28px' }}>
                    <span style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)' }}>{totalMastered}</span>
                    <span style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)' }}>3,000</span>
                </div>
                <p style={{ textAlign: 'center', fontSize: 'var(--text-sm)', fontWeight: 'var(--font-weight-semibold)', color: 'var(--color-text-primary)', marginTop: '4px' }}>
                    {milestonePercent}% Complete
                </p>

                {/* Rank badge */}
                <div style={{
                    display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '6px',
                    marginTop: '12px', padding: '8px 16px', backgroundColor: 'var(--color-bg-tertiary)',
                    borderRadius: 'var(--radius-full)', width: 'fit-content', margin: '12px auto 0',
                }}>
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none">
                        <polygon points="12,2 15,9 22,9 16.5,14 18.5,21 12,17 5.5,21 7.5,14 2,9 9,9" fill="var(--color-accent-gold)" />
                    </svg>
                    <span style={{ fontSize: 'var(--text-xs)', fontWeight: 'var(--font-weight-semibold)', color: 'var(--color-accent-gold)' }}>
                        {currentRank}
                    </span>
                </div>
            </div>
        </div>
    );
}
