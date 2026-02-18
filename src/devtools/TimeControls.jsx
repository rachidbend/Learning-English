/**
 * TimeControls.jsx
 *
 * Time simulation controls for testing scheduling.
 */

import React, { useState, useEffect } from 'react';
import devUtils from './devUtils';

const TimeControls = () => {
    const [currentOffset, setCurrentOffset] = useState(0);
    const [customDays, setCustomDays] = useState('');

    useEffect(() => {
        setCurrentOffset(devUtils.getTimeOffset());
    }, []);

    const handleAddTime = (days) => {
        devUtils.addToTimeOffset(days);
        setCurrentOffset(devUtils.getTimeOffset());
    };

    const handleSetCustom = () => {
        const days = parseFloat(customDays);
        if (!isNaN(days)) {
            devUtils.setTimeOffset(days);
            setCurrentOffset(days);
            setCustomDays('');
        }
    };

    const handleReset = () => {
        devUtils.resetTime();
        setCurrentOffset(0);
    };

    const effectiveDate = new Date(Date.now() + currentOffset * 86400000);

    return (
        <div style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
            {/* Current Time Status */}
            <div>
                <h3 className="text-lg font-semibold" style={{ marginBottom: '0.75rem' }}>
                    Current Time Status
                </h3>
                <div style={{
                    background: '#111827', color: 'white', borderRadius: '0.75rem',
                    padding: '1rem', fontFamily: 'monospace', fontSize: '0.875rem',
                    display: 'flex', flexDirection: 'column', gap: '0.5rem'
                }}>
                    <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                        <span style={{ color: '#9CA3AF' }}>Real time:</span>
                        <span>{new Date().toLocaleString()}</span>
                    </div>
                    <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                        <span style={{ color: '#9CA3AF' }}>Time offset:</span>
                        <span style={{
                            color: currentOffset !== 0 ? '#FBBF24' : 'inherit',
                            fontWeight: currentOffset !== 0 ? 'bold' : 'normal'
                        }}>
                            {currentOffset > 0 ? '+' : ''}{currentOffset} days
                        </span>
                    </div>
                    <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                        <span style={{ color: '#9CA3AF' }}>Effective time:</span>
                        <span style={{ color: '#60A5FA' }}>{effectiveDate.toLocaleString()}</span>
                    </div>
                </div>
            </div>

            {/* Quick Time Jumps */}
            <div>
                <h3 className="text-lg font-semibold" style={{ marginBottom: '0.75rem' }}>
                    Quick Time Jump
                </h3>
                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '0.75rem' }}>
                    {[
                        { label: '+1 Day', days: 1, bg: '#DBEAFE', color: '#1E3A5F' },
                        { label: '+3 Days', days: 3, bg: '#DBEAFE', color: '#1E3A5F' },
                        { label: '+1 Week', days: 7, bg: '#DBEAFE', color: '#1E3A5F' },
                        { label: '+2 Weeks', days: 14, bg: '#E9D5FF', color: '#4C1D95' },
                        { label: '+1 Month', days: 30, bg: '#E9D5FF', color: '#4C1D95' },
                        { label: '+3 Months', days: 90, bg: '#E9D5FF', color: '#4C1D95' },
                    ].map(btn => (
                        <button
                            key={btn.days}
                            onClick={() => handleAddTime(btn.days)}
                            style={{
                                padding: '0.75rem', background: btn.bg, color: btn.color,
                                borderRadius: '0.5rem', fontWeight: 500, border: 'none',
                                cursor: 'pointer', fontSize: '0.875rem',
                            }}
                        >
                            {btn.label}
                        </button>
                    ))}
                </div>
            </div>

            {/* Custom Time Jump */}
            <div>
                <h3 className="text-lg font-semibold" style={{ marginBottom: '0.75rem' }}>
                    Custom Time Jump
                </h3>
                <div style={{ display: 'flex', gap: '0.75rem' }}>
                    <input
                        type="number"
                        value={customDays}
                        onChange={(e) => setCustomDays(e.target.value)}
                        placeholder="Days (can be negative)"
                        onKeyDown={(e) => e.key === 'Enter' && handleSetCustom()}
                        style={{
                            flex: 1, padding: '0.75rem 1rem', border: '1px solid #D1D5DB',
                            borderRadius: '0.5rem', fontSize: '0.875rem', outline: 'none',
                        }}
                    />
                    <button
                        onClick={handleSetCustom}
                        style={{
                            padding: '0.75rem 1.5rem', background: '#16A34A', color: 'white',
                            borderRadius: '0.5rem', fontWeight: 500, border: 'none', cursor: 'pointer',
                        }}
                    >
                        Set
                    </button>
                </div>
                <p style={{ fontSize: '0.75rem', color: '#6B7280', marginTop: '0.5rem' }}>
                    Enter negative numbers to go back in time
                </p>
            </div>

            {/* Reset Button */}
            <button
                onClick={handleReset}
                style={{
                    width: '100%', padding: '0.75rem', background: '#DC2626', color: 'white',
                    borderRadius: '0.5rem', fontWeight: 500, border: 'none', cursor: 'pointer',
                    fontSize: '0.875rem',
                }}
            >
                🔄 Reset to Real Time
            </button>

            {/* Warning Note */}
            <div style={{
                background: '#FFFBEB', border: '1px solid #FDE68A', borderRadius: '0.5rem',
                padding: '1rem',
            }}>
                <p style={{ fontSize: '0.875rem', color: '#92400E', margin: 0 }}>
                    <strong>⚠️ Note:</strong> Time simulation affects all due date calculations.
                    Words that were due in the future may become due now. Refresh the page
                    after changing time to see updates.
                </p>
            </div>
        </div>
    );
};

export default TimeControls;
