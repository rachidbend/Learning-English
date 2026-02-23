/**
 * ReviewSessionWrapper.jsx — State machine for the Review flow
 *
 * States: 'dashboard' → 'session' → 'summary' → 'dashboard'
 * Manages transitions with AnimatePresence.
 */

import React, { useState, useCallback, useRef } from 'react';
import { AnimatePresence, motion } from 'framer-motion';
import { BrowserRouter, useNavigate } from 'react-router-dom';

import ReviewDashboard from './ReviewDashboard';
import ReviewSession from './ReviewSession';
import ReviewSummary from './ReviewSummary';

import { loadProgress, getDueWords } from '../../data/progressManager';
import { analytics } from '../../analytics/events';
import { EVENTS } from '../../constants/analyticsEvents';
import { logSessionCompletion } from '../../utils/streakCalculator';
import { duration, prefersReducedMotion } from '../../styles/motion';

const LAST_SESSION_KEY = 'last_review_session';

export default function ReviewSessionWrapper({
    dueNow, forecast, retentionRate, totalReviewed,
    currentStreak, nextReviewDate, refreshData,
}) {
    const [view, setView] = useState('dashboard');
    const [sessionResults, setSessionResults] = useState(null);
    const sessionStartRef = useRef(null);
    const preSessionProgressRef = useRef(null);
    const reduced = prefersReducedMotion();

    const handleStartReview = useCallback(() => {
        analytics.track(EVENTS.REVIEW_SESSION_STARTED, { words_due: dueNow });
        sessionStartRef.current = Date.now();
        preSessionProgressRef.current = loadProgress();
        setView('session');
    }, [dueNow]);

    const handleSessionComplete = useCallback(() => {
        const postProgress = loadProgress();
        const pre = preSessionProgressRef.current;

        // Compute results by diffing progress
        let correct = 0, wrong = 0, wordsReviewed = 0;
        if (pre && postProgress) {
            Object.keys(postProgress.wordProgress).forEach((id) => {
                const preWp = pre.wordProgress[id];
                const postWp = postProgress.wordProgress[id];
                if (!postWp) return;
                const preCorrect = preWp?.times_correct || 0;
                const preWrong = preWp?.times_wrong || 0;
                const deltaC = (postWp.times_correct || 0) - preCorrect;
                const deltaW = (postWp.times_wrong || 0) - preWrong;
                if (deltaC > 0 || deltaW > 0) {
                    wordsReviewed++;
                    correct += deltaC;
                    wrong += deltaW;
                }
            });
        }

        const durationSec = Math.round((Date.now() - (sessionStartRef.current || Date.now())) / 1000);
        const results = { wordsReviewed, correct, wrong, date: new Date().toISOString() };
        setSessionResults(results);

        // Save to localStorage
        try { localStorage.setItem(LAST_SESSION_KEY, JSON.stringify(results)); } catch { }

        // Log session for streak
        logSessionCompletion();

        // Analytics
        const total = correct + wrong;
        analytics.track(EVENTS.REVIEW_SESSION_COMPLETED, {
            words_reviewed: wordsReviewed,
            retention_rate: total > 0 ? Math.round((correct / total) * 100) : 0,
            duration_seconds: durationSec,
        });
        analytics.track('review_summary_viewed', {
            score_percent: total > 0 ? Math.round((correct / total) * 100) : 0,
        });

        setView('summary');
    }, []);

    const handleDone = useCallback(() => {
        refreshData();
        setView('dashboard');
    }, [refreshData]);

    const handleReviewMore = useCallback(() => {
        refreshData();
        sessionStartRef.current = Date.now();
        preSessionProgressRef.current = loadProgress();
        setView('session');
    }, [refreshData]);

    // Check if more words due after session
    const hasMoreDue = view === 'summary' ? getDueWords(loadProgress()).length > 0 : false;

    const fadeProps = reduced
        ? {}
        : { initial: { opacity: 0 }, animate: { opacity: 1 }, exit: { opacity: 0 }, transition: { duration: duration.normal } };

    return (
        <AnimatePresence mode="wait">
            {view === 'dashboard' && (
                <motion.div key="dashboard" {...fadeProps}>
                    <ReviewDashboard
                        dueNow={dueNow} forecast={forecast} retentionRate={retentionRate}
                        totalReviewed={totalReviewed} currentStreak={currentStreak}
                        onStartReview={handleStartReview} nextReviewDate={nextReviewDate}
                    />
                </motion.div>
            )}

            {view === 'session' && (
                <motion.div key="session" {...fadeProps}>
                    <ReviewSessionInRouter onComplete={handleSessionComplete} />
                </motion.div>
            )}

            {view === 'summary' && (
                <motion.div key="summary" {...fadeProps}>
                    <ReviewSummary results={sessionResults} onDone={handleDone} onReviewMore={handleReviewMore} hasMoreDue={hasMoreDue} />
                </motion.div>
            )}
        </AnimatePresence>
    );
}

/** Wraps ReviewSession in BrowserRouter (it uses useNavigate internally) */
function ReviewSessionInRouter({ onComplete }) {
    return (
        <BrowserRouter>
            <ReviewSessionNav onComplete={onComplete} />
        </BrowserRouter>
    );
}

function ReviewSessionNav({ onComplete }) {
    React.useEffect(() => {
        const handler = () => onComplete();
        window.addEventListener('popstate', handler);
        return () => window.removeEventListener('popstate', handler);
    }, [onComplete]);

    return <ReviewSession />;
}
