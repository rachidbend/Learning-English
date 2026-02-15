import React from 'react';

/**
 * BatchComplete Component
 * Shown when user completes all words in a batch
 */
const BatchComplete = ({
    batchId,
    batchTitle,
    statistics,
    onTakeBatchTest,
    onReviewWeak,
    onContinueToNextBatch,
    nextBatchLocked
}) => {
    const {
        total_words,
        words_seen,
        words_mastered,
        words_learning,
        weak_words,
        average_confidence,
        quiz_accuracy
    } = statistics;

    // Calculate completion percentage
    const completionPercentage = Math.round((words_seen / total_words) * 100);
    const masteryPercentage = Math.round((words_mastered / total_words) * 100);

    return (
        <div className="w-full bg-white rounded-2xl shadow-lg p-6">
            {/* Header */}
            <div className="text-center mb-6">
                <div className="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
                    <span className="text-4xl">🎉</span>
                </div>
                <h2 className="text-2xl font-bold text-gray-900 mb-2">
                    Batch {batchId} Complete!
                </h2>
                <p className="text-gray-600">
                    You've reviewed all {total_words} words in {batchTitle}
                </p>
            </div>

            {/* Statistics Grid */}
            <div className="mb-6">
                <h3 className="text-sm font-semibold text-gray-900 mb-3">Your Progress</h3>

                <div className="grid grid-cols-2 gap-3 mb-4">
                    <div className="bg-gray-50 rounded-lg p-4 text-center">
                        <p className="text-3xl font-bold text-primary">{words_seen}</p>
                        <p className="text-xs text-gray-600">Words Seen</p>
                    </div>
                    <div className="bg-gray-50 rounded-lg p-4 text-center">
                        <p className="text-3xl font-bold text-green-600">{words_mastered}</p>
                        <p className="text-xs text-gray-600">Mastered</p>
                    </div>
                    <div className="bg-gray-50 rounded-lg p-4 text-center">
                        <p className="text-3xl font-bold text-secondary">{words_learning}</p>
                        <p className="text-xs text-gray-600">Learning</p>
                    </div>
                    <div className="bg-gray-50 rounded-lg p-4 text-center">
                        <p className="text-3xl font-bold text-amber-600">{weak_words}</p>
                        <p className="text-xs text-gray-600">Need Review</p>
                    </div>
                </div>

                {/* Overall Progress */}
                <div className="space-y-2">
                    <div>
                        <div className="flex justify-between text-xs text-gray-600 mb-1">
                            <span>Mastery Level</span>
                            <span>{masteryPercentage}%</span>
                        </div>
                        <div className="w-full bg-gray-200 rounded-full h-3">
                            <div
                                className={`h-3 rounded-full transition-all duration-500 ${masteryPercentage >= 90 ? 'bg-green-600' :
                                    masteryPercentage >= 70 ? 'bg-primary' :
                                        'bg-amber-500'
                                    }`}
                                style={{ width: `${masteryPercentage}%` }}
                            />
                        </div>
                    </div>

                    <div>
                        <div className="flex justify-between text-xs text-gray-600 mb-1">
                            <span>Average Confidence</span>
                            <span>{Math.round(average_confidence)}%</span>
                        </div>
                        <div className="w-full bg-gray-200 rounded-full h-2">
                            <div
                                className="bg-secondary h-2 rounded-full transition-all duration-500"
                                style={{ width: `${average_confidence}%` }}
                            />
                        </div>
                    </div>
                </div>
            </div>

            {/* Weak Words Warning */}
            {weak_words > 0 && (
                <div className="mb-6 p-4 bg-amber-50 border border-amber-200 rounded-xl">
                    <div className="flex items-start gap-3">
                        <svg className="w-5 h-5 text-amber-600 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                            <path fillRule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clipRule="evenodd" />
                        </svg>
                        <div className="flex-1">
                            <p className="text-sm font-semibold text-amber-900 mb-1">
                                {weak_words} {weak_words === 1 ? 'word needs' : 'words need'} more practice
                            </p>
                            <p className="text-xs text-amber-800">
                                We recommend reviewing these before taking the batch test
                            </p>
                        </div>
                    </div>
                </div>
            )}

            {/* Action Buttons */}
            <div className="space-y-3">
                {/* Review Weak Words */}
                {weak_words > 0 && onReviewWeak && (
                    <button
                        onClick={onReviewWeak}
                        className="w-full p-4 bg-amber-500 text-white rounded-xl font-semibold active:scale-95 transition-transform flex items-center justify-between"
                    >
                        <div className="flex items-center gap-3">
                            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                            </svg>
                            <div className="text-left">
                                <p className="font-semibold">Review Weak Words</p>
                                <p className="text-xs text-white/80">Practice {weak_words} words with low confidence</p>
                            </div>
                        </div>
                        <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                        </svg>
                    </button>
                )}

                {/* Take Batch Test */}
                <button
                    onClick={onTakeBatchTest}
                    className="w-full p-4 bg-primary text-white rounded-xl font-semibold active:scale-95 transition-transform flex items-center justify-between"
                >
                    <div className="flex items-center gap-3">
                        <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                        <div className="text-left">
                            <p className="font-semibold">Take Batch Test</p>
                            <p className="text-xs text-white/80">
                                {nextBatchLocked ? 'Score 5/10 to unlock Batch 2 (temp)' : 'Test your knowledge'}
                            </p>
                        </div>
                    </div>
                    <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                    </svg>
                </button>

                {/* Continue (skip test) */}
                {!nextBatchLocked && onContinueToNextBatch && (
                    <button
                        onClick={onContinueToNextBatch}
                        className="w-full py-3 bg-gray-100 text-gray-700 rounded-xl font-medium active:scale-95 transition-transform"
                    >
                        Continue to Next Batch
                    </button>
                )}
            </div>

            {/* Info Note */}
            <div className="mt-4 p-3 bg-blue-50 rounded-lg">
                <p className="text-xs text-blue-800 text-center">
                    💡 Tip: Review weak words before taking the test for better results
                </p>
            </div>
        </div>
    );
};

export default BatchComplete;
