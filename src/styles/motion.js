/**
 * motion.js — Motion tokens for Framer Motion
 *
 * All durations, easings, and spring configs defined centrally.
 * No component should define its own arbitrary duration or easing value.
 */

export const duration = {
    instant: 0.1,      // 100ms — immediate feedback (button press)
    fast: 0.2,         // 200ms — UI transitions (tab switch, toggle)
    normal: 0.3,       // 300ms — standard transitions (card appear, modal)
    slow: 0.5,         // 500ms — emphasis transitions (page enter)
    celebration: 0.8,  // 800ms — milestone achievements only
};

export const easing = {
    standard: [0.4, 0, 0.2, 1],       // Material standard — most UI
    decelerate: [0, 0, 0.2, 1],       // Elements entering the screen
    accelerate: [0.4, 0, 1, 1],       // Elements leaving the screen
    spring: { type: 'spring', stiffness: 400, damping: 30 },   // Bouncy interactions
    springSmooth: { type: 'spring', stiffness: 200, damping: 25 }, // Smooth spring
};

/**
 * Returns true if user prefers reduced motion.
 */
export const prefersReducedMotion = () => {
    if (typeof window === 'undefined') return false;
    return window.matchMedia('(prefers-reduced-motion: reduce)').matches;
};

/**
 * Returns Framer Motion props that respect reduced motion preferences.
 * When reduced motion is enabled, replaces all animations with simple opacity fades.
 *
 * @param {object} motionProps - Standard Framer Motion props (initial, animate, exit, transition)
 * @returns {object} Safe motion props
 */
export const getMotionProps = (motionProps = {}) => {
    if (prefersReducedMotion()) {
        return {
            initial: { opacity: 0 },
            animate: { opacity: 1 },
            exit: { opacity: 0 },
            transition: { duration: duration.instant },
        };
    }
    return motionProps;
};
