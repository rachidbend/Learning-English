/**
 * App.jsx — Root application component
 *
 * Wires together:
 * - ErrorBoundary (crash recovery)
 * - ThemeProvider (dark/light toggle)
 * - ProgressProvider (SRS progress context)
 * - Tab-based navigation with BottomNavBar
 * - Analytics initialization
 */

import React, { useState, useEffect } from 'react';
import { AnimatePresence, motion } from 'framer-motion';

import ErrorBoundary from './components/templates/ErrorBoundary';
import { ThemeProvider } from './context/ThemeContext';
import { ProgressProvider } from './context/ProgressContext';
import BottomNavBar from './components/organisms/BottomNavBar';

import LearnPage from './pages/LearnPage';
import ReviewPage from './pages/ReviewPage';
import StoriesPage from './pages/StoriesPage';
import BankPage from './pages/BankPage';
import AccountPage from './pages/AccountPage';

import { initAnalytics } from './analytics/setup';
import { analytics } from './analytics/events';
import { EVENTS } from './constants/analyticsEvents';
import { duration, easing, prefersReducedMotion } from './styles/motion';

import DevPanel from './devtools/DevPanel';

const PAGE_MAP = {
  learn: LearnPage,
  review: ReviewPage,
  stories: StoriesPage,
  bank: BankPage,
  account: AccountPage,
};

function App() {
  const [activeTab, setActiveTab] = useState('learn');

  // Initialize analytics once on mount
  useEffect(() => {
    initAnalytics();
    analytics.track(EVENTS.APP_OPENED, { tab: 'learn' });
  }, []);

  const ActivePage = PAGE_MAP[activeTab] || LearnPage;
  const reduced = prefersReducedMotion();

  return (
    <ErrorBoundary>
      <ThemeProvider>
        <ProgressProvider>
          <div
            className="App"
            style={{
              maxWidth: '480px',
              margin: '0 auto',
              minHeight: '100vh',
              position: 'relative',
            }}
          >
            <AnimatePresence mode="wait">
              <motion.div
                key={activeTab}
                initial={reduced ? { opacity: 1 } : { opacity: 0, x: 8 }}
                animate={{ opacity: 1, x: 0 }}
                exit={reduced ? { opacity: 0 } : { opacity: 0, x: -8 }}
                transition={{
                  duration: reduced ? 0 : duration.fast,
                  ease: easing.standard,
                }}
                style={{ paddingBottom: '80px' }}
              >
                <ActivePage onSwitchTab={setActiveTab} />
              </motion.div>
            </AnimatePresence>

            <BottomNavBar activeTab={activeTab} onTabChange={setActiveTab} />

            {/* Dev panel overlay — only renders in development mode */}
            <DevPanel />
          </div>
        </ProgressProvider>
      </ThemeProvider>
    </ErrorBoundary>
  );
}

export default App;
