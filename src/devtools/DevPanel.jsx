/**
 * DevPanel.jsx
 *
 * Main developer tools panel.
 * Only rendered in development mode via Vite's import.meta.env.DEV.
 * Activated by ?dev=true URL param or Ctrl+Shift+D keyboard shortcut.
 */

import React, { useState, useEffect, useRef } from 'react';
import TimeControls from './TimeControls';
import WordInspector from './WordInspector';
import SessionControls from './SessionControls';
import ScenarioPresets from './ScenarioPresets';
import devUtils from './devUtils';
import { exportProgress, importProgress } from '../data/progressManager';

const TABS = [
    { id: 'time', label: '⏱️ Time' },
    { id: 'words', label: '📝 Words' },
    { id: 'session', label: '🎯 Session' },
    { id: 'scenarios', label: '🎭 Scenarios' },
    { id: 'data', label: '💾 Data' },
];

const DevPanel = () => {
    // TODO: UNCOMMENT THE GUARD BELOW BEFORE FINAL PRODUCTION RELEASE!
    // Temporarily disabled to allow testing on Vercel via phone.
    // if (!import.meta.env.DEV) {
    //     return null;
    // }

    const [isOpen, setIsOpen] = useState(false);
    const [activeTab, setActiveTab] = useState('time');
    const panelRef = useRef(null);

    // Check for activation
    useEffect(() => {
        // Check URL param
        const params = new URLSearchParams(window.location.search);
        if (params.get('dev') === 'true') {
            setIsOpen(true);
            sessionStorage.setItem('dev_panel_active', 'true');
        }

        // Check sessionStorage
        if (sessionStorage.getItem('dev_panel_active') === 'true') {
            setIsOpen(true);
        }

        // Keyboard shortcut: Ctrl+Shift+D (Cmd+Shift+D on Mac)
        const handleKeyDown = (e) => {
            if ((e.ctrlKey || e.metaKey) && e.shiftKey && e.key === 'D') {
                e.preventDefault();
                setIsOpen(prev => {
                    const newState = !prev;
                    sessionStorage.setItem('dev_panel_active', newState ? 'true' : 'false');
                    return newState;
                });
            }
        };

        window.addEventListener('keydown', handleKeyDown);
        return () => window.removeEventListener('keydown', handleKeyDown);
    }, []);

    const handleClose = () => {
        setIsOpen(false);
        sessionStorage.setItem('dev_panel_active', 'false');
    };

    if (!isOpen) {
        return null;
    }

    return (
        <div
            style={{
                position: 'fixed', inset: 0, background: 'rgba(0,0,0,0.5)',
                zIndex: 9999, display: 'flex', alignItems: 'center',
                justifyContent: 'center', padding: '1rem',
            }}
            onClick={(e) => {
                if (e.target === e.currentTarget) handleClose();
            }}
        >
            <div
                ref={panelRef}
                style={{
                    background: 'white', borderRadius: '1rem',
                    boxShadow: '0 25px 50px -12px rgba(0,0,0,0.25)',
                    width: '100%', maxWidth: '56rem',
                    maxHeight: '90vh', display: 'flex', flexDirection: 'column',
                    overflow: 'hidden',
                }}
            >
                {/* Header */}
                <div style={{
                    background: '#111827', color: 'white', padding: '1rem 1.5rem',
                    display: 'flex', alignItems: 'center', justifyContent: 'space-between',
                    borderRadius: '1rem 1rem 0 0', flexShrink: 0,
                }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                        <div style={{
                            width: '0.75rem', height: '0.75rem', background: '#EF4444',
                            borderRadius: '50%',
                        }} />
                        <div style={{
                            width: '0.75rem', height: '0.75rem', background: '#F59E0B',
                            borderRadius: '50%',
                        }} />
                        <div style={{
                            width: '0.75rem', height: '0.75rem', background: '#22C55E',
                            borderRadius: '50%',
                        }} />
                        <h2 style={{ fontSize: '1.125rem', fontWeight: 700, marginLeft: '0.5rem' }}>
                            🛠️ Developer Tools
                        </h2>
                    </div>

                    <button
                        onClick={handleClose}
                        style={{
                            color: 'rgba(255,255,255,0.7)', background: 'transparent',
                            border: 'none', cursor: 'pointer', fontSize: '1.5rem',
                            lineHeight: 1, padding: '0.25rem',
                        }}
                        onMouseEnter={(e) => e.target.style.color = 'white'}
                        onMouseLeave={(e) => e.target.style.color = 'rgba(255,255,255,0.7)'}
                    >
                        ✕
                    </button>
                </div>

                {/* Tabs */}
                <div style={{
                    borderBottom: '1px solid #E5E7EB', background: '#F9FAFB',
                    padding: '0 1rem', flexShrink: 0, overflowX: 'auto',
                }}>
                    <nav style={{ display: 'flex', gap: '0.25rem' }}>
                        {TABS.map(tab => (
                            <button
                                key={tab.id}
                                onClick={() => setActiveTab(tab.id)}
                                style={{
                                    padding: '0.75rem 1rem', fontSize: '0.875rem', fontWeight: 500,
                                    borderBottom: `3px solid ${activeTab === tab.id ? '#3B82F6' : 'transparent'}`,
                                    color: activeTab === tab.id ? '#3B82F6' : '#6B7280',
                                    background: 'transparent', border: 'none',
                                    borderBottomStyle: 'solid',
                                    borderBottomWidth: '3px',
                                    borderBottomColor: activeTab === tab.id ? '#3B82F6' : 'transparent',
                                    cursor: 'pointer', whiteSpace: 'nowrap',
                                    transition: 'color 0.15s',
                                }}
                            >
                                {tab.label}
                            </button>
                        ))}
                    </nav>
                </div>

                {/* Content */}
                <div style={{
                    flex: 1, overflowY: 'auto', padding: '1.5rem',
                    minHeight: 0,
                }}>
                    {activeTab === 'time' && <TimeControls />}
                    {activeTab === 'words' && <WordInspector />}
                    {activeTab === 'session' && <SessionControls />}
                    {activeTab === 'scenarios' && <ScenarioPresets />}
                    {activeTab === 'data' && <DataInspector />}
                </div>

                {/* Footer */}
                <div style={{
                    borderTop: '1px solid #E5E7EB', padding: '0.75rem',
                    background: '#F9FAFB', borderRadius: '0 0 1rem 1rem',
                    flexShrink: 0,
                }}>
                    <p style={{
                        fontSize: '0.75rem', color: '#9CA3AF', textAlign: 'center',
                        margin: 0,
                    }}>
                        Developer Tools • <kbd style={{
                            background: '#E5E7EB', padding: '0.125rem 0.375rem',
                            borderRadius: '0.25rem', fontSize: '0.6875rem',
                        }}>Ctrl+Shift+D</kbd> to toggle • Only available in development mode
                    </p>
                </div>
            </div>
        </div>
    );
};

// ═══════════════════════════════════════════
// DATA INSPECTOR TAB (inline component)
// ═══════════════════════════════════════════

const DataInspector = () => {
    const [stats, setStats] = useState(null);
    const [validation, setValidation] = useState(null);

    useEffect(() => {
        refreshData();
    }, []);

    const refreshData = () => {
        setStats(devUtils.getProgressStats());
        setValidation(devUtils.validateProgress());
    };

    const handleExport = () => {
        devUtils.handleExportProgress();
    };

    const handleImport = () => {
        const input = document.createElement('input');
        input.type = 'file';
        input.accept = '.json';
        input.onchange = async (e) => {
            const file = e.target.files[0];
            if (!file) return;
            const success = await devUtils.handleImportProgress(file);
            alert(success ? 'Import successful! Page will reload.' : 'Import failed!');
            if (success) window.location.reload();
        };
        input.click();
    };

    return (
        <div style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
            {/* Progress Statistics */}
            <div>
                <div style={{
                    display: 'flex', justifyContent: 'space-between', alignItems: 'center',
                    marginBottom: '0.75rem',
                }}>
                    <h3 style={{ fontSize: '1.125rem', fontWeight: 600 }}>Progress Statistics</h3>
                    <button
                        onClick={refreshData}
                        style={{
                            fontSize: '0.75rem', padding: '0.25rem 0.75rem', background: '#E5E7EB',
                            border: 'none', borderRadius: '0.25rem', cursor: 'pointer',
                        }}
                    >
                        🔄 Refresh
                    </button>
                </div>
                {stats && (
                    <div style={{
                        background: '#F9FAFB', borderRadius: '0.75rem', padding: '1rem',
                        fontFamily: 'monospace', fontSize: '0.875rem',
                        display: 'flex', flexDirection: 'column', gap: '0.375rem',
                    }}>
                        {[
                            ['Total words', stats.total_words, '#374151'],
                            ['New', stats.by_state.new, '#6B7280'],
                            ['Learning', stats.by_state.learning, '#2563EB'],
                            ['Review', stats.by_state.review, '#059669'],
                            ['Relearning', stats.by_state.relearning, '#D97706'],
                        ].map(([label, value, color]) => (
                            <div key={label} style={{ display: 'flex', justifyContent: 'space-between' }}>
                                <span>{label}:</span>
                                <span style={{ fontWeight: 600, color }}>{value}</span>
                            </div>
                        ))}
                        <hr style={{ border: 'none', borderTop: '1px solid #E5E7EB', margin: '0.25rem 0' }} />
                        {[
                            ['Due now', stats.due_now, '#DC2626'],
                            ['Avg confidence', `${stats.avg_confidence}%`, '#374151'],
                            ['Avg interval', `${stats.avg_interval} days`, '#374151'],
                            ['Time offset', `${stats.time_offset > 0 ? '+' : ''}${stats.time_offset} days`, '#D97706'],
                        ].map(([label, value, color]) => (
                            <div key={label} style={{ display: 'flex', justifyContent: 'space-between' }}>
                                <span>{label}:</span>
                                <span style={{ fontWeight: 600, color }}>{value}</span>
                            </div>
                        ))}
                    </div>
                )}
            </div>

            {/* Data Validation */}
            <div>
                <h3 style={{ fontSize: '1.125rem', fontWeight: 600, marginBottom: '0.75rem' }}>
                    Data Validation
                </h3>
                {validation && (
                    <div style={{
                        borderRadius: '0.5rem', padding: '1rem',
                        background: validation.valid ? '#D1FAE5' : '#FEE2E2',
                    }}>
                        {validation.valid ? (
                            <div style={{
                                display: 'flex', alignItems: 'center', gap: '0.5rem',
                                color: '#065F46', fontWeight: 500,
                            }}>
                                ✅ All data valid
                            </div>
                        ) : (
                            <div>
                                <div style={{
                                    display: 'flex', alignItems: 'center', gap: '0.5rem',
                                    color: '#991B1B', fontWeight: 500, marginBottom: '0.5rem',
                                }}>
                                    ❌ {validation.issues.length} issues found
                                </div>
                                <ul style={{
                                    fontSize: '0.75rem', color: '#991B1B', paddingLeft: '1.5rem',
                                    margin: 0,
                                }}>
                                    {validation.issues.map((issue, i) => (
                                        <li key={i} style={{ marginBottom: '0.25rem' }}>{issue}</li>
                                    ))}
                                </ul>
                            </div>
                        )}
                    </div>
                )}
            </div>

            {/* Export / Import */}
            <div>
                <h3 style={{ fontSize: '1.125rem', fontWeight: 600, marginBottom: '0.75rem' }}>
                    Export / Import
                </h3>
                <div style={{ display: 'flex', gap: '0.75rem' }}>
                    <button
                        onClick={handleExport}
                        style={{
                            flex: 1, padding: '0.75rem', background: '#2563EB', color: 'white',
                            borderRadius: '0.5rem', fontWeight: 500, border: 'none',
                            cursor: 'pointer', fontSize: '0.875rem',
                        }}
                    >
                        📥 Export Progress
                    </button>
                    <button
                        onClick={handleImport}
                        style={{
                            flex: 1, padding: '0.75rem', background: '#7C3AED', color: 'white',
                            borderRadius: '0.5rem', fontWeight: 500, border: 'none',
                            cursor: 'pointer', fontSize: '0.875rem',
                        }}
                    >
                        📤 Import Progress
                    </button>
                </div>
            </div>

            {/* Raw JSON Viewer */}
            <details style={{
                background: '#F9FAFB', borderRadius: '0.5rem', padding: '1rem',
            }}>
                <summary style={{ fontWeight: 600, cursor: 'pointer', fontSize: '0.875rem' }}>
                    View Raw Progress JSON
                </summary>
                <pre style={{
                    fontSize: '0.625rem', marginTop: '0.5rem', overflow: 'auto',
                    background: 'white', padding: '0.75rem', borderRadius: '0.375rem',
                    border: '1px solid #E5E7EB', maxHeight: '400px',
                }}>
                    {exportProgress() || '{}'}
                </pre>
            </details>
        </div>
    );
};

export default DevPanel;
