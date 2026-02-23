/**
 * StoryLibraryView.jsx — Composes level selector and story grid
 *
 * Shows level selector when no level is selected,
 * story library grid when a level is selected.
 */

import React from 'react';
import StoryLevelSelector from './StoryLevelSelector';
import StoryLibraryGrid from './StoryLibraryGrid';

export default function StoryLibraryView({
    levels, selectedLevel, storiesForLevel,
    onSelectLevel, onOpenStory, currentLevelId,
}) {
    if (selectedLevel) {
        return (
            <StoryLibraryGrid
                stories={storiesForLevel}
                levelName={selectedLevel.level_name}
                onBack={() => onSelectLevel(null)}
                onOpenStory={onOpenStory}
            />
        );
    }

    return (
        <StoryLevelSelector
            levels={levels}
            currentLevelId={currentLevelId}
            onSelectLevel={onSelectLevel}
        />
    );
}
