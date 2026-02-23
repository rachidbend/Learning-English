import React, { useState } from 'react';

const WordCard = ({
    word,
    onNext,
    onPrevious,
    onMarkSeen,
    isFirstWord = false,
    isLastWord = false,
    currentIndex = 0,
    totalWords = 1,
    primaryButtonText
}) => {
    // State
    const [showTranslations, setShowTranslations] = useState(false);
    const [showNotes, setShowNotes] = useState(false);
    const [showAllExamples, setShowAllExamples] = useState(false);
    const [showEnglishDef, setShowEnglishDef] = useState(false);

    // POS mapping
    const getFullPOS = (pos) => {
        if (!pos) return '';
        const clean = pos.toLowerCase().trim();
        const map = {
            'v': 'Verb', 'v.': 'Verb', 'verb': 'Verb',
            'n': 'Noun', 'n.': 'Noun', 'noun': 'Noun',
            'adj': 'Adjective', 'adj.': 'Adjective', 'adjective': 'Adjective',
            'adv': 'Adverb', 'adv.': 'Adverb', 'adverb': 'Adverb',
            'prep': 'Preposition', 'prep.': 'Preposition', 'preposition': 'Preposition',
            'pron': 'Pronoun', 'pron.': 'Pronoun', 'pronoun': 'Pronoun',
            'conj': 'Conjunction', 'conj.': 'Conjunction', 'conjunction': 'Conjunction',
            'interj': 'Interjection', 'interj.': 'Interjection', 'interjection': 'Interjection',
            'art': 'Article', 'art.': 'Article', 'article': 'Article',
            'part': 'Particle', 'part.': 'Particle', 'particle': 'Particle'
        };
        return map[clean] || (clean.charAt(0).toUpperCase() + clean.slice(1));
    };

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
        if (!text) return null;
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
        <div className="w-full bg-white rounded-3xl shadow-lg p-6 min-h-[500px] flex flex-col max-w-sm mx-auto font-sans relative text-gray-900">

            {/* HERO SECTION */}
            <div className="flex items-start justify-between mb-4">
                <div className="flex items-baseline gap-3 relative top-2">
                    <h1 className="text-4xl font-bold tracking-tight text-gray-900">
                        {word.word}
                    </h1>
                    {word.pos && (
                        <span className="px-3 py-1 bg-primary/10 text-primary rounded-full text-xs font-semibold">
                            {getFullPOS(word.pos)}
                        </span>
                    )}
                </div>

                {/* Audio Button */}
                <button
                    onClick={() => speakWord(word.word)}
                    className="w-12 h-12 bg-primary hover:bg-primary/90 text-white rounded-full flex items-center justify-center active:scale-95 transition shadow-md"
                    aria-label="Pronounce word"
                >
                    <svg className="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15.536 8.464a5 5 0 010 7.072m2.828-9.9a9 9 0 010 12.728M5.586 15H4a1 1 0 01-1-1v-4a1 1 0 011-1h1.586l4.707-4.707C10.923 3.663 12 4.109 12 5v14c0 .891-1.077 1.337-1.707.707L5.586 15z" />
                    </svg>
                </button>
            </div>

            {/* PRIMARY TRANSLATION */}
            <div className="mb-6 pb-6 border-b border-gray-100">
                <p className="text-3xl font-medium text-primary" dir="rtl">
                    {word.translations?.primary || word.word_ar}
                </p>
            </div>

            {/* EXAMPLE UNIT */}
            {word.examples && word.examples.length > 0 && (
                <div className="mb-6 flex-1 space-y-4">
                    {word.examples.slice(0, 2).map((example, index) => (
                        <div key={index} className="space-y-2">
                            <p className="text-lg text-gray-900">
                                {parseHighlightedText(example.en)}
                            </p>

                            {showTranslations && example.ar && (
                                <p className="text-lg text-gray-600" dir="rtl">
                                    {parseHighlightedText(example.ar)}
                                </p>
                            )}
                        </div>
                    ))}

                    <label className="flex items-center gap-2 cursor-pointer mt-4 w-fit">
                        <div className={`w-5 h-5 rounded flex items-center justify-center transition ${showTranslations ? 'bg-primary border-primary' : 'bg-white border border-gray-300'}`}>
                            {showTranslations && (
                                <svg className="w-3 h-3 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={3}>
                                    <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
                                </svg>
                            )}
                        </div>
                        <input
                            type="checkbox"
                            className="hidden"
                            checked={showTranslations}
                            onChange={(e) => setShowTranslations(e.target.checked)}
                        />
                        <span className="text-sm text-gray-600 select-none hover:text-gray-900 transition">Show translations</span>
                    </label>
                </div>
            )}

            {/* PROGRESSIVE DISCLOSURE */}
            <div className="mb-6">
                <button
                    onClick={() => setShowAllExamples(!showAllExamples)}
                    className="w-full flex items-center justify-between px-4 py-3 bg-white border border-gray-200 rounded-xl text-sm font-medium text-gray-700 hover:bg-gray-50 transition shadow-sm"
                >
                    See More Examples &amp; Definition
                    <svg className={`w-4 h-4 transition-transform ${showAllExamples ? 'rotate-180' : ''}`} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                    </svg>
                </button>

                {/* Expanded Details */}
                {showAllExamples && (
                    <div className="mt-4 space-y-4 p-4 bg-gray-50 border border-gray-100 rounded-xl text-sm text-gray-800">
                        {word.definition?.en && (
                            <div>
                                <h4 className="font-semibold text-gray-500 uppercase text-xs mb-1 tracking-wider">Definition (EN)</h4>
                                <p>{word.definition.en}</p>
                            </div>
                        )}
                        {word.definition?.ar && (
                            <div>
                                <h4 className="font-semibold text-gray-500 uppercase text-xs mb-1 tracking-wider">Definition (AR)</h4>
                                <p dir="rtl">{word.definition.ar}</p>
                            </div>
                        )}
                        {word.examples && word.examples.length > 2 && (
                            <div>
                                <h4 className="font-semibold text-gray-500 uppercase text-xs mb-2 tracking-wider">More Examples</h4>
                                <div className="space-y-3">
                                    {word.examples.slice(2).map((ex, idx) => (
                                        <div key={idx} className="space-y-1">
                                            <p className="text-gray-900">{parseHighlightedText(ex.en)}</p>
                                            {showTranslations && ex.ar && <p className="text-gray-600" dir="rtl">{parseHighlightedText(ex.ar)}</p>}
                                        </div>
                                    ))}
                                </div>
                            </div>
                        )}
                        {word.usage_notes && (
                            <div>
                                <h4 className="font-semibold text-gray-500 uppercase text-xs mb-1 tracking-wider">Usage Notes</h4>
                                <p className="italic">{word.usage_notes}</p>
                            </div>
                        )}
                    </div>
                )}
            </div>

            {/* ACTION AREA */}
            <div className="flex mt-auto pt-4 border-t border-gray-100">
                <button
                    onClick={() => onMarkSeen(word.id)}
                    className="w-full py-4 rounded-2xl bg-primary hover:bg-primary/90 text-white font-bold text-lg shadow-lg shadow-primary/20 active:scale-[0.98] transition-all"
                >
                    {primaryButtonText || (isLastWord ? 'Finish' : 'Next')}
                </button>
            </div>
        </div>
    );
};

export default WordCard;
