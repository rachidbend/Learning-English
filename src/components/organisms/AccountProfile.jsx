/**
 * AccountProfile.jsx — Profile section with avatar, name editing, and rank
 */

import React, { useState } from 'react';

export default function AccountProfile({ displayName, onNameChange, currentRank, nextRank, wordsToNextRank, totalMastered }) {
    const [editing, setEditing] = useState(false);
    const [editValue, setEditValue] = useState(displayName);

    const initials = (displayName || 'L').split(' ').map((w) => w[0]).join('').toUpperCase().slice(0, 2);

    const handleConfirm = () => {
        onNameChange(editValue);
        setEditing(false);
    };

    const handleCancel = () => {
        setEditValue(displayName);
        setEditing(false);
    };

    return (
        <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', padding: '24px 16px 16px', textAlign: 'center' }}>
            {/* Avatar */}
            <div style={{
                width: '64px', height: '64px', borderRadius: '50%',
                backgroundColor: 'var(--color-accent-blue-dim)', display: 'flex',
                alignItems: 'center', justifyContent: 'center',
            }}>
                <span style={{ fontSize: 'var(--text-xl)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-accent-blue)' }}>
                    {initials}
                </span>
            </div>

            {/* Display name */}
            {editing ? (
                <div style={{ display: 'flex', alignItems: 'center', gap: '8px', marginTop: '12px' }}>
                    <input
                        type="text" value={editValue} onChange={(e) => setEditValue(e.target.value)}
                        autoFocus onKeyDown={(e) => e.key === 'Enter' && handleConfirm()}
                        style={{
                            padding: '6px 12px', borderRadius: 'var(--radius-md)',
                            border: '1px solid var(--color-accent-blue)', backgroundColor: 'var(--color-bg-secondary)',
                            color: 'var(--color-text-primary)', fontSize: 'var(--text-base)', textAlign: 'center', width: '160px',
                        }}
                    />
                    <button onClick={handleConfirm} style={{ background: 'none', border: 'none', cursor: 'pointer', color: 'var(--color-accent-primary)', fontSize: '18px' }}>✓</button>
                    <button onClick={handleCancel} style={{ background: 'none', border: 'none', cursor: 'pointer', color: 'var(--color-text-muted)', fontSize: '16px' }}>✕</button>
                </div>
            ) : (
                <button onClick={() => { setEditValue(displayName); setEditing(true); }}
                    style={{ background: 'none', border: 'none', cursor: 'pointer', marginTop: '12px' }}>
                    <h2 style={{ fontSize: 'var(--text-xl)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-text-primary)', margin: 0 }}>
                        {displayName}
                    </h2>
                    <span style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-muted)' }}>tap to edit</span>
                </button>
            )}

            {/* Rank */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '6px', marginTop: '8px' }}>
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none">
                    <polygon points="12,2 15,9 22,9 16.5,14 18.5,21 12,17 5.5,21 7.5,14 2,9 9,9" fill="var(--color-accent-gold)" />
                </svg>
                <span style={{ fontSize: 'var(--text-sm)', fontWeight: 'var(--font-weight-semibold)', color: 'var(--color-accent-gold)' }}>
                    {currentRank}
                </span>
            </div>

            {nextRank && (
                <p style={{ fontSize: 'var(--text-xs)', color: 'var(--color-text-secondary)', marginTop: '4px' }}>
                    {wordsToNextRank} words to {nextRank}
                </p>
            )}

            <span style={{
                fontSize: '0.625rem', color: 'var(--color-accent-primary)',
                backgroundColor: 'var(--color-accent-primary-dim)', padding: '3px 10px',
                borderRadius: 'var(--radius-full)', marginTop: '8px',
            }}>
                {totalMastered} words mastered
            </span>
        </div>
    );
}
