/**
 * StoriesPage.jsx — Stories tab page assembly
 *
 * Manages 3 view states (library, reader, quiz) with slide transitions.
 * All data and logic from useStoriesData hook.
 */

import React, { useState, useCallback } from 'react';
import { AnimatePresence, motion } from 'framer-motion';
import { useStoriesData } from '../hooks/useStoriesData';
import { prefersReducedMotion } from '../styles/motion';

import StoryLibraryView from '../components/organisms/StoryLibraryView';
import StoryReader from '../components/organisms/StoryReader';
import StoryQuiz from '../components/organisms/StoryQuiz';
import WordDefinitionSheet from '../components/molecules/WordDefinitionSheet';

export default function StoriesPage() {
    const data = useStoriesData();
    const [sheetWord, setSheetWord] = useState(null);
    const reduced = prefersReducedMotion();

    // Word tap: returns word data or null, opens sheet if found
    const handleWordTap = useCallback((cleanWord) => {
        const wordData = data.lookupWord(cleanWord);
        if (wordData) setSheetWord(wordData);
        return wordData;
    }, [data]);

    const handleTakeQuiz = useCallback(() => {
        if (data.activeStoryId) data.markStoryRead(data.activeStoryId);
        data.openQuiz();
    }, [data]);

    const handleQuizComplete = useCallback((score, total) => {
        data.completeQuiz(score, total);
    }, [data]);

    const handleQuizDone = useCallback(() => {
        data.closeStory();
    }, [data]);

    const handleReadAgain = useCallback(() => {
        data.openStory(data.activeStoryId);
    }, [data]);

    const slide = reduced
        ? { initial: {}, animate: {}, exit: {} }
        : { initial: { x: '100%', opacity: 0 }, animate: { x: 0, opacity: 1 }, exit: { x: '100%', opacity: 0 } };

    return (
        <>
            <AnimatePresence mode="wait">
                {data.view === 'library' && (
                    <motion.div key="library" {...(reduced ? {} : { initial: { opacity: 0 }, animate: { opacity: 1 }, exit: { opacity: 0 } })} transition={{ duration: 0.3 }}>
                        <StoryLibraryView
                            levels={data.levels} selectedLevel={data.selectedLevel}
                            storiesForLevel={data.storiesForLevel} onSelectLevel={data.setSelectedLevel}
                            onOpenStory={data.openStory} currentLevelId="beginner_1"
                        />
                    </motion.div>
                )}

                {data.view === 'reader' && (
                    <motion.div key="reader" {...slide} transition={{ duration: 0.3, ease: [0.25, 0.1, 0.25, 1] }}>
                        <StoryReader
                            story={data.activeStory} onClose={data.closeStory}
                            onTakeQuiz={handleTakeQuiz} onWordTap={handleWordTap}
                            isRead={data.getStoryProgress(data.activeStoryId)?.read}
                        />
                    </motion.div>
                )}

                {data.view === 'quiz' && (
                    <motion.div key="quiz" {...slide} transition={{ duration: 0.3, ease: [0.25, 0.1, 0.25, 1] }}>
                        <StoryQuiz
                            story={data.activeStory} onComplete={handleQuizComplete}
                            onReadAgain={handleReadAgain}
                        />
                    </motion.div>
                )}
            </AnimatePresence>

            <WordDefinitionSheet word={sheetWord} isOpen={!!sheetWord} onClose={() => setSheetWord(null)} />
        </>
    );
}
