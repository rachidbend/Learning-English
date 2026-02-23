/**
 * ErrorBoundary.jsx — Catches component crashes without taking down the app
 *
 * Shows a clean, styled fallback UI with a "Try Again" button.
 * Logs error type and component to analytics.
 * Never logs full error stack traces (may contain sensitive data).
 */

import React from 'react';
import { analytics } from '../../analytics/events';

class ErrorBoundary extends React.Component {
    constructor(props) {
        super(props);
        this.state = { hasError: false, error: null };
    }

    static getDerivedStateFromError(error) {
        return { hasError: true, error };
    }

    componentDidCatch(error, info) {
        analytics.trackError('component_crash', {
            component: info.componentStack?.split('\n')[1]?.trim() || 'unknown',
            error_message: error.message,
        });
    }

    handleRetry = () => {
        this.setState({ hasError: false, error: null });
    };

    render() {
        if (this.state.hasError) {
            return (
                <div
                    style={{
                        display: 'flex',
                        flexDirection: 'column',
                        alignItems: 'center',
                        justifyContent: 'center',
                        minHeight: '100vh',
                        padding: '24px',
                        backgroundColor: 'var(--color-bg-primary)',
                        color: 'var(--color-text-primary)',
                        fontFamily: 'var(--font-primary)',
                        textAlign: 'center',
                    }}
                >
                    <div style={{ fontSize: '48px', marginBottom: '16px' }}>⚠️</div>
                    <h2 style={{ fontSize: '1.5rem', fontWeight: 700, marginBottom: '8px' }}>
                        Something went wrong
                    </h2>
                    <p
                        style={{
                            fontSize: '0.875rem',
                            color: 'var(--color-text-secondary)',
                            marginBottom: '24px',
                            maxWidth: '320px',
                        }}
                    >
                        An unexpected error occurred. Your progress has been saved.
                    </p>
                    <button
                        onClick={this.handleRetry}
                        style={{
                            padding: '14px 24px',
                            background: 'linear-gradient(135deg, #4ade80, #22c55e)',
                            color: 'var(--color-text-inverse)',
                            border: 'none',
                            borderRadius: 'var(--radius-md)',
                            fontWeight: 600,
                            fontSize: '1rem',
                            cursor: 'pointer',
                        }}
                    >
                        Try Again
                    </button>
                </div>
            );
        }

        return this.props.children;
    }
}

export default ErrorBoundary;
