/**
 * SessionComplete.jsx
 *
 * End of session summary screen showing statistics and performance.
 */

import React from 'react';

const SessionComplete = ({
    session,
    wordQualities,    // { wordId: quality }
    wordResults,      // { wordId: [results] }
    sessionDuration,  // milliseconds
    onExit,
}) => {
    // Calculate statistics
    const totalWords = Object.keys(wordQualities).length;
    const totalQuestions = Object.values(wordResults).flat().length;
    const correctAnswers = Object.values(wordResults)
        .flat()
        .filter(r => r.correct).length;
    const accuracy = totalQuestions > 0
        ? Math.round((correctAnswers / totalQuestions) * 100)
        : 0;

    // Quality breakdown
    const qualityCounts = { again: 0, hard: 0, good: 0, easy: 0 };
    Object.values(wordQualities).forEach(q => {
        qualityCounts[q] = (qualityCounts[q] || 0) + 1;
    });

    // Time
    const durationMinutes = Math.round(sessionDuration / 60000);
    const durationSeconds = Math.round((sessionDuration % 60000) / 1000);

    return (
        <div className="min-h-screen bg-background">
            <div className="max-w-md mx-auto px-4 py-8">

                {/* ── Header ─────────────────────────── */}
                <div className="text-center mb-8">
                    <div className="text-6xl mb-4">🎉</div>
                    <h1 className="text-3xl font-bold text-gray-900 mb-2">
                        Session Complete!
                    </h1>
                    <p className="text-gray-600">
                        Great work! You reviewed {totalWords} {totalWords === 1 ? 'word' : 'words'}
                    </p>
                </div>

                {/* ── Performance Card ────────────────── */}
                <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 mb-6">
                    <h2 className="text-lg font-semibold text-gray-900 mb-4">Your Performance</h2>

                    {/* Accuracy */}
                    <div className="mb-6">
                        <div className="flex justify-between items-baseline mb-2">
                            <span className="text-gray-600">Accuracy</span>
                            <span className="text-3xl font-bold text-primary tabular-nums">{accuracy}%</span>
                        </div>
                        <div className="w-full bg-gray-200 rounded-full h-3">
                            <div
                                className={`h-3 rounded-full transition-all duration-500 ${accuracy >= 80 ? 'bg-success' :
                                        accuracy >= 60 ? 'bg-primary' :
                                            'bg-amber-500'
                                    }`}
                                style={{ width: `${accuracy}%` }}
                            />
                        </div>
                        <p className="text-sm text-gray-500 mt-1">
                            {correctAnswers} correct out of {totalQuestions} questions
                        </p>
                    </div>

                    {/* Quality breakdown */}
                    <div className="grid grid-cols-2 gap-3 mb-6">
                        <div className="text-center p-3 bg-success/10 rounded-xl">
                            <p className="text-2xl font-bold text-success tabular-nums">
                                {qualityCounts.easy + qualityCounts.good}
                            </p>
                            <p className="text-xs text-gray-600">Doing Well</p>
                        </div>
                        <div className="text-center p-3 bg-amber-50 rounded-xl">
                            <p className="text-2xl font-bold text-amber-600 tabular-nums">
                                {qualityCounts.hard + qualityCounts.again}
                            </p>
                            <p className="text-xs text-gray-600">Need Practice</p>
                        </div>
                    </div>

                    {/* Time */}
                    <div className="flex items-center justify-center gap-2 text-gray-500">
                        <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                        <span className="text-sm">
                            Session time: {durationMinutes}m {durationSeconds}s
                        </span>
                    </div>
                </div>

                {/* ── Word Performance Detail ─────────── */}
                {(qualityCounts.easy + qualityCounts.good + qualityCounts.hard + qualityCounts.again > 0) && (
                    <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 mb-6">
                        <h3 className="text-sm font-semibold text-gray-900 mb-3">Word Performance</h3>
                        <div className="space-y-2">
                            {qualityCounts.easy > 0 && (
                                <QualityRow emoji="🎯" label="mastered" count={qualityCounts.easy} />
                            )}
                            {qualityCounts.good > 0 && (
                                <QualityRow emoji="✅" label="solid" count={qualityCounts.good} />
                            )}
                            {qualityCounts.hard > 0 && (
                                <QualityRow emoji="📚" label="needs work" count={qualityCounts.hard} />
                            )}
                            {qualityCounts.again > 0 && (
                                <QualityRow emoji="💪" label="to review soon" count={qualityCounts.again} />
                            )}
                        </div>
                    </div>
                )}

                {/* ── Done ───────────────────────────── */}
                <button
                    onClick={onExit}
                    className="w-full py-4 bg-primary text-white rounded-2xl font-bold text-lg
                     active:scale-[0.97] transition-transform shadow-lg shadow-primary/20"
                >
                    Done
                </button>
            </div>
        </div>
    );
};

const QualityRow = ({ emoji, label, count }) => (
    <div className="flex items-center gap-2 text-sm">
        <span className="text-lg">{emoji}</span>
        <span className="text-gray-600">
            <span className="font-semibold text-gray-900">{count}</span>{' '}
            {count === 1 ? 'word' : 'words'} {label}
        </span>
    </div>
);

export default SessionComplete;
