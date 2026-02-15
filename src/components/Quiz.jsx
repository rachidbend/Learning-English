import React, { useState, useEffect } from 'react';
import { QUESTION_TYPE_METADATA } from '../utils/questionTypes';

const Quiz = ({
    question,
    onAnswer,
    onSkip = null,
    showSkipButton = false,
    timeLimit = null
}) => {
    // ==================== STATE ====================

    const [selectedIndex, setSelectedIndex] = useState(null);
    const [hasAnswered, setHasAnswered] = useState(false);
    const [isCorrect, setIsCorrect] = useState(null);
    const [showFeedback, setShowFeedback] = useState(false);

    // TODO PHASE 9: Timer functionality
    // const [timeRemaining, setTimeRemaining] = useState(timeLimit);
    // useEffect(() => {
    //   if (!timeLimit || hasAnswered) return;
    //   const timer = setInterval(() => {
    //     setTimeRemaining(prev => {
    //       if (prev <= 1) {
    //         clearInterval(timer);
    //         handleTimeout();
    //         return 0;
    //       }
    //       return prev - 1;
    //     });
    //   }, 1000);
    //   return () => clearInterval(timer);
    // }, [timeLimit, hasAnswered]);

    // Reset state when question changes
    useEffect(() => {
        setSelectedIndex(null);
        setHasAnswered(false);
        setIsCorrect(null);
        setShowFeedback(false);
    }, [question.id]);

    // ==================== HELPER FUNCTIONS ====================

    const questionMeta = QUESTION_TYPE_METADATA[question.question_type];

    const formatQuestionText = (text) => {
        return text.split('\n').map((line, index) => (
            <span key={index}>
                {line}
                {index < text.split('\n').length - 1 && <br />}
            </span>
        ));
    };

    const formatOptionText = (text, questionType) => {
        const hasArabic = /[\u0600-\u06FF]/.test(text);

        if (hasArabic) {
            return (
                <span dir="rtl" className="text-right block">
                    {text}
                </span>
            );
        }

        return text;
    };

    const renderExplanation = () => {
        const { question_type, metadata } = question;

        if (question_type === 'sentence_completion' && metadata?.original_sentence) {
            const sentence = metadata.original_sentence.replace(/\{|\}/g, '');
            return (
                <div className="mt-3 p-3 bg-blue-50 rounded-lg">
                    <p className="text-xs text-gray-600 mb-1">Example sentence:</p>
                    <p className="text-sm text-gray-800 italic">"{sentence}"</p>
                </div>
            );
        }

        if (question_type === 'translation_match' || question_type === 'reverse_translation') {
            return (
                <div className="mt-3 p-3 bg-blue-50 rounded-lg">
                    <p className="text-xs text-gray-600 mb-2">💡 Remember this word:</p>
                    <div className="flex items-center justify-between">
                        <span className="text-sm font-medium text-gray-900">{question.word}</span>
                        <span className="text-sm text-gray-600">→</span>
                        <span className="text-sm font-medium text-gray-900" dir="rtl">
                            {question.options[question.correct_index]}
                        </span>
                    </div>
                </div>
            );
        }

        return null;
    };

    // ==================== HANDLERS ====================

    const handleOptionClick = (index) => {
        if (hasAnswered) return;

        setSelectedIndex(index);
        setHasAnswered(true);

        const correct = index === question.correct_index;
        setIsCorrect(correct);

        setTimeout(() => {
            setShowFeedback(true);
        }, 300);
    };

    const handleContinue = () => {
        if (onAnswer) {
            onAnswer(isCorrect, selectedIndex);
        }
    };

    const handleSkip = () => {
        if (onSkip) {
            onSkip();
        }
    };

    // TODO PHASE 9: Handle timeout
    // const handleTimeout = () => {
    //   if (!hasAnswered) {
    //     setHasAnswered(true);
    //     setIsCorrect(false);
    //     setShowFeedback(true);
    //   }
    // };

    // ==================== RENDER ====================

    return (
        <div className="w-full bg-white rounded-2xl shadow-lg p-6 min-h-[500px]">
            {/* Header */}
            <div className="flex items-center justify-between mb-4">
                <div className="flex items-center gap-2">
                    <span className="px-3 py-1 bg-secondary/10 text-secondary rounded-full text-xs font-medium">
                        {questionMeta?.name || 'Quiz'}
                    </span>

                    <span className={`px-3 py-1 rounded-full text-xs font-medium ${question.difficulty === 'easy'
                            ? 'bg-green-100 text-green-700'
                            : question.difficulty === 'medium'
                                ? 'bg-yellow-100 text-yellow-700'
                                : 'bg-red-100 text-red-700'
                        }`}>
                        {question.difficulty}
                    </span>
                </div>
            </div>

            {/* Question Text */}
            <div className="mb-6">
                <h2 className="text-xl font-bold text-gray-900 leading-relaxed">
                    {formatQuestionText(question.question)}
                </h2>

                {question.metadata?.context && !hasAnswered && (
                    <p className="text-sm text-gray-500 italic mt-2">
                        Context: {question.metadata.context}
                    </p>
                )}
            </div>

            {/* Options */}
            <div className="space-y-3 mb-6">
                {question.options.map((option, index) => {
                    const isSelected = selectedIndex === index;
                    const isCorrectOption = index === question.correct_index;

                    let buttonClasses = 'w-full p-4 rounded-xl text-left font-medium transition-all duration-200 ';

                    if (!hasAnswered) {
                        buttonClasses += isSelected
                            ? 'bg-primary/10 border-2 border-primary text-primary'
                            : 'bg-white border-2 border-gray-200 text-gray-900 hover:border-primary/50 active:scale-98';
                    } else {
                        if (isCorrectOption) {
                            buttonClasses += 'bg-success/10 border-2 border-success text-success';
                        } else if (isSelected && !isCorrectOption) {
                            buttonClasses += 'bg-error/10 border-2 border-error text-error';
                        } else {
                            buttonClasses += 'bg-gray-50 border-2 border-gray-200 text-gray-500';
                        }
                    }

                    return (
                        <button
                            key={index}
                            onClick={() => handleOptionClick(index)}
                            disabled={hasAnswered}
                            className={buttonClasses}
                        >
                            <div className="flex items-center gap-3">
                                <div className={`w-8 h-8 rounded-full flex items-center justify-center text-sm font-bold flex-shrink-0 ${!hasAnswered
                                        ? isSelected
                                            ? 'bg-primary text-white'
                                            : 'bg-gray-200 text-gray-600'
                                        : isCorrectOption
                                            ? 'bg-success text-white'
                                            : isSelected
                                                ? 'bg-error text-white'
                                                : 'bg-gray-300 text-gray-500'
                                    }`}>
                                    {String.fromCharCode(65 + index)}
                                </div>

                                <div className="flex-1 text-base leading-relaxed">
                                    {formatOptionText(option, question.question_type)}
                                </div>

                                {hasAnswered && (
                                    <div className="flex-shrink-0">
                                        {isCorrectOption ? (
                                            <svg className="w-6 h-6 text-success" fill="currentColor" viewBox="0 0 20 20">
                                                <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
                                            </svg>
                                        ) : isSelected ? (
                                            <svg className="w-6 h-6 text-error" fill="currentColor" viewBox="0 0 20 20">
                                                <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 9.586 8.707 8.293z" clipRule="evenodd" />
                                            </svg>
                                        ) : null}
                                    </div>
                                )}
                            </div>
                        </button>
                    );
                })}
            </div>

            {/* Feedback Section */}
            {showFeedback && (
                <div className={`rounded-2xl p-6 mb-6 ${isCorrect
                        ? 'bg-success/10 border-2 border-success'
                        : 'bg-error/10 border-2 border-error'
                    }`}>
                    <div className="flex items-center gap-3 mb-3">
                        {isCorrect ? (
                            <>
                                <div className="w-12 h-12 bg-success rounded-full flex items-center justify-center">
                                    <svg className="w-7 h-7 text-white" fill="currentColor" viewBox="0 0 20 20">
                                        <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                                    </svg>
                                </div>
                                <div>
                                    <h3 className="text-xl font-bold text-success">Correct!</h3>
                                    <p className="text-sm text-gray-700">Great job! 🎉</p>
                                </div>
                            </>
                        ) : (
                            <>
                                <div className="w-12 h-12 bg-error rounded-full flex items-center justify-center">
                                    <svg className="w-7 h-7 text-white" fill="currentColor" viewBox="0 0 20 20">
                                        <path fillRule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clipRule="evenodd" />
                                    </svg>
                                </div>
                                <div>
                                    <h3 className="text-xl font-bold text-error">Incorrect</h3>
                                    <p className="text-sm text-gray-700">Keep trying! 💪</p>
                                </div>
                            </>
                        )}
                    </div>

                    {!isCorrect && (
                        <div className="mt-4 p-4 bg-white rounded-lg">
                            <p className="text-sm text-gray-700 mb-2">
                                <span className="font-semibold">Correct answer:</span>
                            </p>
                            <p className="text-base font-medium text-gray-900">
                                {formatOptionText(
                                    question.options[question.correct_index],
                                    question.question_type
                                )}
                            </p>
                            {renderExplanation()}
                        </div>
                    )}
                </div>
            )}

            {/* Action Buttons */}
            <div className="space-y-3">
                {hasAnswered ? (
                    <button
                        onClick={handleContinue}
                        className="w-full py-4 bg-primary text-white rounded-xl font-semibold text-lg active:scale-95 transition-transform"
                    >
                        Continue →
                    </button>
                ) : (
                    <>
                        <div className="text-center text-sm text-gray-500 py-2">
                            Select an answer to continue
                        </div>

                        {showSkipButton && onSkip && (
                            <button
                                onClick={handleSkip}
                                className="w-full py-3 bg-gray-100 text-gray-700 rounded-xl font-medium active:scale-95 transition-transform"
                            >
                                Skip Question
                            </button>
                        )}
                    </>
                )}
            </div>
        </div>
    );
};

export default Quiz;
