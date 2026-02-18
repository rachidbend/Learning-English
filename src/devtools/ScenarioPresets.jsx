/**
 * ScenarioPresets.jsx
 *
 * Pre-built test scenarios for quickly populating test data.
 */

import React, { useState } from 'react';
import devUtils from './devUtils';

const scenarios = [
    {
        id: 'mixed',
        icon: '🎨',
        title: 'Generate Mixed Test Data',
        description: '30 words across all states: 10 review (5 due), 5 learning, 5 new, 10 advanced review.',
        action: devUtils.generateTestData,
        color: { bg: '#DBEAFE', text: '#1E3A5F', accent: '#3B82F6' },
    },
    {
        id: 'good',
        icon: '🌟',
        title: 'Simulate Good Learner',
        description: '20 words with high accuracy (90%+), steady intervals, minimal lapses.',
        action: devUtils.simulateGoodLearner,
        color: { bg: '#D1FAE5', text: '#065F46', accent: '#10B981' },
    },
    {
        id: 'struggling',
        icon: '😰',
        title: 'Simulate Struggling Learner',
        description: '20 words with low accuracy (50%), short intervals, many lapses, low ease.',
        action: devUtils.simulateStrugglingLearner,
        color: { bg: '#FEE2E2', text: '#991B1B', accent: '#EF4444' },
    },
    {
        id: 'inactive',
        icon: '😴',
        title: 'Simulate 2-Week Inactivity',
        description: 'Sets all existing tracked words as 14 days overdue.',
        action: devUtils.simulateInactive2Weeks,
        color: { bg: '#FEF3C7', text: '#92400E', accent: '#F59E0B' },
    },
];

const ScenarioPresets = () => {
    const [message, setMessage] = useState('');
    const [stats, setStats] = useState(null);

    const showMessage = (msg) => {
        setMessage(msg);
        setTimeout(() => setMessage(''), 3000);
    };

    const handleRun = (scenario) => {
        const count = scenario.action();
        setStats(devUtils.getProgressStats());
        showMessage(`${scenario.title}: ${count} words affected`);
    };

    const refreshStats = () => {
        setStats(devUtils.getProgressStats());
    };

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

            <div>
                <h3 className="text-lg font-semibold" style={{ marginBottom: '0.75rem' }}>
                    Test Scenarios
                </h3>
                <p style={{ fontSize: '0.875rem', color: '#6B7280', marginBottom: '1rem' }}>
                    Click a scenario to populate progress data for testing. These modify existing word data.
                </p>

                <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem' }}>
                    {scenarios.map(scenario => (
                        <button
                            key={scenario.id}
                            onClick={() => handleRun(scenario)}
                            style={{
                                width: '100%', padding: '1rem', background: scenario.color.bg,
                                borderRadius: '0.75rem', border: `2px solid transparent`,
                                cursor: 'pointer', textAlign: 'left',
                                transition: 'border-color 0.2s',
                            }}
                            onMouseEnter={(e) => e.target.style.borderColor = scenario.color.accent}
                            onMouseLeave={(e) => e.target.style.borderColor = 'transparent'}
                        >
                            <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                                <span style={{ fontSize: '1.5rem' }}>{scenario.icon}</span>
                                <div>
                                    <div style={{
                                        fontWeight: 600, color: scenario.color.text,
                                        fontSize: '0.9375rem',
                                    }}>
                                        {scenario.title}
                                    </div>
                                    <div style={{ fontSize: '0.8125rem', color: '#6B7280', marginTop: '0.25rem' }}>
                                        {scenario.description}
                                    </div>
                                </div>
                            </div>
                        </button>
                    ))}
                </div>
            </div>

            {/* Stats After Running */}
            {stats && (
                <div style={{
                    background: '#F9FAFB', borderRadius: '0.75rem', padding: '1rem',
                }}>
                    <div style={{
                        display: 'flex', justifyContent: 'space-between', alignItems: 'center',
                        marginBottom: '0.75rem',
                    }}>
                        <h4 style={{ fontWeight: 600, fontSize: '0.9375rem' }}>Current Stats</h4>
                        <button
                            onClick={refreshStats}
                            style={{
                                fontSize: '0.75rem', padding: '0.25rem 0.5rem', background: '#E5E7EB',
                                border: 'none', borderRadius: '0.25rem', cursor: 'pointer',
                            }}
                        >
                            🔄 Refresh
                        </button>
                    </div>
                    <div style={{
                        display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)',
                        gap: '0.5rem', fontSize: '0.8125rem',
                    }}>
                        {[
                            { label: 'Total', value: stats.total_words, color: '#374151' },
                            { label: 'New', value: stats.by_state.new, color: '#6B7280' },
                            { label: 'Learning', value: stats.by_state.learning, color: '#2563EB' },
                            { label: 'Review', value: stats.by_state.review, color: '#059669' },
                            { label: 'Relearning', value: stats.by_state.relearning, color: '#D97706' },
                            { label: 'Due Now', value: stats.due_now, color: '#DC2626' },
                        ].map(s => (
                            <div key={s.label} style={{
                                textAlign: 'center', padding: '0.5rem', background: 'white',
                                borderRadius: '0.375rem',
                            }}>
                                <div style={{ fontWeight: 700, fontSize: '1.25rem', color: s.color }}>
                                    {s.value}
                                </div>
                                <div style={{ color: '#6B7280', fontSize: '0.75rem' }}>{s.label}</div>
                            </div>
                        ))}
                    </div>
                </div>
            )}
        </div>
    );
};

export default ScenarioPresets;
