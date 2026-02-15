import React, { useState } from 'react';

const WordCard = ({
    word,
    onNext,
    onPrevious,
    onMarkSeen,
    isFirstWord = false,
    isLastWord = false,
    currentIndex = 0,
    totalWords = 1
}) => {
    // State
    const [selectedPOSIndex, setSelectedPOSIndex] = useState(0);
    const [showTranslations, setShowTranslations] = useState(false);
    const [showNotes, setShowNotes] = useState(false);

    // Derived state
    const currentPOS = word.parts_of_speech[selectedPOSIndex];

    // Helper: Web Speech API for audio pronunciation
    const speakWord = (text) => {
        if ('speechSynthesis' in window) {
            // Cancel any ongoing speech
            window.speechSynthesis.cancel();

            const utterance = new SpeechSynthesisUtterance(text);
            utterance.lang = 'en-US';
            utterance.rate = 0.85; // Slightly slower for learners
            utterance.pitch = 1.0;

            window.speechSynthesis.speak(utterance);
        } else {
            console.warn('Speech synthesis not supported');
            alert('Audio pronunciation not supported in this browser');
        }
    };

    // Helper: Parse {bracketed} text and highlight
    const parseHighlightedText = (text) => {
        const parts = text.split(/\{|\}/);

        return parts.map((part, index) => {
            // Odd indices are the content inside brackets
            if (index % 2 === 1) {
                return (
                    <span
                        key={index}
                        className="text-primary font-bold bg-blue-50 px-1 rounded"
                    >
                        {part}
                    </span>
                );
            }
            return <span key={index}>{part}</span>;
        });
    };

    return (
        <div className="w-full bg-white rounded-2xl shadow-lg p-6 min-h-[500px] space-y-6">
            {/* HEADER SECTION */}
            <div className="relative mb-6">
                {/* Word */}
                <h1 className="text-4xl font-bold text-gray-900 mb-2 pr-14">
                    {word.word}
                </h1>

                {/* Audio Button */}
                <button
                    onClick={() => speakWord(word.word)}
                    className="absolute top-0 right-0 w-12 h-12 bg-primary rounded-full shadow-md flex items-center justify-center active:scale-95 transition"
                    aria-label="Pronounce word"
                >
                    <svg className="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15.536 8.464a5 5 0 010 7.072m2.828-9.9a9 9 0 010 12.728M5.586 15H4a1 1 0 01-1-1v-4a1 1 0 011-1h1.586l4.707-4.707C10.923 3.663 12 4.109 12 5v14c0 .891-1.077 1.337-1.707.707L5.586 15z" />
                    </svg>
                </button>

                {/* POS Tabs (if multiple parts of speech) */}
                {word.parts_of_speech.length > 1 && (
                    <div className="flex gap-2 mt-3">
                        {word.parts_of_speech.map((pos, index) => (
                            <button
                                key={index}
                                onClick={() => setSelectedPOSIndex(index)}
                                className={`px-4 py-2 rounded-lg font-medium text-sm transition ${selectedPOSIndex === index
                                    ? 'bg-primary text-white'
                                    : 'bg-gray-100 text-gray-600 active:bg-gray-200'
                                    }`}
                            >
                                {pos.pos.charAt(0).toUpperCase() + pos.pos.slice(1)}
                            </button>
                        ))}
                    </div>
                )}
            </div>

            {/* TRANSLATION SECTION */}
            <div className="mb-6">
                {/* Arabic Translation */}
                <div className="bg-blue-50 rounded-lg p-4 mb-3 text-right" dir="rtl">
                    <p className="text-xl font-semibold text-primary">
                        {currentPOS.translation}
                    </p>
                </div>

                {/* English Definition */}
                <p className="text-base text-gray-700 leading-relaxed">
                    {currentPOS.definition}
                </p>
            </div>

            {/* EXAMPLES SECTION */}
            <div className="mb-6">
                {/* Header with Toggle */}
                <div className="flex items-center justify-between mb-4">
                    <h3 className="text-lg font-semibold text-gray-900">Examples</h3>
                    <label className="flex items-center gap-2 cursor-pointer">
                        <input
                            type="checkbox"
                            checked={showTranslations}
                            onChange={(e) => setShowTranslations(e.target.checked)}
                            className="w-4 h-4 text-primary rounded focus:ring-primary"
                        />
                        <span className="text-sm text-gray-600">Show translations</span>
                    </label>
                </div>

                {/* Example Items */}
                <div className="space-y-4">
                    {currentPOS.examples.map((example, index) => (
                        <div key={index} className="space-y-2">
                            {/* Context Label */}
                            <p className="text-xs text-gray-500 italic">
                                {example.context}
                            </p>

                            {/* English Sentence */}
                            <p className="text-base text-gray-900 leading-relaxed">
                                {parseHighlightedText(example.sentence)}
                            </p>

                            {/* Arabic Translation (conditional) */}
                            {showTranslations && (
                                <div className="bg-gray-50 rounded-lg p-3 text-right" dir="rtl">
                                    <p className="text-sm text-gray-600">
                                        {parseHighlightedText(example.translation)}
                                    </p>
                                </div>
                            )}
                        </div>
                    ))}
                </div>
            </div>

            {/* NOTES SECTION (Collapsible) */}
            <div className="mb-8">
                <button
                    onClick={() => setShowNotes(!showNotes)}
                    className="w-full flex items-center justify-between bg-amber-50 border border-amber-200 rounded-lg p-4 active:bg-amber-100 transition"
                >
                    <div className="flex items-center gap-2">
                        <svg className="w-5 h-5 text-amber-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                        <span className="font-medium text-gray-900">Usage Notes</span>
                    </div>
                    <svg
                        className={`w-5 h-5 text-gray-600 transition-transform ${showNotes ? 'rotate-180' : ''}`}
                        fill="none"
                        stroke="currentColor"
                        viewBox="0 0 24 24"
                    >
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                    </svg>
                </button>

                {showNotes && (
                    <div className="mt-2 bg-amber-50 border border-amber-200 rounded-lg p-4">
                        <p className="text-sm text-gray-700 leading-relaxed">
                            {word.notes}
                        </p>
                    </div>
                )}
            </div>

            {/* NAVIGATION SECTION */}
            <div className="space-y-3">
                {/* Button Row */}
                <div className="flex gap-3">
                    <button
                        onClick={onPrevious}
                        disabled={isFirstWord}
                        className={`py-3 px-6 rounded-xl font-medium transition ${isFirstWord
                            ? 'bg-gray-200 text-gray-400 cursor-not-allowed'
                            : 'bg-gray-200 text-gray-700 active:scale-95'
                            }`}
                    >
                        ← Previous
                    </button>

                    <button
                        onClick={() => onMarkSeen(word.id)}
                        className="flex-1 py-3 px-6 bg-primary text-white rounded-xl font-semibold active:scale-95 transition"
                    >
                        {isLastWord ? 'Finish' : 'Mark as Seen'}
                    </button>
                </div>

                {/* Progress Indicator */}
                <p className="text-sm text-gray-500 text-center">
                    Word {currentIndex + 1} of {totalWords}
                </p>
            </div>
        </div>
    );
};

export default WordCard;
