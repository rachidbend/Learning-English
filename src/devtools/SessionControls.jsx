/**
 * SessionControls.jsx
 *
 * Session manipulation controls for dev testing.
 */

import React, { useState } from 'react';
import { clearProgress } from '../data/progressManager';
import { CARD_STATE } from '../data/progressSchema';
import devUtils from './devUtils';

const SessionControls = () => {
    const [message, setMessage] = useState('');
    const [randomCount, setRandomCount] = useState(10);

    const showMessage = (msg) => {
        setMessage(msg);
        setTimeout(() => setMessage(''), 3000);
    };

    const handleMakeAllDue = () => {
        const count = devUtils.makeAllWordsDue();
        showMessage(`Made ${count} words due now`);
    };

    const handleMakeRandomDue = () => {
        const count = devUtils.makeRandomWordsDue(randomCount);
        showMessage(`Made ${count} words due now`);
    };

    const handleResetLearning = () => {
        if (window.confirm('Reset all LEARNING words back to NEW?')) {
            const count = devUtils.resetWordsByState(CARD_STATE.LEARNING);
            showMessage(`Reset ${count} learning words`);
        }
    };

    const handleResetRelearning = () => {
        if (window.confirm('Reset all RELEARNING words back to NEW?')) {
            const count = devUtils.resetWordsByState(CARD_STATE.RELEARNING);
            showMessage(`Reset ${count} relearning words`);
        }
    };

    const handleResetAll = () => {
        if (window.confirm('⚠️ This will DELETE ALL progress data. Are you sure?')) {
            if (window.confirm('Really delete ALL progress? This cannot be undone.')) {
                clearProgress();
                devUtils.resetTime();
                showMessage('All progress cleared!');
            }
        }
    };

    const btnStyle = (bg, color) => ({
        width: '100%', padding: '0.75rem', background: bg, color,
        borderRadius: '0.5rem', fontWeight: 500, border: 'none',
        cursor: 'pointer', fontSize: '0.875rem', textAlign: 'left',
    });

    return (
        <div style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
            {/* Status Message */}
            {message && (
                <div style={{
                    padding: '0.75rem 1rem', background: '#D1FAE5', color: '#065F46',
                    borderRadius: '0.5rem', fontSize: '0.875rem', fontWeight: 500,
                    textAlign: 'center',
                }}>
                    ✅ {message}
                </div>
            )}

            {/* Make Words Due */}
            <div>
                <h3 className="text-lg font-semibold" style={{ marginBottom: '0.75rem' }}>
                    Make Words Due
                </h3>
                <div style={{ display: 'flex', flexDirection: 'column', gap: '0.5rem' }}>
                    <button onClick={handleMakeAllDue} style={btnStyle('#DBEAFE', '#1E3A5F')}>
                        📋 Make All Words Due Now
                        <span style={{ display: 'block', fontSize: '0.75rem', color: '#6B7280', marginTop: '0.25rem' }}>
                            Sets all non-new words to be due immediately
                        </span>
                    </button>

                    <div style={{ display: 'flex', gap: '0.5rem', alignItems: 'stretch' }}>
                        <button
                            onClick={handleMakeRandomDue}
                            style={{ ...btnStyle('#EDE9FE', '#4C1D95'), flex: 1 }}
                        >
                            🎲 Make Random Words Due
                        </button>
                        <input
                            type="number"
                            value={randomCount}
                            onChange={(e) => setRandomCount(Number(e.target.value))}
                            min={1}
                            max={30}
                            style={{
                                width: '60px', textAlign: 'center', border: '1px solid #D1D5DB',
                                borderRadius: '0.5rem', fontSize: '0.875rem',
                            }}
                        />
                    </div>
                </div>
            </div>

            {/* Reset Operations */}
            <div>
                <h3 className="text-lg font-semibold" style={{ marginBottom: '0.75rem' }}>
                    Reset Operations
                </h3>
                <div style={{ display: 'flex', flexDirection: 'column', gap: '0.5rem' }}>
                    <button onClick={handleResetLearning} style={btnStyle('#FEF3C7', '#92400E')}>
                        🔁 Reset All Learning Words → NEW
                        <span style={{ display: 'block', fontSize: '0.75rem', color: '#6B7280', marginTop: '0.25rem' }}>
                            Moves all words in LEARNING state back to unseen
                        </span>
                    </button>

                    <button onClick={handleResetRelearning} style={btnStyle('#FEF3C7', '#92400E')}>
                        🔁 Reset All Relearning Words → NEW
                        <span style={{ display: 'block', fontSize: '0.75rem', color: '#6B7280', marginTop: '0.25rem' }}>
                            Moves all words in RELEARNING state back to unseen
                        </span>
                    </button>
                </div>
            </div>

            {/* Danger Zone */}
            <div>
                <h3 style={{
                    fontSize: '1.125rem', fontWeight: 600, marginBottom: '0.75rem',
                    color: '#DC2626',
                }}>
                    ⚠️ Danger Zone
                </h3>
                <button onClick={handleResetAll} style={{
                    ...btnStyle('#FEE2E2', '#991B1B'),
                    borderLeft: '4px solid #DC2626',
                }}>
                    💣 Factory Reset — Delete Everything
                    <span style={{ display: 'block', fontSize: '0.75rem', color: '#6B7280', marginTop: '0.25rem' }}>
                        Clears all progress, stats, and time offset. Cannot be undone!
                    </span>
                </button>
            </div>
        </div>
    );
};

export default SessionControls;
