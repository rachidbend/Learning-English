/**
 * SkeletonBlock.jsx — Animated shimmer loading skeleton
 */

import React from 'react';
import { prefersReducedMotion } from '../../styles/motion';

const shimmerKeyframes = `
@keyframes shimmer {
  0% { background-position: -200px 0; }
  100% { background-position: calc(200px + 100%) 0; }
}
`;

export default function SkeletonBlock({ width = '100%', height = '20px', borderRadius = '8px', style }) {
    const reduced = prefersReducedMotion();

    return (
        <>
            {!reduced && <style>{shimmerKeyframes}</style>}
            <div
                style={{
                    width, height, borderRadius,
                    backgroundColor: 'var(--color-bg-tertiary)',
                    backgroundImage: reduced ? 'none' : 'linear-gradient(90deg, var(--color-bg-tertiary) 0px, var(--color-bg-secondary) 40px, var(--color-bg-tertiary) 80px)',
                    backgroundSize: '200px 100%',
                    backgroundRepeat: 'no-repeat',
                    animation: reduced ? 'none' : 'shimmer 1.5s ease-in-out infinite',
                    ...style,
                }}
            />
        </>
    );
}

/**
 * BankPageSkeleton — Loading skeleton matching BankPage layout
 */
export function BankPageSkeleton() {
    return (
        <div style={{ padding: '16px', display: 'flex', flexDirection: 'column', gap: '16px' }}>
            <SkeletonBlock height="24px" width="50%" style={{ margin: '0 auto' }} />
            <SkeletonBlock height="12px" width="40%" style={{ margin: '0 auto' }} />
            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '12px' }}>
                <SkeletonBlock height="100px" borderRadius="var(--radius-xl)" />
                <SkeletonBlock height="100px" borderRadius="var(--radius-xl)" />
                <SkeletonBlock height="100px" borderRadius="var(--radius-xl)" />
                <SkeletonBlock height="100px" borderRadius="var(--radius-xl)" />
            </div>
            <SkeletonBlock height="180px" borderRadius="var(--radius-xl)" />
            <SkeletonBlock height="120px" borderRadius="var(--radius-xl)" />
        </div>
    );
}
