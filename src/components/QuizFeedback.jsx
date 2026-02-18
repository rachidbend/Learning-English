import React from 'react';
import { QUESTION_TYPE_METADATA } from '../utils/questionTypes';

/**
 * QuizFeedback.jsx (MODIFIED for active recall)
 *
 * Shows immediate feedback after answering a quiz question.
 *
 * REMOVED: Manual quality rating buttons (now automatic via qualityCalculator)
 * KEPT: Correct/incorrect feedback with explanations
 *
 * NOTE: This component now only shows IMMEDIATE feedback per question.
 * Word-level quality is calculated automatically after ALL questions
 * for that word are complete.
 */

const QuizFeedback = ({
    type,
    question = null,
    userAnswer = null,
    quizSummary = null,
    onReviewWord = null,
    onRetryQuestion = null,
    onContinue,
    onReviewWeak = null,
    showEncouragement = true,
    showStatistics = true
}) => {

    // ==================== HELPER FUNCTIONS ====================

    const formatAnswerText = (text) => {
        const hasArabic = /[\u0600-\u06FF]/.test(text);
        if (hasArabic) {
            return (
                <span dir="rtl" className="text-right inline-block">
                    {text}
                </span>
            );
        }
        return text;
    };

    const renderExplanation = () => {
        if (!question || !question.metadata) return null;

        const { question_type, metadata } = question;

        if (question_type === 'sentence_completion' && metadata.original_sentence) {
            const sentence = metadata.original_sentence.replace(/\{|\}/g, '');
            return (
                <div>
                    <p className="text-sm text-gray-700 mb-2">
                        The word <span className="font-semibold text-primary">{question.word}</span> is used in this context:
                    </p>
                    <p className="text-sm text-gray-800 italic bg-white p-3 rounded-lg">
                        "{sentence}"
                    </p>
                    {metadata.context && (
                        <p className="text-xs text-gray-600 mt-2">
                            Context: {metadata.context}
                        </p>
                    )}
                </div>
            );
        }

        if (question_type === 'translation_match' || question_type === 'reverse_translation') {
            const correctAnswer = question.options[question.correct_index];
            return (
                <div>
                    <p className="text-sm text-gray-700 mb-2">
                        Remember this translation:
                    </p>
                    <div className="flex items-center justify-between bg-white p-3 rounded-lg">
                        <span className="text-sm font-semibold text-gray-900">{question.word}</span>
                        <span className="text-gray-400">⟷</span>
                        <span className="text-sm font-semibold text-gray-900" dir="rtl">
                            {correctAnswer}
                        </span>
                    </div>
                </div>
            );
        }

        return (
            <p className="text-sm text-gray-700">
                Review the word and its examples to better understand its usage.
            </p>
        );
    };

    const getEncouragingMessage = (type) => {
        const incorrectMessages = [
            "Don't worry! Learning from mistakes makes you stronger.",
            "Keep going! Every mistake is a step toward mastery.",
            "That's okay! Let's learn from this together.",
            "No problem! Even experts make mistakes.",
            "It's all part of learning! Keep practicing.",
        ];

        const correctMessages = [
            "Great job! You're doing amazing! 🎉",
            "Excellent work! Keep it up! ⭐",
            "Perfect! You really know this word! 🌟",
            "Awesome! You're on fire! 🔥",
            "Well done! You're making great progress! 👏",
        ];

        const messages = type === 'correct' ? correctMessages : incorrectMessages;
        return messages[Math.floor(Math.random() * messages.length)];
    };

    const getPerformanceLevel = (accuracy) => {
        if (accuracy >= 90) return 'excellent';
        if (accuracy >= 70) return 'good';
        if (accuracy >= 50) return 'needs_work';
        return 'keep_trying';
    };

    const getPerformanceMessage = (level) => {
        const messages = {
            excellent: "Outstanding performance! You've mastered these words! 🌟",
            good: "Great job! You're making solid progress! 👍",
            needs_work: "Good effort! Let's review to strengthen your understanding.",
            keep_trying: "Keep practicing! You're building important skills.",
        };
        return messages[level];
    };

    const formatTime = (seconds) => {
        const mins = Math.floor(seconds / 60);
        const secs = seconds % 60;
        return `${mins}m ${secs}s`;
    };

    // ==================== RENDER FUNCTIONS ====================

    const renderSingleIncorrect = () => {
        const correctAnswer = question.options[question.correct_index];
        const userAnswerText = question.options[userAnswer.selected_index];
        const encouragement = getEncouragingMessage('incorrect');

        return (
            <div className="w-full bg-white rounded-2xl shadow-lg p-6">
                {/* Header */}
                <div className="flex items-center gap-3 mb-4">
                    <div className="w-16 h-16 bg-error/10 rounded-full flex items-center justify-center flex-shrink-0">
                        <svg className="w-9 h-9 text-error" fill="currentColor" viewBox="0 0 20 20">
                            <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 9.586 8.707 8.293z" clipRule="evenodd" />
                        </svg>
                    </div>
                    <div>
                        <h2 className="text-2xl font-bold text-gray-900">Incorrect</h2>
                        {showEncouragement && (
                            <p className="text-sm text-gray-600">{encouragement}</p>
                        )}
                    </div>
                </div>

                {/* Question Review */}
                <div className="mb-6 p-4 bg-gray-50 rounded-xl">
                    <p className="text-xs text-gray-500 uppercase tracking-wide mb-2">Question</p>
                    <p className="text-base text-gray-900 mb-4">
                        {question.question.split('\n')[0]}
                    </p>

                    {/* Your Answer */}
                    <div className="mb-3">
                        <p className="text-xs text-gray-500 mb-1">Your answer:</p>
                        <div className="flex items-center gap-2">
                            <svg className="w-4 h-4 text-error flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 9.586 8.707 8.293z" clipRule="evenodd" />
                            </svg>
                            <span className="text-sm font-medium text-error">
                                {formatAnswerText(userAnswerText)}
                            </span>
                        </div>
                    </div>

                    {/* Correct Answer */}
                    <div>
                        <p className="text-xs text-gray-500 mb-1">Correct answer:</p>
                        <div className="flex items-center gap-2">
                            <svg className="w-4 h-4 text-success flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
                            </svg>
                            <span className="text-sm font-medium text-success">
                                {formatAnswerText(correctAnswer)}
                            </span>
                        </div>
                    </div>
                </div>

                {/* Explanation */}
                <div className="mb-6 p-4 bg-blue-50 rounded-xl">
                    <div className="flex items-start gap-2 mb-2">
                        <svg className="w-5 h-5 text-primary flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                            <path fillRule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clipRule="evenodd" />
                        </svg>
                        <div className="flex-1">
                            <h3 className="text-sm font-semibold text-gray-900 mb-1">Why this matters</h3>
                            {renderExplanation()}
                        </div>
                    </div>
                </div>

                {/* Continue button */}
                <button
                    onClick={onContinue}
                    className="w-full mt-4 py-3 bg-primary text-white rounded-xl font-semibold active:scale-95 transition-transform"
                >
                    Continue →
                </button>
            </div>
        );
    };

    const renderSingleCorrect = () => {
        const encouragement = getEncouragingMessage('correct');

        return (
            <div className="w-full bg-white rounded-2xl shadow-lg p-6">
                {/* Success Header */}
                <div className="text-center mb-6">
                    <div className="w-20 h-20 bg-success/10 rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg className="w-12 h-12 text-success" fill="currentColor" viewBox="0 0 20 20">
                            <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
                        </svg>
                    </div>

                    <h2 className="text-3xl font-bold text-success mb-2">Correct!</h2>
                    {showEncouragement && (
                        <p className="text-base text-gray-600">{encouragement}</p>
                    )}
                </div>

                {/* Optional: Show streak or stats */}
                {showStatistics && userAnswer?.streak && userAnswer.streak > 2 && (
                    <div className="mb-6 p-4 bg-amber-50 border border-amber-200 rounded-xl text-center">
                        <p className="text-sm text-amber-800">
                            🔥 <span className="font-bold">{userAnswer.streak} in a row!</span> Keep it up!
                        </p>
                    </div>
                )}

                {/* Continue Button */}
                <button
                    onClick={onContinue}
                    className="w-full py-4 bg-success text-white rounded-xl font-semibold text-lg active:scale-95 transition-transform"
                >
                    Continue →
                </button>
            </div>
        );
    };

    const renderQuizSummary = () => {
        const {
            total_questions,
            correct_answers,
            incorrect_answers,
            accuracy_percentage,
            weak_words,
            time_taken
        } = quizSummary;

        const performanceLevel = getPerformanceLevel(accuracy_percentage);

        return (
            <div className="w-full bg-white rounded-2xl shadow-lg p-6">
                {/* Header */}
                <div className="text-center mb-6">
                    <div className={`w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-4 ${performanceLevel === 'excellent' ? 'bg-success/10' :
                        performanceLevel === 'good' ? 'bg-primary/10' :
                            performanceLevel === 'needs_work' ? 'bg-amber-100' :
                                'bg-error/10'
                        }`}>
                        <span className="text-4xl">
                            {performanceLevel === 'excellent' ? '🎉' :
                                performanceLevel === 'good' ? '🎯' :
                                    performanceLevel === 'needs_work' ? '📚' :
                                        '💪'}
                        </span>
                    </div>

                    <h2 className="text-2xl font-bold text-gray-900 mb-2">Quiz Complete!</h2>
                    <p className="text-gray-600">{getPerformanceMessage(performanceLevel)}</p>
                </div>

                {/* Score */}
                <div className="mb-6">
                    <div className="flex items-baseline justify-center gap-2 mb-2">
                        <span className="text-4xl font-bold text-primary">{correct_answers}</span>
                        <span className="text-2xl text-gray-400">/</span>
                        <span className="text-2xl text-gray-600">{total_questions}</span>
                    </div>
                    <p className="text-center text-sm text-gray-600 mb-3">
                        {accuracy_percentage}% accuracy
                    </p>

                    {/* Progress Bar */}
                    <div className="w-full bg-gray-200 rounded-full h-3">
                        <div
                            className={`h-3 rounded-full transition-all duration-500 ${accuracy_percentage >= 90 ? 'bg-success' :
                                accuracy_percentage >= 70 ? 'bg-primary' :
                                    accuracy_percentage >= 50 ? 'bg-amber-500' :
                                        'bg-error'
                                }`}
                            style={{ width: `${accuracy_percentage}%` }}
                        />
                    </div>
                </div>

                {/* Statistics */}
                {showStatistics && (
                    <div className="mb-6 p-4 bg-gray-50 rounded-xl">
                        <h3 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-2">
                            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
                            </svg>
                            Statistics
                        </h3>

                        <div className="grid grid-cols-2 gap-3">
                            <div className="text-center p-3 bg-white rounded-lg">
                                <p className="text-2xl font-bold text-success">{correct_answers}</p>
                                <p className="text-xs text-gray-600">Correct</p>
                            </div>
                            <div className="text-center p-3 bg-white rounded-lg">
                                <p className="text-2xl font-bold text-error">{incorrect_answers}</p>
                                <p className="text-xs text-gray-600">Incorrect</p>
                            </div>
                        </div>

                        {time_taken && (
                            <div className="mt-3 text-center p-2 bg-white rounded-lg">
                                <p className="text-sm text-gray-600">
                                    Time: <span className="font-semibold text-gray-900">{formatTime(time_taken)}</span>
                                </p>
                            </div>
                        )}
                    </div>
                )}

                {/* Weak Words Section */}
                {weak_words && weak_words.length > 0 && (
                    <div className="mb-6 p-4 bg-amber-50 border border-amber-200 rounded-xl">
                        <h3 className="text-sm font-semibold text-gray-900 mb-2 flex items-center gap-2">
                            <svg className="w-4 h-4 text-amber-600" fill="currentColor" viewBox="0 0 20 20">
                                <path fillRule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clipRule="evenodd" />
                            </svg>
                            Words to Review ({weak_words.length})
                        </h3>
                        <p className="text-xs text-gray-600 mb-3">
                            These words need more practice
                        </p>

                        <div className="space-y-2">
                            {weak_words.slice(0, 5).map((word, index) => (
                                <div key={index} className="flex items-center gap-2 text-sm">
                                    <span className="text-gray-500">•</span>
                                    <span className="font-medium text-gray-900">
                                        {word}
                                    </span>
                                </div>
                            ))}
                            {weak_words.length > 5 && (
                                <p className="text-xs text-gray-500 italic">
                                    +{weak_words.length - 5} more words
                                </p>
                            )}
                        </div>
                    </div>
                )}

                {/* Action Buttons */}
                <div className="space-y-3">
                    {/* Review Weak Words */}
                    {onReviewWeak && weak_words && weak_words.length > 0 && (
                        <button
                            onClick={onReviewWeak}
                            className="w-full p-4 bg-primary text-white rounded-xl font-semibold active:scale-98 transition-transform flex items-center justify-between"
                        >
                            <div className="flex items-center gap-3">
                                <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                                </svg>
                                <span>Review Weak Words</span>
                            </div>
                            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                            </svg>
                        </button>
                    )}

                    {/* Continue */}
                    <button
                        onClick={onContinue}
                        className="w-full py-4 bg-success text-white rounded-xl font-semibold text-lg active:scale-95 transition-transform"
                    >
                        {weak_words && weak_words.length > 0 ? 'Continue Anyway' : 'Continue'} →
                    </button>
                </div>
            </div>
        );
    };

    // ==================== MAIN RENDER ====================

    if (type === 'single_incorrect') {
        return renderSingleIncorrect();
    }

    if (type === 'single_correct') {
        return renderSingleCorrect();
    }

    if (type === 'quiz_summary') {
        return renderQuizSummary();
    }

    return null;
};

export default QuizFeedback;
