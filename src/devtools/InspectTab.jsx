/**
 * InspectTab.jsx — DevTools "Inspect" tab
 *
 * UID display, localStorage usage, session log viewer,
 * stories progress viewer, build info.
 */

import React, { useState, useEffect, useRef } from 'react';
import vocabularyData from '../data/vocabulary_data.json';

const s = {
    section: { marginBottom: '1.5rem' },
    heading: { fontSize: '0.875rem', fontWeight: 700, color: '#111827', marginBottom: '0.5rem', textTransform: 'uppercase', letterSpacing: '0.04em' },
    mono: { fontFamily: 'monospace', fontSize: '0.75rem' },
    chip: { display: 'inline-block', padding: '0.25rem 0.5rem', borderRadius: '0.25rem', fontSize: '0.75rem', fontWeight: 600, marginRight: '0.5rem' },
    btn: { padding: '0.375rem 0.75rem', fontSize: '0.75rem', border: '1px solid #D1D5DB', borderRadius: '0.375rem', cursor: 'pointer', background: '#F9FAFB', fontWeight: 500 },
    btnDanger: { padding: '0.375rem 0.75rem', fontSize: '0.75rem', border: '1px solid #FCA5A5', borderRadius: '0.375rem', cursor: 'pointer', background: '#FEE2E2', color: '#991B1B', fontWeight: 500 },
    kv: { display: 'flex', justifyContent: 'space-between', padding: '0.25rem 0', fontSize: '0.8125rem', borderBottom: '1px solid #F3F4F6' },
};

export default function InspectTab() {
    const [copyLabel, setCopyLabel] = useState('Copy');
    const [sessionLog, setSessionLog] = useState([]);
    const [storiesProgress, setStoriesProgress] = useState(null);
    const [clearSessionConfirm, setClearSessionConfirm] = useState(false);
    const [clearStoriesConfirm, setClearStoriesConfirm] = useState(false);
    const [simMsg, setSimMsg] = useState('');
    const timerRef = useRef(null);

    useEffect(() => { refresh(); }, []);

    function refresh() {
        try { setSessionLog(JSON.parse(localStorage.getItem('session_log') || '[]')); } catch { setSessionLog([]); }
        try { setStoriesProgress(JSON.parse(localStorage.getItem('stories_progress') || 'null')); } catch { setStoriesProgress(null); }
    }

    // ── UID ──
    const uid = localStorage.getItem('app_uid') || 'Not generated';
    const uidCreated = localStorage.getItem('app_uid_created') || 'Unknown';
    function handleCopy() {
        navigator.clipboard.writeText(uid).then(() => {
            setCopyLabel('Copied ✓');
            setTimeout(() => setCopyLabel('Copy'), 1500);
        });
    }

    // ── localStorage usage ──
    const lsUsedKB = Math.round((JSON.stringify(localStorage).length / 1024) * 10) / 10;
    const lsLimitKB = 5000;
    const lsPct = Math.min((lsUsedKB / lsLimitKB) * 100, 100);

    // ── Session position ──
    let sessionPos = null;
    try { sessionPos = JSON.parse(localStorage.getItem('last_session_position') || 'null'); } catch { /* */ }

    // ── Helpers ──
    function handleClearSession() {
        if (!clearSessionConfirm) { setClearSessionConfirm(true); if (timerRef.current) clearTimeout(timerRef.current); timerRef.current = setTimeout(() => setClearSessionConfirm(false), 3000); return; }
        localStorage.removeItem('session_log');
        localStorage.setItem('streak_count', '0');
        setClearSessionConfirm(false);
        refresh();
    }

    function handleClearStories() {
        if (!clearStoriesConfirm) { setClearStoriesConfirm(true); if (timerRef.current) clearTimeout(timerRef.current); timerRef.current = setTimeout(() => setClearStoriesConfirm(false), 3000); return; }
        localStorage.removeItem('stories_progress');
        setClearStoriesConfirm(false);
        refresh();
    }

    function handleSimulateSession() {
        const log = JSON.parse(localStorage.getItem('session_log') || '[]');
        log.push({ date: new Date().toISOString(), type: 'learning', wordsLearned: 5, wordCount: 5 });
        localStorage.setItem('session_log', JSON.stringify(log));
        setSimMsg('Session entry added for today');
        setTimeout(() => setSimMsg(''), 2000);
        refresh();
    }

    const fmtDate = (iso) => { try { return new Date(iso).toLocaleString(); } catch { return iso; } };

    return (
        <div>
            {/* UID */}
            <div style={s.section}>
                <h3 style={s.heading}>Anonymous UID</h3>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', background: '#F9FAFB', padding: '0.5rem 0.75rem', borderRadius: '0.375rem' }}>
                    <span style={{ ...s.mono, flex: 1, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>{uid}</span>
                    <button onClick={handleCopy} style={{ ...s.btn, flexShrink: 0, minWidth: '60px' }}>{copyLabel}</button>
                </div>
            </div>

            {/* localStorage Usage */}
            <div style={s.section}>
                <h3 style={s.heading}>localStorage Usage</h3>
                <div style={{ background: '#E5E7EB', borderRadius: '0.25rem', height: '8px', overflow: 'hidden' }}>
                    <div style={{ width: `${lsPct}%`, height: '100%', background: lsPct > 80 ? '#DC2626' : '#3B82F6', transition: 'width 0.3s' }} />
                </div>
                <p style={{ ...s.mono, color: '#6B7280', marginTop: '0.25rem' }}>{lsUsedKB} KB / {lsLimitKB} KB ({lsPct.toFixed(1)}%)</p>
            </div>

            <hr style={{ border: 'none', borderTop: '1px solid #E5E7EB', margin: '1rem 0' }} />

            {/* Session Log */}
            <div style={s.section}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '0.5rem' }}>
                    <h3 style={{ ...s.heading, margin: 0 }}>Session Log (last 10)</h3>
                    <div style={{ display: 'flex', gap: '0.5rem' }}>
                        <button onClick={handleSimulateSession} style={s.btn}>+ Fake Session</button>
                        <button onClick={handleClearSession} style={clearSessionConfirm ? s.btnDanger : s.btn}>
                            {clearSessionConfirm ? 'Confirm Clear' : 'Clear Log'}
                        </button>
                    </div>
                </div>
                {simMsg && <p style={{ fontSize: '0.75rem', color: '#059669', marginBottom: '0.5rem' }}>✅ {simMsg}</p>}
                {sessionLog.length === 0 ? (
                    <p style={{ fontSize: '0.8125rem', color: '#9CA3AF', fontStyle: 'italic' }}>No sessions recorded yet</p>
                ) : (
                    <div style={{ background: '#F9FAFB', borderRadius: '0.375rem', padding: '0.5rem 0.75rem' }}>
                        {sessionLog.slice(-10).reverse().map((entry, i) => (
                            <div key={i} style={s.kv}>
                                <span>{fmtDate(entry.date)}</span>
                                <span style={s.mono}>{entry.type || 'learning'} · {entry.wordsLearned || entry.wordCount || '?'} words</span>
                            </div>
                        ))}
                    </div>
                )}
            </div>

            {/* Stories Progress */}
            <div style={s.section}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '0.5rem' }}>
                    <h3 style={{ ...s.heading, margin: 0 }}>Stories Progress</h3>
                    <button onClick={handleClearStories} style={clearStoriesConfirm ? s.btnDanger : s.btn}>
                        {clearStoriesConfirm ? 'Confirm Clear' : 'Clear Stories'}
                    </button>
                </div>
                {!storiesProgress || Object.keys(storiesProgress).length === 0 ? (
                    <p style={{ fontSize: '0.8125rem', color: '#9CA3AF', fontStyle: 'italic' }}>No stories started yet</p>
                ) : (
                    <div style={{ background: '#F9FAFB', borderRadius: '0.375rem', padding: '0.5rem 0.75rem' }}>
                        {Object.entries(storiesProgress).map(([id, data]) => (
                            <div key={id} style={s.kv}>
                                <span>Story {id}</span>
                                <span>{data.read ? '✓ Read' : '✗ Unread'}{data.quizScore != null ? ` · Score: ${data.quizScore}` : ''}</span>
                            </div>
                        ))}
                    </div>
                )}
            </div>

            <hr style={{ border: 'none', borderTop: '1px solid #E5E7EB', margin: '1rem 0' }} />

            {/* Build Info */}
            <div style={s.section}>
                <h3 style={s.heading}>Build Info</h3>
                <div style={{ background: '#F9FAFB', borderRadius: '0.375rem', padding: '0.5rem 0.75rem' }}>
                    {[
                        ['App Version', '1.0.0 (Beta)'],
                        ['Environment', import.meta.env.MODE],
                        ['Total Words', vocabularyData.words?.length || 0],
                        ['Current Level', sessionPos?.level_id || 'Unknown'],
                        ['Current Batch', sessionPos?.batch_id || 'Unknown'],
                        ['UID Created', uidCreated !== 'Unknown' ? fmtDate(uidCreated) : 'Unknown'],
                    ].map(([k, v]) => (
                        <div key={k} style={s.kv}>
                            <span style={{ color: '#6B7280' }}>{k}:</span>
                            <span style={{ ...s.mono, fontWeight: 600 }}>{String(v)}</span>
                        </div>
                    ))}
                </div>
            </div>
        </div>
    );
}
