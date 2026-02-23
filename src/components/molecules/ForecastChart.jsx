/**
 * ForecastChart.jsx — 7-day review forecast bar chart using Recharts
 *
 * Shows upcoming review load for the next 7 days.
 * Today's bar highlighted in accent-primary, future bars in accent-blue-dim.
 */

import React from 'react';
import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, Cell } from 'recharts';

const TODAY_COLOR = 'var(--color-accent-primary)';
const FUTURE_COLOR = 'var(--color-accent-blue-dim)';

const CustomTooltip = ({ active, payload }) => {
    if (!active || !payload?.length) return null;
    return (
        <div style={{
            backgroundColor: 'var(--color-bg-tertiary)',
            color: 'var(--color-text-primary)',
            padding: '6px 12px',
            borderRadius: 'var(--radius-sm)',
            fontSize: 'var(--text-xs)',
            fontWeight: 600,
            boxShadow: 'var(--shadow-sm)',
        }}>
            {payload[0].value} {payload[0].value === 1 ? 'word' : 'words'}
        </div>
    );
};

export default function ForecastChart({ forecast }) {
    if (!forecast || forecast.length === 0) return null;

    const maxCount = Math.max(...forecast.map((d) => d.count), 1);

    return (
        <div style={{ marginTop: '8px' }}>
            <h4 style={{ fontSize: 'var(--text-sm)', fontWeight: 'var(--font-weight-semibold)', color: 'var(--color-text-secondary)', margin: '0 0 12px' }}>
                7-Day Forecast
            </h4>
            <div style={{ width: '100%', height: 140 }}>
                <ResponsiveContainer width="100%" height="100%">
                    <BarChart data={forecast} barCategoryGap="20%">
                        <XAxis
                            dataKey="label"
                            axisLine={false}
                            tickLine={false}
                            tick={{ fontSize: 11, fill: 'var(--color-text-muted)' }}
                        />
                        <YAxis hide domain={[0, maxCount]} />
                        <Tooltip content={<CustomTooltip />} cursor={false} />
                        <Bar dataKey="count" radius={[4, 4, 0, 0]} maxBarSize={32}>
                            {forecast.map((entry, i) => (
                                <Cell
                                    key={i}
                                    fill={entry.isToday ? TODAY_COLOR : FUTURE_COLOR}
                                    stroke={entry.isToday ? TODAY_COLOR : 'var(--color-accent-blue)'}
                                    strokeWidth={entry.isToday ? 0 : 1}
                                />
                            ))}
                        </Bar>
                    </BarChart>
                </ResponsiveContainer>
            </div>
        </div>
    );
}
