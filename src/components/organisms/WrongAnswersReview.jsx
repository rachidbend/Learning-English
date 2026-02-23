import React from 'react';

/**
 * WrongAnswersReview Component
 * 
 * Displays a summary of incorrect answers from the current session.
 * Allows users to review their mistakes before finishing.
 */
const WrongAnswersReview = ({ wrongAnswers, onContinue }) => {
    if (!wrongAnswers || wrongAnswers.length === 0) {
        return null; // Should not happen if logic is correct
    }

    return (
        <div className="min-h-screen bg-background pb-20 p-4">
            <div className="max-w-lg mx-auto">
                <div className="text-center mb-6 pt-4">
                    <h1 className="text-2xl font-bold text-gray-900 mb-2">Let's Review</h1>
                    <p className="text-gray-600">
                        You had {wrongAnswers.length} miss{wrongAnswers.length === 1 ? '' : 'es'}.
                        Take a moment to see the correct answers.
                    </p>
                </div>

                <div className="space-y-6">
                    {wrongAnswers.map((item, index) => (
                        <div key={item.id || index} className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
                            {/* Question Section */}
                            <div className="p-4 border-b border-gray-50 bg-gray-50/50">
                                <p className="text-sm font-medium text-gray-500 uppercase tracking-wider mb-2">
                                    Question {index + 1}
                                </p>
                                <p className="text-lg font-medium text-gray-900 leading-relaxed">
                                    {item.question}
                                </p>
                            </div>

                            {/* Options Analysis */}
                            <div className="p-4 space-y-3">
                                {item.options.map((option, optIdx) => {
                                    const isSelected = optIdx === item.selected_index;
                                    const isCorrect = optIdx === item.correct_index;

                                    // Only show the relevant options (selected and correct)
                                    // unless we want to show all. Showing all helps context.

                                    let statusClass = "border-gray-100 bg-white text-gray-600";
                                    let icon = null;

                                    if (isCorrect) {
                                        statusClass = "border-success/50 bg-success/10 text-success-dark font-medium";
                                        icon = "✅";
                                    } else if (isSelected) {
                                        statusClass = "border-error/50 bg-error/10 text-error-dark opacity-75";
                                        icon = "❌";
                                    }

                                    return (
                                        <div
                                            key={optIdx}
                                            className={`p-3 rounded-lg border flex items-center justify-between ${statusClass}`}
                                        >
                                            <span>{option}</span>
                                            {icon && <span>{icon}</span>}
                                        </div>
                                    );
                                })}
                            </div>

                            {/* Explanation / Context */}
                            {item.explanation && (
                                <div className="px-4 pb-4">
                                    <div className="p-3 bg-blue-50 rounded-lg text-sm text-blue-800">
                                        <strong className="font-semibold block mb-1">Context:</strong>
                                        {item.explanation}
                                    </div>
                                </div>
                            )}
                        </div>
                    ))}
                </div>

                {/* Footer Action */}
                <div className="fixed bottom-0 left-0 right-0 p-4 bg-white/95 backdrop-blur-sm border-t border-gray-100">
                    <div className="max-w-lg mx-auto">
                        <button
                            onClick={onContinue}
                            className="w-full py-4 bg-primary text-white rounded-xl font-bold text-lg shadow-lg
                                     active:scale-[0.98] transition-all hover:bg-primary-dark hover:shadow-xl"
                        >
                            Continue to Results
                        </button>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default WrongAnswersReview;
