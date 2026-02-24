/**
 * WeeklyGrowthChart.jsx — 7-day word mastery bar chart using Recharts
 */

import React from 'react';
import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, Cell } from 'recharts';

const TODAY_COLOR = 'var(--color-accent-primary)';
const PAST_COLOR = 'var(--color-accent-blue-dim)';

const CustomTooltip = ({ active, payload }) => {
    if (!active || !payload?.length) return null;
    return (
        <div style={{
            backgroundColor: 'var(--color-bg-tertiary)', color: 'var(--color-text-primary)',
            padding: '6px 12px', borderRadius: 'var(--radius-sm)', fontSize: 'var(--text-xs)',
            fontWeight: 600, boxShadow: 'var(--shadow-sm)',
        }}>
            {payload[0].value} {payload[0].value === 1 ? 'word' : 'words'} mastered
        </div>
    );
};

export default function WeeklyGrowthChart({ weeklyGrowth }) {
    const allZero = !weeklyGrowth || weeklyGrowth.every((d) => d.wordsLearned === 0);
    const maxCount = Math.max(...(weeklyGrowth || []).map((d) => d.wordsLearned), 1);

    return (
        <div style={{ padding: '0 16px' }}>
            <div style={{ backgroundColor: 'var(--color-bg-secondary)', borderRadius: 'var(--radius-xl)', padding: '16px' }}>
                <h4 style={{ fontSize: 'var(--text-sm)', fontWeight: 'var(--font-weight-semibold)', color: 'var(--color-text-secondary)', margin: '0 0 12px' }}>
                    Weekly Growth
                </h4>

                {allZero ? (
                    <div style={{
                        height: '120px', display: 'flex', alignItems: 'center', justifyContent: 'center',
                    }}>
                        <p style={{ fontSize: 'var(--text-sm)', color: 'var(--color-text-muted)', textAlign: 'center' }}>
                            Start learning to see your growth
                        </p>
                    </div>
                ) : (
                    <div style={{ width: '100%', height: 160 }}>
                        <ResponsiveContainer width="100%" height="100%">
                            <BarChart data={weeklyGrowth} barCategoryGap="20%">
                                <XAxis
                                    dataKey="label" axisLine={false} tickLine={false}
                                    tick={{ fontSize: 11, fill: 'var(--color-text-muted)' }}
                                />
                                <YAxis hide domain={[0, maxCount]} />
                                <Tooltip content={<CustomTooltip />} cursor={false} />
                                <Bar dataKey="wordsLearned" radius={[4, 4, 0, 0]} maxBarSize={32}>
                                    {(weeklyGrowth || []).map((entry, i) => (
                                        <Cell
                                            key={i}
                                            fill={entry.isToday ? TODAY_COLOR : PAST_COLOR}
                                            stroke={entry.isToday ? TODAY_COLOR : 'var(--color-accent-blue)'}
                                            strokeWidth={entry.isToday ? 0 : 1}
                                        />
                                    ))}
                                </Bar>
                            </BarChart>
                        </ResponsiveContainer>
                    </div>
                )}
            </div>
        </div>
    );
}
