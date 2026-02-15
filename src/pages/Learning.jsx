import React, { useState, useEffect } from 'react';
import { loadBatch } from '../data/wordData';
import WordCard from '../components/WordCard';

const Learning = () => {
    const [words, setWords] = useState([]);
    const [currentWordIndex, setCurrentWordIndex] = useState(0);
    const [loading, setLoading] = useState(true);
    const [seenWords, setSeenWords] = useState(new Set());

    // Load batch data
    useEffect(() => {
        const loadWords = async () => {
            try {
                const batch = await loadBatch(1);
                if (batch && batch.words) {
                    setWords(batch.words);
                }
            } catch (error) {
                console.error('Error loading words:', error);
            } finally {
                setLoading(false);
            }
        };

        loadWords();
    }, []);

    // Handle marking word as seen
    const handleMarkSeen = (wordId) => {
        setSeenWords(prev => new Set([...prev, wordId]));
        console.log('✅ Marked word as seen:', wordId);
    };

    // Navigation handlers
    const handleNext = () => {
        if (currentWordIndex < words.length - 1) {
            setCurrentWordIndex(prev => prev + 1);
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
    };

    const handlePrevious = () => {
        if (currentWordIndex > 0) {
            setCurrentWordIndex(prev => prev - 1);
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
    };

    if (loading) {
        return (
            <div className="flex items-center justify-center min-h-screen">
                <div className="text-center space-y-4">
                    <div className="w-16 h-16 border-4 border-primary border-t-transparent rounded-full animate-spin mx-auto"></div>
                    <p className="text-gray-600">Loading words...</p>
                </div>
            </div>
        );
    }

    if (words.length === 0) {
        return (
            <div className="flex items-center justify-center min-h-screen">
                <div className="text-center space-y-4">
                    <p className="text-xl text-gray-600">No words found</p>
                    <button
                        onClick={() => window.location.href = '/'}
                        className="px-6 py-3 bg-primary text-white rounded-xl"
                    >
                        Go Home
                    </button>
                </div>
            </div>
        );
    }

    const currentWord = words[currentWordIndex];
    const isFirstWord = currentWordIndex === 0;
    const isLastWord = currentWordIndex === words.length - 1;

    return (
        <div className="min-h-screen bg-background py-6 px-4">
            <div className="max-w-2xl mx-auto">
                <WordCard
                    word={currentWord}
                    onNext={handleNext}
                    onPrevious={handlePrevious}
                    onMarkSeen={handleMarkSeen}
                    isFirstWord={isFirstWord}
                    isLastWord={isLastWord}
                    currentIndex={currentWordIndex}
                    totalWords={words.length}
                />
            </div>
        </div>
    );
};

export default Learning;
