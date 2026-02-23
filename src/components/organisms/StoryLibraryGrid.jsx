/**
 * StoryLibraryGrid.jsx — Story cards for a selected level
 *
 * Vertical list of story cards with status badges and lock overlays.
 */

import React from 'react';
import StoryIllustration from '../atoms/StoryIllustration';

export default function StoryLibraryGrid({ stories, levelName, onBack, onOpenStory }) {
    return (
        <div style={{ padding: '16px' }}>
            {/* Back header */}
            <button
                onClick={onBack}
                style={{
                    display: 'flex', alignItems: 'center', gap: '8px',
                    background: 'none', border: 'none', cursor: 'pointer',
                    color: 'var(--color-text-secondary)', fontSize: 'var(--text-sm)',
                    padding: '8px 0', marginBottom: '16px',
                }}
            >
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round">
                    <polyline points="15 18 9 12 15 6" />
                </svg>
                Back to Levels
            </button>

            <h2 style={{ fontSize: 'var(--text-xl)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-text-primary)', margin: '0 0 16px' }}>
                {levelName}
            </h2>

            {/* Story cards list */}
            <div style={{ display: 'flex', flexDirection: 'column', gap: '12px' }}>
                {stories.map((story, i) => (
                    <StoryCard key={story.id} story={story} index={i} onOpen={() => onOpenStory(story.id)} />
                ))}
            </div>

            {stories.length === 0 && (
                <p style={{ textAlign: 'center', color: 'var(--color-text-muted)', padding: '32px 0', fontSize: 'var(--text-sm)' }}>
                    No stories available yet for this level.
                </p>
            )}
        </div>
    );
}

function StoryCard({ story, index, onOpen }) {
    const { title, description, illustration, word_count, progress, locked } = story;
    const { read, quizCompleted, quizScore } = progress || {};

    const getBadge = () => {
        if (locked) return { text: `Read Story ${index} to unlock`, color: 'var(--color-text-muted)', bg: 'var(--color-bg-tertiary)' };
        if (quizCompleted) return { text: `Quiz: ${quizScore}/4`, color: 'var(--color-accent-gold)', bg: 'var(--color-accent-gold-dim)' };
        if (read) return { text: 'Read', color: 'var(--color-accent-primary)', bg: 'var(--color-accent-primary-dim)' };
        return { text: 'Read Story', color: 'var(--color-accent-blue)', bg: 'var(--color-accent-blue-dim)' };
    };

    const badge = getBadge();

    return (
        <button
            onClick={locked ? undefined : onOpen}
            disabled={locked}
            style={{
                display: 'flex', gap: '14px', width: '100%', padding: '16px',
                backgroundColor: 'var(--color-bg-secondary)', borderRadius: 'var(--radius-xl)',
                border: '1px solid var(--color-border-subtle)', cursor: locked ? 'default' : 'pointer',
                opacity: locked ? 0.5 : 1, textAlign: 'left', position: 'relative',
                transition: 'opacity 0.2s ease',
            }}
        >
            {/* Illustration */}
            <div style={{ width: '64px', height: '56px', flexShrink: 0, borderRadius: 'var(--radius-md)', overflow: 'hidden', backgroundColor: 'var(--color-bg-tertiary)' }}>
                <StoryIllustration type={illustration} />
            </div>

            {/* Content */}
            <div style={{ flex: 1, minWidth: 0 }}>
                <p style={{ fontSize: 'var(--text-base)', fontWeight: 'var(--font-weight-semibold)', color: 'var(--color-text-primary)', margin: 0 }}>
                    {title}
                </p>
                <p style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)', margin: '2px 0 8px', lineHeight: 1.4 }}>
                    {description}
                </p>
                <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                    <span style={{
                        fontSize: '0.625rem', fontWeight: 600, color: badge.color,
                        backgroundColor: badge.bg, padding: '3px 8px', borderRadius: 'var(--radius-full)',
                    }}>
                        {badge.text}
                    </span>
                    <span style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-muted)' }}>
                        ~{word_count} words
                    </span>
                </div>
            </div>

            {/* Lock icon */}
            {locked && (
                <div style={{ position: 'absolute', top: '12px', right: '12px' }}>
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-muted)" strokeWidth="2" strokeLinecap="round">
                        <rect x="3" y="11" width="18" height="11" rx="2" />
                        <path d="M7 11V7a5 5 0 0 1 10 0v4" />
                    </svg>
                </div>
            )}
        </button>
    );
}
