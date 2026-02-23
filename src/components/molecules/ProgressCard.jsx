/**
 * ProgressCard.jsx
 *
 * Reusable card for displaying a single progress stat.
 * Used in the Dashboard's "Your Progress" grid.
 */

import React from 'react';

const colorMap = {
    blue: 'bg-blue-50 text-blue-900',
    green: 'bg-green-50 text-green-900',
    purple: 'bg-purple-50 text-purple-900',
    amber: 'bg-amber-50 text-amber-900',
    red: 'bg-red-50 text-red-900',
};

const ProgressCard = ({ icon, label, value, color = 'blue' }) => {
    const classes = colorMap[color] || colorMap.blue;

    return (
        <div className={`${classes} rounded-2xl p-4`}>
            <span className="text-2xl block mb-2">{icon}</span>
            <p className="text-2xl font-bold tabular-nums mb-0.5">{value}</p>
            <p className="text-xs opacity-70">{label}</p>
        </div>
    );
};

export default ProgressCard;
