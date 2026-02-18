/**
 * WordInspector.jsx
 *
 * View and edit individual word progress.
 */

import React, { useState, useEffect } from 'react';
import { loadProgress } from '../data/progressManager';
import { loadBatch } from '../data/wordData';
import { CARD_STATE } from '../data/progressSchema';
import devUtils from './devUtils';

const stateColors = {
    [CARD_STATE.NEW]: { bg: '#F3F4F6', color: '#374151', label: 'NEW' },
    [CARD_STATE.LEARNING]: { bg: '#DBEAFE', color: '#1E40AF', label: 'LEARNING' },
    [CARD_STATE.REVIEW]: { bg: '#D1FAE5', color: '#065F46', label: 'REVIEW' },
    [CARD_STATE.RELEARNING]: { bg: '#FEF3C7', color: '#92400E', label: 'RELEARNING' },
};

const WordInspector = () => {
    const [words, setWords] = useState([]);
    const [selectedWordId, setSelectedWordId] = useState(null);
    const [wordData, setWordData] = useState(null);
    const [progress, setProgress] = useState(null);
    const [message, setMessage] = useState('');

    const refresh = () => {
        const prog = loadProgress();
        setProgress(prog);
        if (selectedWordId) {
            setWordData(prog.wordProgress[selectedWordId] || null);
        }
    };

    useEffect(() => {
        const load = async () => {
            const batch = await loadBatch(1);
            if (batch) setWords(batch.words);
            refresh();
        };
        load();
    }, []);

    useEffect(() => {
        if (selectedWordId && progress) {
            setWordData(progress.wordProgress[selectedWordId] || null);
        }
    }, [selectedWordId, progress]);

    const showMessage = (msg) => {
        setMessage(msg);
        setTimeout(() => setMessage(''), 2000);
    };

    const handleStateChange = (state) => {
        devUtils.setWordState(selectedWordId, state);
        refresh();
        showMessage(`State → ${state}`);
    };

    const handleMakeDue = () => {
        devUtils.makeWordDueNow(selectedWordId);
        refresh();
        showMessage('Word is now due!');
    };

    const handleReset = () => {
        if (window.confirm(`Reset word #${selectedWordId} to NEW state?`)) {
            devUtils.resetWord(selectedWordId);
            refresh();
            showMessage('Word reset to NEW');
        }
    };

    const selectedWord = words.find(w => w.id === selectedWordId);
    const sc = wordData ? stateColors[wordData.card_state] || stateColors[CARD_STATE.NEW] : null;

    return (
        <div style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
            {/* Word Selector */}
            <div>
                <h3 className="text-lg font-semibold" style={{ marginBottom: '0.75rem' }}>
                    Select Word
                </h3>
                <select
                    value={selectedWordId || ''}
                    onChange={(e) => setSelectedWordId(e.target.value ? Number(e.target.value) : null)}
                    style={{
                        width: '100%', padding: '0.75rem 1rem', border: '1px solid #D1D5DB',
                        borderRadius: '0.5rem', fontSize: '0.875rem', background: 'white',
                    }}
                >
                    <option value="">-- Select a word --</option>
                    {words.map(word => {
                        const wp = progress?.wordProgress[word.id];
                        const state = wp ? wp.card_state : 'untracked';
                        return (
                            <option key={word.id} value={word.id}>
                                {word.word} (#{word.id}) — {state}
                            </option>
                        );
                    })}
                </select>
            </div>

            {/* Status Message */}
            {message && (
                <div style={{
                    padding: '0.5rem 1rem', background: '#D1FAE5', color: '#065F46',
                    borderRadius: '0.5rem', fontSize: '0.875rem', fontWeight: 500,
                    textAlign: 'center',
                }}>
                    ✅ {message}
                </div>
            )}

            {/* Selected word name */}
            {selectedWord && (
                <div style={{
                    display: 'flex', alignItems: 'center', gap: '1rem',
                    padding: '0.75rem 1rem', background: '#F9FAFB', borderRadius: '0.5rem',
                }}>
                    <span style={{ fontSize: '1.5rem', fontWeight: 700 }}>{selectedWord.word}</span>
                    <span style={{ color: '#6B7280', fontSize: '0.875rem', direction: 'rtl' }}>
                        {selectedWord.translation}
                    </span>
                    {sc && (
                        <span style={{
                            marginLeft: 'auto', fontSize: '0.75rem', fontWeight: 600,
                            padding: '0.25rem 0.5rem', borderRadius: '0.25rem',
                            background: sc.bg, color: sc.color,
                        }}>
                            {sc.label}
                        </span>
                    )}
                </div>
            )}

            {/* Current State Details */}
            {wordData && (
                <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
                    <div style={{
                        background: '#F9FAFB', borderRadius: '0.5rem', padding: '1rem',
                    }}>
                        <h4 style={{ fontWeight: 600, marginBottom: '0.5rem', fontSize: '0.875rem' }}>
                            Current State
                        </h4>
                        <div style={{
                            display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '0.5rem',
                            fontSize: '0.8125rem',
                        }}>
                            {[
                                ['Confidence', `${Math.round(wordData.confidence)}%`],
                                ['Interval', `${wordData.interval || 0} days`],
                                ['Ease Factor', wordData.ease_factor?.toFixed(2) || 'N/A'],
                                ['Learning Step', wordData.learning_step ?? 'N/A'],
                                ['Times Reviewed', wordData.times_reviewed || 0],
                                ['Accuracy', wordData.times_reviewed > 0
                                    ? `${Math.round((wordData.times_correct / wordData.times_reviewed) * 100)}%`
                                    : 'N/A'],
                                ['Lapses', wordData.lapses || 0],
                                ['In First 2 Weeks', wordData.is_in_first_two_weeks ? 'Yes' : 'No'],
                            ].map(([label, value]) => (
                                <div key={label} style={{ display: 'flex', justifyContent: 'space-between' }}>
                                    <span style={{ color: '#6B7280' }}>{label}:</span>
                                    <span style={{ fontWeight: 600 }}>{value}</span>
                                </div>
                            ))}
                            <div style={{ gridColumn: '1 / -1', display: 'flex', justifyContent: 'space-between' }}>
                                <span style={{ color: '#6B7280' }}>Due Date:</span>
                                <span style={{ fontFamily: 'monospace', fontSize: '0.75rem' }}>
                                    {wordData.due_date
                                        ? new Date(wordData.due_date).toLocaleString()
                                        : 'Not scheduled'}
                                </span>
                            </div>
                        </div>
                    </div>

                    {/* Quick State Actions */}
                    <div>
                        <h4 style={{ fontWeight: 600, marginBottom: '0.5rem', fontSize: '0.875rem' }}>
                            Set State
                        </h4>
                        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '0.5rem' }}>
                            {Object.entries(stateColors).map(([state, sc]) => (
                                <button
                                    key={state}
                                    onClick={() => handleStateChange(state)}
                                    style={{
                                        padding: '0.5rem', background: sc.bg, color: sc.color,
                                        borderRadius: '0.5rem', fontSize: '0.8125rem', fontWeight: 500,
                                        border: 'none', cursor: 'pointer',
                                    }}
                                >
                                    → {sc.label}
                                </button>
                            ))}
                        </div>
                    </div>

                    {/* Action Buttons */}
                    <div style={{ display: 'flex', gap: '0.5rem' }}>
                        <button
                            onClick={handleMakeDue}
                            style={{
                                flex: 1, padding: '0.75rem', background: '#3B82F6', color: 'white',
                                borderRadius: '0.5rem', fontWeight: 500, border: 'none', cursor: 'pointer',
                                fontSize: '0.875rem',
                            }}
                        >
                            ⏰ Make Due Now
                        </button>
                        <button
                            onClick={handleReset}
                            style={{
                                flex: 1, padding: '0.75rem', background: '#DC2626', color: 'white',
                                borderRadius: '0.5rem', fontWeight: 500, border: 'none', cursor: 'pointer',
                                fontSize: '0.875rem',
                            }}
                        >
                            🗑️ Reset Word
                        </button>
                    </div>

                    {/* Raw JSON */}
                    <details style={{
                        background: '#F9FAFB', borderRadius: '0.5rem', padding: '1rem',
                    }}>
                        <summary style={{ fontWeight: 600, cursor: 'pointer', fontSize: '0.875rem' }}>
                            Raw Data (JSON)
                        </summary>
                        <pre style={{
                            fontSize: '0.6875rem', marginTop: '0.5rem', overflow: 'auto',
                            background: 'white', padding: '0.75rem', borderRadius: '0.375rem',
                            border: '1px solid #E5E7EB', maxHeight: '300px',
                        }}>
                            {JSON.stringify(wordData, null, 2)}
                        </pre>
                    </details>
                </div>
            )}
        </div>
    );
};

export default WordInspector;
