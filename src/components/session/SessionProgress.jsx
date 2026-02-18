/**
 * SessionProgress.jsx
 *
 * Displays session progress: questions completed, words completed.
 * Shown in the header during review session.
 */

import React from 'react';

const SessionProgress = ({
    current,         // Current question index (0-based)
    total,           // Total questions in session
    wordsCompleted,  // Words fully completed
    totalWords,      // Total words in session
}) => {
    const questionProgress = total > 0 ? (current / total) * 100 : 0;

    return (
        <div>
            {/* Questions progress bar */}
            <div className="mb-2">
                <div className="flex justify-between text-xs text-gray-600 mb-1">
                    <span>Questions</span>
                    <span className="tabular-nums">{current} / {total}</span>
                </div>
                <div className="w-full bg-gray-200 rounded-full h-2">
                    <div
                        className="bg-primary h-2 rounded-full transition-all duration-300"
                        style={{ width: `${questionProgress}%` }}
                    />
                </div>
            </div>

            {/* Words completed */}
            <div className="flex justify-between text-xs text-gray-600">
                <span>Words reviewed</span>
                <span className="tabular-nums">{wordsCompleted} / {totalWords}</span>
            </div>
        </div>
    );
};

export default SessionProgress;
