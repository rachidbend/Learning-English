/**
 * SessionDashboard.jsx
 *
 * Pre-session landing screen showing reviews due, new words available,
 * and a progress stats grid. Uses react-router for navigation.
 */

import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useProgress } from '../../hooks/useProgress';
import { getAvailableNewWordIds } from '../../data/progressManager';
import { loadBatch } from '../../data/wordData';
import { buildSession } from '../../engine/sessionBuilder';
import ProgressCard from '../molecules/ProgressCard';

const SessionDashboard = () => {
    const navigate = useNavigate();
    const { progress, isLoading, stats } = useProgress();
    const [sessionPreview, setSessionPreview] = useState(null);
    const [newWordsAvailable, setNewWordsAvailable] = useState(0);
    const [ready, setReady] = useState(false);

    // Build session preview and count new words once progress loads
    useEffect(() => {
        if (!progress || isLoading) return;

        const setup = async () => {
            const preview = buildSession(progress, {});
            setSessionPreview(preview);

            const batch = await loadBatch(1);
            if (batch) {
                const newIds = getAvailableNewWordIds(progress, batch.words);
                setNewWordsAvailable(newIds.length);
            }

            setReady(true);
        };
        setup();
    }, [progress, isLoading]);

    if (isLoading || !ready || !sessionPreview) {
        return (
            <div className="flex items-center justify-center min-h-screen">
                <div className="text-center">
                    <div className="w-12 h-12 border-4 border-primary/30 border-t-primary rounded-full animate-spin mx-auto mb-4" />
                    <p className="text-gray-500 text-sm">Loading session...</p>
                </div>
            </div>
        );
    }

    const { meta } = sessionPreview;
    const streak = stats?.streak || 0;
    const hasReviews = meta.total_review_words > 0;
    const hasNewWords = newWordsAvailable > 0;
    const hasWork = hasReviews || hasNewWords;

    return (
        <div className="min-h-screen bg-background">
            <div className="max-w-md mx-auto px-4 py-8">

                {/* ── Header ─────────────────────────────── */}
                <div className="text-center mb-8">
                    <div className="w-16 h-16 bg-primary/10 rounded-2xl flex items-center justify-center mx-auto mb-4">
                        <span className="text-3xl">📚</span>
                    </div>
                    <h1 className="text-2xl font-bold text-gray-900 mb-1">
                        Study Session
                    </h1>
                    <p className="text-sm text-gray-500">
                        {hasWork ? 'Ready when you are' : "You're all caught up!"}
                    </p>
                </div>

                {/* ── Streak Banner ──────────────────────── */}
                {streak > 0 && (
                    <div className="bg-gradient-to-r from-amber-50 to-orange-50 border border-amber-200/60 rounded-2xl p-4 mb-6">
                        <div className="flex items-center gap-3">
                            <span className="text-3xl">🔥</span>
                            <div>
                                <p className="text-sm font-bold text-amber-900">
                                    {streak} day streak
                                </p>
                                <p className="text-xs text-amber-700/80">
                                    {streak >= 7 ? 'Incredible consistency!' : 'Keep it going!'}
                                </p>
                            </div>
                        </div>
                    </div>
                )}

                {/* ── Session Summary Card ───────────────── */}
                <div className="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden mb-6">
                    <div className="px-5 pt-5 pb-3">
                        <h2 className="text-sm font-semibold text-gray-500 uppercase tracking-wide mb-4">
                            Today's Session
                        </h2>
                    </div>

                    {/* Reviews Due */}
                    <div className="flex items-center justify-between px-5 py-3.5 border-t border-gray-50">
                        <div className="flex items-center gap-3">
                            <div className="w-10 h-10 bg-primary/8 rounded-xl flex items-center justify-center">
                                <span className="text-lg">📋</span>
                            </div>
                            <div>
                                <p className="text-sm font-medium text-gray-900">Reviews Due</p>
                                {meta.overdue_count > 0 && (
                                    <p className="text-xs text-error font-medium">
                                        {meta.overdue_count} overdue
                                    </p>
                                )}
                            </div>
                        </div>
                        <span className="text-2xl font-bold text-primary tabular-nums">
                            {meta.total_review_words}
                        </span>
                    </div>

                    {/* New Words */}
                    <div className="flex items-center justify-between px-5 py-3.5 border-t border-gray-50">
                        <div className="flex items-center gap-3">
                            <div className="w-10 h-10 bg-secondary/8 rounded-xl flex items-center justify-center">
                                <span className="text-lg">✨</span>
                            </div>
                            <div>
                                <p className="text-sm font-medium text-gray-900">New Words</p>
                                <p className="text-xs text-gray-400">
                                    {newWordsAvailable} available
                                </p>
                            </div>
                        </div>
                        <span className="text-2xl font-bold text-secondary tabular-nums">
                            {newWordsAvailable}
                        </span>
                    </div>

                    {/* Estimated Time */}
                    {hasReviews && (
                        <div className="flex items-center justify-between px-5 py-3.5 border-t border-gray-50">
                            <div className="flex items-center gap-3">
                                <div className="w-10 h-10 bg-gray-100 rounded-xl flex items-center justify-center">
                                    <span className="text-lg">⏱️</span>
                                </div>
                                <p className="text-sm font-medium text-gray-900">Est. Time</p>
                            </div>
                            <span className="text-2xl font-bold text-gray-600 tabular-nums">
                                ~{meta.estimated_minutes}m
                            </span>
                        </div>
                    )}
                </div>

                {/* ── Actions ────────────────────────────── */}
                <div className="space-y-3">
                    {hasReviews && (
                        <button
                            onClick={() => navigate('/review')}
                            className="w-full py-4 bg-primary text-white rounded-2xl font-bold text-lg
                           active:scale-[0.97] transition-transform shadow-lg shadow-primary/20
                           flex items-center justify-center gap-2"
                        >
                            <span>📋</span>
                            <span>Review Words ({meta.total_review_words})</span>
                        </button>
                    )}

                    {hasNewWords && (
                        <button
                            onClick={() => navigate('/learn')}
                            className="w-full py-4 bg-secondary text-white rounded-2xl font-bold text-lg
                           active:scale-[0.97] transition-transform shadow-lg shadow-secondary/20
                           flex items-center justify-center gap-2"
                        >
                            <span>✨</span>
                            <span>Learn New Words ({newWordsAvailable})</span>
                        </button>
                    )}

                    {!hasWork && (
                        <div className="text-center py-6">
                            <p className="text-gray-500 text-sm mb-1">
                                No reviews or new words scheduled.
                            </p>
                            <p className="text-gray-400 text-xs">
                                Come back later for more practice!
                            </p>
                        </div>
                    )}
                </div>

                {/* ── Progress Stats Grid ─────────────────── */}
                {stats && stats.totalWords > 0 && (
                    <div className="mt-6">
                        <h2 className="text-sm font-semibold text-gray-500 uppercase tracking-wide mb-3">
                            Your Progress
                        </h2>
                        <div className="grid grid-cols-2 gap-3">
                            <ProgressCard
                                icon="📝"
                                label="Total Words"
                                value={stats.totalWords}
                                color="blue"
                            />
                            <ProgressCard
                                icon="⭐"
                                label="Mastered"
                                value={stats.wordsMastered}
                                color="green"
                            />
                            <ProgressCard
                                icon="📖"
                                label="In Review"
                                value={stats.wordsInReview}
                                color="purple"
                            />
                            <ProgressCard
                                icon="📊"
                                label="Avg Confidence"
                                value={`${stats.avgConfidence}%`}
                                color="amber"
                            />
                        </div>
                    </div>
                )}

                {/* ── Tip ────────────────────────────────── */}
                <div className="mt-6 px-4 py-3 bg-blue-50/60 rounded-xl text-center">
                    <p className="text-xs text-blue-700/80">
                        💡 Questions are spaced out between words for better retention
                    </p>
                </div>

                {/* ── Footer ────────────────────────────────── */}
                <div className="mt-8 text-center pb-4">
                    <button
                        onClick={() => window.dispatchEvent(new CustomEvent('open-dev-panel'))}
                        className="text-[10px] text-gray-300 hover:text-gray-500 transition-colors uppercase tracking-widest font-semibold"
                    >
                        Dev Tools
                    </button>
                </div>
            </div>
        </div>
    );
};

export default SessionDashboard;

