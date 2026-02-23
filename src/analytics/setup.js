/**
 * analytics/setup.js — PostHog and Google Analytics initialization
 *
 * Reads all keys from environment variables.
 * Disables IP capture and session recording for privacy.
 * Uses anonymous UID as the distinct ID.
 */

import posthog from 'posthog-js';
import ReactGA from 'react-ga4';
import { getOrCreateUID } from '../utils/userIdentity';

let initialized = false;

export function initAnalytics() {
    if (initialized) return;
    initialized = true;

    const posthogKey = import.meta.env.VITE_POSTHOG_KEY;
    const posthogHost = import.meta.env.VITE_POSTHOG_HOST;
    const gaMeasurementId = import.meta.env.VITE_GA_MEASUREMENT_ID;

    // PostHog — only initialize if key is available
    if (posthogKey) {
        posthog.init(posthogKey, {
            api_host: posthogHost || 'https://app.posthog.com',
            capture_pageview: false,
            capture_pageleave: true,
            disable_session_recording: true,
            ip: false,
            persistence: 'localStorage',
            bootstrap: {
                distinctID: getOrCreateUID(),
            },
        });

        posthog.identify(getOrCreateUID());
    }

    // Google Analytics — only initialize if measurement ID is available
    if (gaMeasurementId) {
        ReactGA.initialize(gaMeasurementId);
    }
}
