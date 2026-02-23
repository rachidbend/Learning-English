/**
 * WordReviewTransition.jsx
 *
 * Brief overlay shown after ALL questions for a single word
 * have been answered. Displays the auto-calculated quality,
 * confidence change, and next review date.
 *
 * Auto-advances after 2.5 seconds or on tap.
 */

import React, { useEffect, useCallback } from 'react';
import { getSchedulingSummary } from '../../engine/scheduler';

const QUALITY_CONFIG = {
    again: {
        emoji: '🔄',
        label: 'Needs Work',
        bg: 'bg-red-50',
        border: 'border-red-200',
        text: 'text-red-700',
        message: "We'll review this one again soon",
    },
    hard: {
        emoji: '💭',
        label: 'Challenging',
        bg: 'bg-amber-50',
        border: 'border-amber-200',
        text: 'text-amber-700',
        message: "Getting there — keep going!",
    },
    good: {
        emoji: '✅',
        label: 'Good!',
        bg: 'bg-emerald-50',
        border: 'border-emerald-200',
        text: 'text-emerald-700',
        message: 'Nice work!',
    },
    easy: {
        emoji: '⭐',
        label: 'Excellent!',
        bg: 'bg-blue-50',
        border: 'border-blue-200',
        text: 'text-blue-700',
        message: 'You know this well!',
    },
};

const WordReviewTransition = ({ wordProgress, quality, onContinue }) => {
    const config = QUALITY_CONFIG[quality] || QUALITY_CONFIG.good;
    const summary = getSchedulingSummary(wordProgress);

    const stableContinue = useCallback(onContinue, []);

    useEffect(() => {
        const timer = setTimeout(stableContinue, 2500);
        return () => clearTimeout(timer);
    }, [stableContinue]);

    const confChange = wordProgress.confidence_trend || 0;

    const dueLabel = (() => {
        if (summary.is_due_now) return 'Later this session';
        if (summary.due_in_days === null) return 'Soon';
        if (summary.due_in_days <= 0) return 'Tomorrow';
        if (summary.due_in_days === 1) return 'In 1 day';
        return `In ${summary.due_in_days} days`;
    })();

    return (
        <div
            onClick={onContinue}
            className="fixed inset-0 z-50 bg-black/40 backdrop-blur-sm
                 flex items-center justify-center cursor-pointer
                 animate-[fadeIn_200ms_ease-out]"
        >
            <div
                className={`${config.bg} ${config.border} border-2 rounded-3xl
                    shadow-2xl p-8 mx-6 max-w-sm w-full
                    animate-[scaleIn_250ms_ease-out]`}
                onClick={e => e.stopPropagation()}
            >
                {/* Emoji */}
                <div className="text-center mb-3">
                    <span className="text-5xl">{config.emoji}</span>
                </div>

                {/* Quality label */}
                <h2 className={`text-xl font-bold text-center ${config.text} mb-1`}>
                    {config.label}
                </h2>
                <p className="text-sm text-center text-gray-500 mb-6">
                    {config.message}
                </p>

                {/* Confidence + Next review */}
                <div className="space-y-3">
                    <div className="flex items-center justify-between px-4 py-3 bg-white/60 rounded-xl">
                        <span className="text-xs font-medium text-gray-500">Confidence</span>
                        <div className="flex items-center gap-1.5">
                            <span className="text-base font-bold text-gray-900 tabular-nums">
                                {wordProgress.confidence}%
                            </span>
                            {confChange !== 0 && (
                                <span className={`text-xs font-semibold ${confChange > 0 ? 'text-emerald-600' : 'text-red-500'}`}>
                                    {confChange > 0 ? '+' : ''}{confChange}
                                </span>
                            )}
                        </div>
                    </div>

                    <div className="flex items-center justify-between px-4 py-3 bg-white/60 rounded-xl">
                        <span className="text-xs font-medium text-gray-500">Next review</span>
                        <span className="text-sm font-semibold text-gray-700">{dueLabel}</span>
                    </div>
                </div>

                {/* Tap hint */}
                <p className="text-xs text-center text-gray-400 mt-5">
                    Tap to continue
                </p>
            </div>
        </div>
    );
};

export default WordReviewTransition;
