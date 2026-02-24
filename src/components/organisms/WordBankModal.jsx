/**
 * WordBankModal.jsx — Full-screen modal with filterable, searchable word list
 *
 * Reuses WordDefinitionSheet from Phase 4.
 */

import React, { useState, useMemo, useCallback, useRef, useEffect } from 'react';
import { motion } from 'framer-motion';
import { duration, easing, prefersReducedMotion } from '../../styles/motion';
import WordDefinitionSheet from '../molecules/WordDefinitionSheet';
import { analytics } from '../../analytics/events';

const TABS = ['Mastered', 'Learning', 'New'];

export default function WordBankModal({ isOpen, onClose, masteredWords, learningWords, newWords, allWords }) {
    const [activeTab, setActiveTab] = useState(0);
    const [search, setSearch] = useState('');
    const [sheetWord, setSheetWord] = useState(null);
    const searchTimer = useRef(null);
    const reduced = prefersReducedMotion();

    const tabData = [masteredWords || [], learningWords || [], newWords || []];
    const tabCounts = tabData.map((arr) => arr.length);

    // Filtered list with useMemo
    const filteredWords = useMemo(() => {
        const list = tabData[activeTab];
        if (!search.trim()) return list;
        const q = search.toLowerCase().trim();
        return list.filter((w) =>
            w.word.toLowerCase().includes(q) ||
            (w.word_ar && w.word_ar.includes(q))
        );
    }, [activeTab, search, tabData]);

    // Debounced search analytics
    const handleSearchChange = useCallback((val) => {
        setSearch(val);
        if (searchTimer.current) clearTimeout(searchTimer.current);
        searchTimer.current = setTimeout(() => {
            if (val.trim()) {
                analytics.track('word_bank_searched', { result_count: filteredWords.length });
            }
        }, 500);
    }, [filteredWords.length]);

    useEffect(() => {
        return () => { if (searchTimer.current) clearTimeout(searchTimer.current); };
    }, []);

    const handleWordTap = useCallback((word) => {
        const state = activeTab === 0 ? 'mastered' : activeTab === 1 ? 'learning' : 'new';
        analytics.track('word_bank_word_tapped', { word_id: word.id, word_state: state });
        setSheetWord(word);
    }, [activeTab]);

    if (!isOpen) return null;

    return (
        <>
            <motion.div
                initial={reduced ? { opacity: 0 } : { y: '100%' }}
                animate={reduced ? { opacity: 1 } : { y: 0 }}
                exit={reduced ? { opacity: 0 } : { y: '100%' }}
                transition={{ duration: duration.normal, ease: easing.decelerate }}
                style={{
                    position: 'fixed', inset: 0, zIndex: 80,
                    backgroundColor: 'var(--color-bg-primary)', display: 'flex', flexDirection: 'column',
                }}
            >
                {/* Header */}
                <div style={{ padding: '16px 20px', borderBottom: '1px solid var(--color-border-subtle)' }}>
                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                        <div>
                            <h2 style={{ fontSize: 'var(--text-xl)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-text-primary)', margin: 0 }}>Word Bank</h2>
                            <p style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-muted)', marginTop: '2px' }}>{(allWords || []).length} words encountered</p>
                        </div>
                        <button onClick={onClose} style={{ background: 'none', border: 'none', cursor: 'pointer', padding: '8px', color: 'var(--color-text-muted)' }}>
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round">
                                <line x1="18" y1="6" x2="6" y2="18" /><line x1="6" y1="6" x2="18" y2="18" />
                            </svg>
                        </button>
                    </div>
                </div>

                {/* Filter tabs */}
                <div style={{ display: 'flex', borderBottom: '1px solid var(--color-border-subtle)' }}>
                    {TABS.map((tab, i) => (
                        <button key={tab} onClick={() => setActiveTab(i)}
                            style={{
                                flex: 1, padding: '12px 0', background: 'none', border: 'none', cursor: 'pointer',
                                fontSize: 'var(--text-sm)', fontWeight: activeTab === i ? 'var(--font-weight-bold)' : 400,
                                color: activeTab === i ? 'var(--color-accent-primary)' : 'var(--color-text-secondary)',
                                borderBottom: activeTab === i ? '2px solid var(--color-accent-primary)' : '2px solid transparent',
                            }}>
                            {tab} <span style={{ fontSize: '0.625rem', opacity: 0.7 }}>({tabCounts[i]})</span>
                        </button>
                    ))}
                </div>

                {/* Search */}
                <div style={{ padding: '12px 16px', position: 'relative' }}>
                    <input
                        type="text" value={search} onChange={(e) => handleSearchChange(e.target.value)}
                        placeholder="Search words..."
                        style={{
                            width: '100%', padding: '10px 36px 10px 12px', borderRadius: 'var(--radius-lg)',
                            border: '1px solid var(--color-border-subtle)', backgroundColor: 'var(--color-bg-secondary)',
                            color: 'var(--color-text-primary)', fontSize: 'var(--text-sm)', outline: 'none',
                        }}
                    />
                    {search && (
                        <button onClick={() => setSearch('')} style={{
                            position: 'absolute', right: '24px', top: '50%', transform: 'translateY(-50%)',
                            background: 'none', border: 'none', cursor: 'pointer', color: 'var(--color-text-muted)', padding: '4px',
                        }}>✕</button>
                    )}
                </div>

                {/* Word list */}
                <div style={{ flex: 1, overflow: 'auto', padding: '0 16px' }}>
                    {filteredWords.length === 0 ? (
                        <p style={{ textAlign: 'center', color: 'var(--color-text-muted)', padding: '32px 0', fontSize: 'var(--text-sm)' }}>
                            {search ? `No words found for "${search}"` : 'No words in this category yet'}
                        </p>
                    ) : (
                        filteredWords.map((word) => (
                            <button key={word.id} onClick={() => handleWordTap(word)}
                                style={{
                                    display: 'flex', alignItems: 'center', width: '100%', padding: '12px 4px',
                                    borderBottom: '1px solid var(--color-border-subtle)', background: 'none', border: 'none',
                                    borderBottomWidth: '1px', borderBottomStyle: 'solid', borderBottomColor: 'var(--color-border-subtle)',
                                    cursor: 'pointer', textAlign: 'left',
                                }}>
                                <span style={{ flex: 1, fontSize: 'var(--text-sm)', fontWeight: 'var(--font-weight-semibold)', color: 'var(--color-text-primary)' }}>
                                    {word.word}
                                </span>
                                <span style={{ fontSize: 'var(--text-sm)', color: 'var(--color-text-secondary)', fontFamily: 'var(--font-arabic)', direction: 'rtl' }}>
                                    {word.word_ar}
                                </span>
                                <div style={{
                                    width: '8px', height: '8px', borderRadius: '50%', marginLeft: '12px',
                                    backgroundColor: activeTab === 0 ? 'var(--color-accent-primary)' : activeTab === 1 ? 'var(--color-accent-blue)' : 'var(--color-text-muted)',
                                }} />
                            </button>
                        ))
                    )}
                </div>
            </motion.div>

            <WordDefinitionSheet word={sheetWord} isOpen={!!sheetWord} onClose={() => setSheetWord(null)} />
        </>
    );
}
