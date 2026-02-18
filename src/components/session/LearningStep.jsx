/**
 * LearningStep.jsx
 *
 * Visual indicator showing current step in the learning pipeline.
 * Used inside LearningSession to show progress through the 3-step
 * learning process (expose → short-term recall → consolidation).
 */

import React from 'react';

const STEP_INFO = [
    { label: 'First Exposure', icon: '📖', color: 'bg-blue-500' },
    { label: 'Short-term Recall', icon: '🧠', color: 'bg-purple-500' },
    { label: 'Consolidation', icon: '⭐', color: 'bg-amber-500' },
];

const LearningStep = ({ step, totalSteps = 3, message }) => {
    const info = STEP_INFO[step] || STEP_INFO[0];

    return (
        <div className="bg-gradient-to-r from-blue-50 to-indigo-50 border border-blue-100 rounded-2xl p-4 mb-4">
            {/* Step dots + label */}
            <div className="flex items-center justify-between mb-2">
                <div className="flex items-center gap-2">
                    <span className="text-lg">{info.icon}</span>
                    <span className="text-sm font-semibold text-blue-900">
                        Step {step + 1} of {totalSteps}: {info.label}
                    </span>
                </div>

                {/* Progress dots */}
                <div className="flex gap-1.5">
                    {Array.from({ length: totalSteps }).map((_, i) => (
                        <div
                            key={i}
                            className={`w-2.5 h-2.5 rounded-full transition-all duration-300 ${i < step
                                    ? 'bg-green-400'          // completed
                                    : i === step
                                        ? `${info.color} scale-125` // current (pulsing)
                                        : 'bg-gray-300'            // upcoming
                                }`}
                        />
                    ))}
                </div>
            </div>

            {/* Message */}
            {message && (
                <p className="text-sm text-blue-800/80 pl-7">
                    {message}
                </p>
            )}
        </div>
    );
};

export default LearningStep;
