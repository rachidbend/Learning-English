/**
 * StoryLevelSelector.jsx — Level cards for the Stories tab
 *
 * Shows all levels with progress bars and "Coming Soon" for empty levels.
 */

import React from 'react';

export default function StoryLevelSelector({ levels, currentLevelId, onSelectLevel }) {
    return (
        <div style={{ padding: '16px', display: 'flex', flexDirection: 'column', gap: '12px' }}>
            {/* Header */}
            <div style={{ textAlign: 'center', paddingTop: '8px', marginBottom: '8px' }}>
                <h2 style={{ fontSize: 'var(--text-2xl)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-text-primary)', margin: 0 }}>
                    Stories
                </h2>
                <p style={{ fontSize: 'var(--text-sm)', color: 'var(--color-text-secondary)', marginTop: '4px' }}>
                    Read, learn, and grow
                </p>
            </div>

            {/* Level Cards */}
            {levels.map((lvl) => {
                const isCurrent = lvl.level_id === currentLevelId;
                const isActive = lvl.hasStories;

                return (
                    <button
                        key={lvl.level_id}
                        onClick={isActive ? () => onSelectLevel(lvl.level_id) : undefined}
                        disabled={!isActive}
                        style={{
                            width: '100%',
                            padding: '20px',
                            backgroundColor: 'var(--color-bg-secondary)',
                            borderRadius: 'var(--radius-xl)',
                            border: isCurrent ? '1.5px solid var(--color-accent-blue)' : '1px solid var(--color-border-subtle)',
                            cursor: isActive ? 'pointer' : 'default',
                            opacity: isActive ? 1 : 0.5,
                            textAlign: 'left',
                            transition: 'border-color 0.2s ease',
                        }}
                    >
                        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                            <div>
                                <h3 style={{ fontSize: 'var(--text-lg)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-text-primary)', margin: 0 }}>
                                    {lvl.level_name}
                                </h3>
                                <span style={{ fontSize: 'var(--text-sm)', color: 'var(--color-text-secondary)' }}>
                                    ({lvl.cefr})
                                </span>
                            </div>

                            {!isActive && (
                                <span style={{
                                    fontSize: '0.625rem', fontWeight: 600, color: 'var(--color-text-muted)',
                                    backgroundColor: 'var(--color-bg-tertiary)', padding: '4px 10px',
                                    borderRadius: 'var(--radius-full)', textTransform: 'uppercase', letterSpacing: '0.5px',
                                }}>
                                    Coming Soon
                                </span>
                            )}
                        </div>

                        {isActive && (
                            <div style={{ marginTop: '12px' }}>
                                <div style={{ height: '4px', backgroundColor: 'var(--color-bg-tertiary)', borderRadius: 'var(--radius-full)', overflow: 'hidden' }}>
                                    <div style={{
                                        height: '100%', width: `${lvl.percent}%`,
                                        background: 'linear-gradient(90deg, var(--color-accent-primary), var(--color-accent-blue))',
                                        borderRadius: 'var(--radius-full)', transition: 'width 0.5s ease',
                                    }} />
                                </div>
                                <p style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-muted)', marginTop: '6px' }}>
                                    {lvl.readCount} / {lvl.totalStories} stories read
                                </p>
                            </div>
                        )}
                    </button>
                );
            })}
        </div>
    );
}
