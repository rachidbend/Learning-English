/**
 * LearnPage.jsx — Learn tab page assembling all Phase 2 components
 *
 * Manages active session state: default shows learn tab content,
 * when session starts renders LearningSession as overlay.
 * Under 150 lines — all logic lives in useLearningProgress.
 */

import React, { useState, useCallback } from 'react';
import { useLearningProgress } from '../hooks/useLearningProgress';
import { loadProgress } from '../data/progressManager';
import { analytics } from '../analytics/events';
import { EVENTS } from '../constants/analyticsEvents';

import LearnHero from '../components/organisms/LearnHero';
import ReviewNudgeBanner from '../components/molecules/ReviewNudgeBanner';
import SessionLauncher from '../components/organisms/SessionLauncher';
import BatchGrid from '../components/organisms/BatchGrid';
import GrammarHubCard from '../components/molecules/GrammarHubCard';
import CurriculumCard from '../components/molecules/CurriculumCard';
import LearningSession from '../components/organisms/LearningSession';

export default function LearnPage({ onSwitchTab }) {
    const {
        isLoading,
        currentBatch,
        batches,
        dueWordsCount,
        wordsForCloud,
        allWords,
        getBatchProgress,
        getSessionWords,
        refreshProgress,
        saveSessionPosition,
    } = useLearningProgress();

    const [activeSession, setActiveSession] = useState(false);
    const [toastMsg, setToastMsg] = useState(null);

    // Start a learning session
    const handleStartSession = useCallback(
        (count) => {
            if (!currentBatch) return;
            const words = getSessionWords(currentBatch.batch_id, count);
            if (words.length === 0) return;

            analytics.track(EVENTS.LEARNING_SESSION_STARTED, {
                batch_id: currentBatch.batch_id,
                word_count: words.length,
            });
            saveSessionPosition(currentBatch.level_id || 'beginner_1', currentBatch.batch_id);
            setActiveSession(true);
        },
        [currentBatch, getSessionWords, saveSessionPosition]
    );

    // Return from session
    const handleSessionComplete = useCallback(() => {
        setActiveSession(false);
        refreshProgress();
    }, [refreshProgress]);

    // Toast helper
    const showToast = useCallback((msg) => {
        setToastMsg(msg);
        setTimeout(() => setToastMsg(null), 2000);
    }, []);

    // Loading state
    if (isLoading) {
        return (
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', minHeight: '60vh' }}>
                <div style={{ width: 40, height: 40, border: '3px solid var(--color-border-subtle)', borderTopColor: 'var(--color-accent-blue)', borderRadius: '50%', animation: 'spin 0.8s linear infinite' }} />
                <style>{`@keyframes spin { to { transform: rotate(360deg) } }`}</style>
            </div>
        );
    }

    // Active session overlay
    if (activeSession) {
        return <LearningSessionWrapper onComplete={handleSessionComplete} />;
    }

    const batchProgress = currentBatch ? getBatchProgress(currentBatch.batch_id) : null;
    const progress = loadProgress();

    return (
        <div style={{ maxWidth: '480px', margin: '0 auto' }}>
            <LearnHero
                currentBatch={currentBatch}
                wordsForCloud={wordsForCloud}
                totalMastered={batchProgress?.mastered || 0}
                totalWords={batchProgress?.total || 0}
            />

            <div style={{ padding: '16px', display: 'flex', flexDirection: 'column', gap: '16px' }}>
                <ReviewNudgeBanner dueCount={dueWordsCount} onReviewTap={() => onSwitchTab?.('review')} />
                <SessionLauncher currentBatch={currentBatch} batchProgress={batchProgress} onStartSession={handleStartSession} />
                <BatchGrid
                    batches={batches}
                    currentBatchId={currentBatch?.batch_id}
                    onBatchSelect={(id) => showToast('Batch selection coming soon')}
                    allWords={allWords}
                    progress={progress}
                />
                <GrammarHubCard onNavigate={() => showToast('Grammar Hub — coming soon')} />
                <CurriculumCard onNavigate={() => showToast('Curriculum Explorer — coming soon')} />
            </div>

            {/* Toast */}
            {toastMsg && (
                <div style={{
                    position: 'fixed', bottom: '80px', left: '50%', transform: 'translateX(-50%)',
                    backgroundColor: 'var(--color-bg-tertiary)', color: 'var(--color-text-primary)',
                    padding: '10px 20px', borderRadius: 'var(--radius-full)', fontSize: 'var(--text-sm)',
                    fontWeight: 500, zIndex: 100, boxShadow: 'var(--shadow-md)',
                }}>
                    {toastMsg}
                </div>
            )}
        </div>
    );
}

/**
 * Wrapper that renders LearningSession with proper navigation shim.
 * The existing LearningSession calls useNavigate() internally —
 * we wrap in BrowserRouter to satisfy that requirement.
 */
import { BrowserRouter, useNavigate } from 'react-router-dom';

function LearningSessionWrapper({ onComplete }) {
    return (
        <BrowserRouter>
            <LearningSessionInner onComplete={onComplete} />
        </BrowserRouter>
    );
}

function LearningSessionInner({ onComplete }) {
    // Override navigate('/') calls from LearningSession
    const nav = useNavigate();
    // Monkey-patch: LearningSession calls navigate('/') on exit/complete
    // We intercept by listening for popstate or wrapping
    React.useEffect(() => {
        const handler = () => onComplete();
        window.addEventListener('popstate', handler);
        return () => window.removeEventListener('popstate', handler);
    }, [onComplete]);

    return <LearningSession />;
}
