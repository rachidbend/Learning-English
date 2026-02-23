/**
 * ReviewPage.jsx — Review tab page
 *
 * Simple assembly: useReviewData() → ReviewSessionWrapper.
 */

import React from 'react';
import { useReviewData } from '../hooks/useReviewData';
import ReviewSessionWrapper from '../components/organisms/ReviewSessionWrapper';

export default function ReviewPage() {
    const reviewData = useReviewData();

    if (reviewData.isLoading) {
        return (
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', minHeight: '60vh' }}>
                <div style={{ width: 40, height: 40, border: '3px solid var(--color-border-subtle)', borderTopColor: 'var(--color-accent-blue)', borderRadius: '50%', animation: 'spin 0.8s linear infinite' }} />
                <style>{`@keyframes spin { to { transform: rotate(360deg) } }`}</style>
            </div>
        );
    }

    return <ReviewSessionWrapper {...reviewData} />;
}
