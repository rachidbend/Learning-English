/**
 * @deprecated LEGACY TEST PAGE — not used by the active application.
 * This was created during Phase 4A (Quiz Engine) for standalone quiz testing.
 * No route currently points here. Safe to delete once no longer needed for debugging.
 */
import React, { useState, useEffect } from 'react';
import Quiz from '../components/organisms/Quiz';
import { generateQuestion } from '../utils/quizGenerator';
import { loadBatch } from '../data/wordData';
import QUESTION_TYPES from '../utils/questionTypes';

/**
 * QuizTest Page
 * Test page to demonstrate Quiz component functionality
 * Navigate to this page to test quiz questions
 */
const QuizTest = () => {
    const [question, setQuestion] = useState(null);
    const [words, setWords] = useState([]);
    const [questionCount, setQuestionCount] = useState(0);
    const [correctCount, setCorrectCount] = useState(0);
    const [isLoading, setIsLoading] = useState(true);

    // Load word data and generate first question
    useEffect(() => {
        const loadData = async () => {
            try {
                setIsLoading(true);
                const batch = await loadBatch(1);
                setWords(batch.words);

                // Generate first question (translation match)
                const firstQuestion = generateQuestion(
                    batch.words[0],
                    batch.words,
                    QUESTION_TYPES.TRANSLATION_MATCH
                );
                setQuestion(firstQuestion);
                setIsLoading(false);
            } catch (error) {
                console.error('Failed to load quiz data:', error);
                setIsLoading(false);
            }
        };

        loadData();
    }, []);

    /**
     * Handle answer callback from Quiz component
     */
    const handleAnswer = (isCorrect, selectedIndex) => {
        console.log('Answer:', isCorrect ? 'Correct ✓' : 'Incorrect ✗');
        console.log('Selected index:', selectedIndex);

        // Update stats
        setQuestionCount(prev => prev + 1);
        if (isCorrect) {
            setCorrectCount(prev => prev + 1);
        }

        // Generate next question with random word and type
        const randomWord = words[Math.floor(Math.random() * words.length)];
        const questionTypes = Object.values(QUESTION_TYPES);
        const randomType = questionTypes[Math.floor(Math.random() * questionTypes.length)];

        const nextQuestion = generateQuestion(randomWord, words, randomType);
        setQuestion(nextQuestion);

        // Scroll to top
        window.scrollTo({ top: 0, behavior: 'smooth' });
    };

    /**
     * Reset quiz test
     */
    const handleReset = () => {
        setQuestionCount(0);
        setCorrectCount(0);

        // Generate new first question
        const firstQuestion = generateQuestion(
            words[0],
            words,
            QUESTION_TYPES.TRANSLATION_MATCH
        );
        setQuestion(firstQuestion);
    };

    // Loading state
    if (isLoading) {
        return (
            <div className="min-h-screen bg-background flex items-center justify-center p-4">
                <div className="text-center">
                    <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary mx-auto mb-4"></div>
                    <p className="text-gray-600">Loading quiz...</p>
                </div>
            </div>
        );
    }

    // Error state
    if (!question || !words.length) {
        return (
            <div className="min-h-screen bg-background flex items-center justify-center p-4">
                <div className="bg-white rounded-2xl shadow-lg p-6 max-w-md">
                    <div className="text-red-500 text-center mb-4">
                        <svg className="w-16 h-16 mx-auto mb-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                        <h2 className="text-xl font-bold mb-2">Error</h2>
                        <p className="text-gray-600">Failed to load quiz data</p>
                    </div>
                    <button
                        onClick={() => window.location.reload()}
                        className="w-full bg-primary text-white py-3 rounded-xl font-semibold active:scale-95 transition"
                    >
                        Retry
                    </button>
                </div>
            </div>
        );
    }

    // Main render
    return (
        <div className="min-h-screen bg-background">
            {/* Header with stats */}
            <header className="bg-white shadow-sm sticky top-0 z-10">
                <div className="px-4 py-4">
                    <div className="flex items-center justify-between mb-2">
                        <h1 className="text-lg font-bold text-gray-900">Quiz Test</h1>
                        <button
                            onClick={handleReset}
                            className="text-sm text-primary underline"
                        >
                            Reset
                        </button>
                    </div>

                    {/* Stats */}
                    <div className="flex items-center gap-4 text-sm">
                        <div className="flex items-center gap-1">
                            <span className="text-gray-600">Questions:</span>
                            <span className="font-bold text-gray-900">{questionCount}</span>
                        </div>
                        <div className="flex items-center gap-1">
                            <span className="text-gray-600">Correct:</span>
                            <span className="font-bold text-success">{correctCount}</span>
                        </div>
                        <div className="flex items-center gap-1">
                            <span className="text-gray-600">Accuracy:</span>
                            <span className="font-bold text-gray-900">
                                {questionCount > 0 ? Math.round((correctCount / questionCount) * 100) : 0}%
                            </span>
                        </div>
                    </div>
                </div>
            </header>

            {/* Quiz Component */}
            <main className="p-4 pb-20">
                <Quiz
                    question={question}
                    onAnswer={handleAnswer}
                    showSkipButton={false}
                />

                {/* Debug info */}
                <div className="mt-6 p-4 bg-gray-50 rounded-lg text-xs text-gray-600">
                    <p className="font-semibold mb-2">Debug Info:</p>
                    <p>Word ID: {question.word_id}</p>
                    <p>Word: {question.word}</p>
                    <p>Type: {question.question_type}</p>
                    <p>Correct Index: {question.correct_index}</p>
                </div>
            </main>
        </div>
    );
};

export default QuizTest;
