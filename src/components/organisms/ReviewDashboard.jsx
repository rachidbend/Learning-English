/**
 * ReviewDashboard.jsx — Pre-session view for the Review tab
 *
 * Shows Start Review button, 7-day forecast, and quick stats.
 * When no words are due, shows AllCaughtUp empty state.
 */

import React from 'react';
import ForecastChart from '../molecules/ForecastChart';
import AllCaughtUp from '../molecules/AllCaughtUp';

export default function ReviewDashboard({
    dueNow, forecast, retentionRate, totalReviewed,
    currentStreak, onStartReview, nextReviewDate,
}) {
    return (
        <div style={{ padding: '16px', display: 'flex', flexDirection: 'column', gap: '16px' }}>
            {/* Header */}
            <div style={{ textAlign: 'center', paddingTop: '8px' }}>
                <h2 style={{ fontSize: 'var(--text-2xl)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-text-primary)', margin: 0 }}>
                    Review
                </h2>
                <p style={{ fontSize: 'var(--text-sm)', color: 'var(--color-text-secondary)', marginTop: '4px' }}>
                    Strengthen your memory
                </p>
            </div>

            {/* Start Review or Empty State */}
            {dueNow > 0 ? (
                <button
                    onClick={onStartReview}
                    style={{
                        width: '100%', padding: '18px', borderRadius: 'var(--radius-lg)',
                        border: 'none', fontWeight: 'var(--font-weight-bold)', fontSize: 'var(--text-base)',
                        background: 'linear-gradient(135deg, var(--color-accent-primary), #22c55e)',
                        color: 'var(--color-text-inverse)', cursor: 'pointer',
                        boxShadow: 'var(--shadow-glow-green)', transition: 'transform 0.1s ease',
                    }}
                    onMouseDown={(e) => (e.currentTarget.style.transform = 'scale(0.97)')}
                    onMouseUp={(e) => (e.currentTarget.style.transform = 'scale(1)')}
                    onMouseLeave={(e) => (e.currentTarget.style.transform = 'scale(1)')}
                >
                    Start Review Session ({dueNow} {dueNow === 1 ? 'Word' : 'Words'} Due)
                </button>
            ) : (
                <div style={{ backgroundColor: 'var(--color-bg-secondary)', borderRadius: 'var(--radius-xl)', padding: '8px' }}>
                    <AllCaughtUp nextReviewDate={nextReviewDate} />
                </div>
            )}

            {/* 7-Day Forecast */}
            <div style={{ backgroundColor: 'var(--color-bg-secondary)', borderRadius: 'var(--radius-xl)', padding: '16px' }}>
                <ForecastChart forecast={forecast} />
            </div>

            {/* Quick Stats Row */}
            <div style={{
                display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: '12px',
            }}>
                <StatItem value={`${retentionRate}%`} label="Retention Rate" />
                <StatItem value={totalReviewed} label="Total Reviewed" />
                <StatItem
                    value={currentStreak}
                    label="Day Streak"
                    icon={currentStreak > 0 ? '🔥' : null}
                />
            </div>
        </div>
    );
}

function StatItem({ value, label, icon }) {
    return (
        <div style={{
            backgroundColor: 'var(--color-bg-secondary)', borderRadius: 'var(--radius-lg)',
            padding: '16px 12px', textAlign: 'center',
        }}>
            <p style={{ fontSize: 'var(--text-xl)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-accent-gold)', margin: 0 }}>
                {icon && <span style={{ marginRight: '4px' }}>{icon}</span>}
                {value}
            </p>
            <p style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)', marginTop: '4px' }}>
                {label}
            </p>
        </div>
    );
}
