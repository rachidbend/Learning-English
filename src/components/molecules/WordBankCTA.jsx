/**
 * WordBankCTA.jsx — Entry point card for opening the Word Bank modal
 */

import React from 'react';

export default function WordBankCTA({ totalMastered, totalLearning, totalNew, onOpen }) {
    return (
        <div style={{ padding: '0 16px' }}>
            <div style={{
                backgroundColor: 'var(--color-bg-secondary)', borderRadius: 'var(--radius-xl)',
                padding: '20px', textAlign: 'center',
            }}>
                <h4 style={{ fontSize: 'var(--text-base)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-text-primary)', margin: '0 0 12px' }}>
                    Word Bank
                </h4>

                {/* Stat pills */}
                <div style={{ display: 'flex', justifyContent: 'center', gap: '8px', marginBottom: '16px', flexWrap: 'wrap' }}>
                    <Pill label={`${totalMastered} Mastered`} color="var(--color-accent-primary)" bg="var(--color-accent-primary-dim)" />
                    <Pill label={`${totalLearning} Learning`} color="var(--color-accent-blue)" bg="var(--color-accent-blue-dim)" />
                    <Pill label={`${totalNew} New`} color="var(--color-text-muted)" bg="var(--color-bg-tertiary)" />
                </div>

                <button
                    onClick={onOpen}
                    style={{
                        width: '100%', padding: '14px', borderRadius: 'var(--radius-lg)',
                        border: 'none', fontWeight: 'var(--font-weight-bold)', fontSize: 'var(--text-sm)',
                        background: 'linear-gradient(135deg, var(--color-accent-blue), var(--color-accent-primary))',
                        color: 'var(--color-text-inverse)', cursor: 'pointer',
                    }}
                >
                    Explore Word Bank
                </button>
            </div>
        </div>
    );
}

function Pill({ label, color, bg }) {
    return (
        <span style={{
            fontSize: '0.625rem', fontWeight: 600, color,
            backgroundColor: bg, padding: '4px 10px',
            borderRadius: 'var(--radius-full)',
        }}>
            {label}
        </span>
    );
}
