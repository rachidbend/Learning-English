/**
 * analytics/events.js — Analytics helper object
 *
 * Import and use this object everywhere in the app.
 * Never call PostHog or GA directly from components.
 */

import posthog from 'posthog-js';
import ReactGA from 'react-ga4';
import { getOrCreateUID } from '../utils/userIdentity';

export const analytics = {
    /**
     * Track a named event with properties.
     * Sends to both PostHog and Google Analytics.
     */
    track(event, properties = {}) {
        const uid = getOrCreateUID();
        const payload = { uid, ...properties };

        // PostHog
        try {
            if (posthog.__loaded) {
                posthog.capture(event, payload);
            }
        } catch (e) {
            // Silently fail — analytics should never crash the app
        }

        // Google Analytics
        try {
            ReactGA.event({ category: 'App', action: event, ...properties });
        } catch (e) {
            // Silently fail
        }
    },

    /**
     * Track an error event. Never includes stack traces (may contain sensitive data).
     */
    trackError(errorType, details = {}) {
        this.track('error_occurred', {
            error_type: errorType,
            ...details,
        });
    },
};
