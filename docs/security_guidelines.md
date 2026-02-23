# Security & Data Guidelines
**Project:** English Vocabulary Learning App  
**Principle:** Offline-first. Privacy-respecting. Resilient to failure.

---

## ⚠️ CRITICAL — NON-NEGOTIABLE RULES

1. **Never collect, store, or transmit personally identifiable information (PII).**
2. **All analytics events are anonymous. The UID is the only identifier.**
3. **Never write to localStorage outside of `progressManager.js`.**
4. **All user data must survive a full page reload without loss.**
5. **The app must be fully functional with no internet connection.**

---

## 1. Anonymous User Identification

Every browser/device gets a randomly generated UID on first visit. This is the only identifier used in analytics.

### UID Generation & Persistence

```javascript
// src/utils/userIdentity.js

import { v4 as uuidv4 } from 'uuid';  // or use crypto.randomUUID()

const UID_KEY = 'app_uid';

export function getOrCreateUID() {
  let uid = localStorage.getItem(UID_KEY);
  
  if (!uid) {
    uid = crypto.randomUUID(); // Native browser API — no dependency needed
    localStorage.setItem(UID_KEY, uid);
  }
  
  return uid;
}
```

### UID Rules
- Generated once, persisted in localStorage
- Format: UUID v4 (e.g., `a1b2c3d4-e5f6-7890-abcd-ef1234567890`)
- Never linked to a name, email, device ID, or any personal attribute
- Used only to group events in PostHog/GA — so you can see a single user's journey without knowing who they are
- If the user clears localStorage, a new UID is generated — this is acceptable behavior for the MVP

---

## 2. Analytics — What to Track

### Approved Event List

All events follow this format:
```javascript
analytics.track(EVENT_NAME, { ...properties });
// Properties must NEVER include names, emails, or any PII
```

| Event Name | When | Properties |
|-----------|------|-----------|
| `app_opened` | On app load | `{ uid, tab: 'learn' }` |
| `tab_switched` | User taps a tab | `{ uid, from_tab, to_tab }` |
| `learning_session_started` | Session begins | `{ uid, batch_id, word_count }` |
| `learning_session_completed` | Session ends | `{ uid, batch_id, words_learned, duration_seconds }` |
| `learning_session_abandoned` | User exits mid-session | `{ uid, batch_id, words_completed, total_words }` |
| `review_session_started` | Review begins | `{ uid, words_due }` |
| `review_session_completed` | Review ends | `{ uid, words_reviewed, retention_rate, duration_seconds }` |
| `question_answered` | Each question | `{ uid, word_id, question_type, correct, response_time_ms }` |
| `story_opened` | User opens a story | `{ uid, story_id, level_id }` |
| `story_completed` | User finishes reading | `{ uid, story_id, duration_seconds }` |
| `story_quiz_completed` | Quiz after story | `{ uid, story_id, score_percent }` |
| `word_tapped_in_story` | Tap-to-define used | `{ uid, word_id, story_id }` |
| `grammar_hub_opened` | Grammar CTA tapped | `{ uid }` |
| `batch_unlocked` | New batch available | `{ uid, batch_id, level_id }` |
| `word_mastered` | Word reaches mastered state | `{ uid, word_id, attempts_to_master }` |
| `error_occurred` | Any caught error | `{ uid, error_type, component, message }` |
| `offline_session` | App used with no connection | `{ uid, duration_seconds }` |

### What to NEVER Track
- Names, emails, phone numbers
- Device model or OS (beyond what PostHog auto-collects)
- IP address (disable IP capture in PostHog settings)
- Geolocation beyond country level
- Free-text inputs from users
- Content of answers (only whether correct/incorrect)

---

## 3. Analytics Setup

### PostHog Configuration
```javascript
// src/analytics/setup.js

import posthog from 'posthog-js';
import { getOrCreateUID } from '../utils/userIdentity';

export function initAnalytics() {
  posthog.init(import.meta.env.VITE_POSTHOG_KEY, {
    api_host: import.meta.env.VITE_POSTHOG_HOST,
    capture_pageview: false,      // We handle this manually
    capture_pageleave: true,
    disable_session_recording: true, // No recordings — privacy
    ip: false,                    // Don't capture IP addresses
    persistence: 'localStorage',
    bootstrap: {
      distinctID: getOrCreateUID()
    }
  });

  // Identify user with anonymous UID only
  posthog.identify(getOrCreateUID());
}
```

### Analytics Helper
```javascript
// src/analytics/events.js

import posthog from 'posthog-js';
import ReactGA from 'react-ga4';
import { getOrCreateUID } from '../utils/userIdentity';

export const analytics = {
  track(event, properties = {}) {
    const uid = getOrCreateUID();
    const payload = { uid, ...properties };
    
    // PostHog
    posthog.capture(event, payload);
    
    // Google Analytics
    ReactGA.event({ category: 'App', action: event, ...properties });
  },
  
  trackError(errorType, details = {}) {
    this.track('error_occurred', {
      error_type: errorType,
      ...details
      // Never include stack traces with user data
    });
  }
};
```

### Environment Variables
```
VITE_POSTHOG_KEY=your_key_here
VITE_POSTHOG_HOST=https://app.posthog.com
VITE_GA_MEASUREMENT_ID=G-XXXXXXXXXX
```

Never hardcode analytics keys. Always use environment variables.

---

## 4. localStorage Structure

All data stored in localStorage follows this schema. Never add new keys without documenting them here.

```javascript
// Key Registry — every localStorage key used in the app

const STORAGE_KEYS = {
  UID: 'app_uid',                    // Anonymous user identifier
  PROGRESS: 'progress',              // SRS progress for all words
  THEME: 'app_theme',                // 'dark' | 'light'
  SESSION_HISTORY: 'session_history', // Last 30 sessions (circular buffer)
  SETTINGS: 'app_settings',          // User preferences
  ONBOARDING: 'onboarding_complete'  // Boolean
};
```

### Storage Size Management
localStorage is limited to ~5MB. The vocabulary content stays in JSON files (not localStorage). Only user progress state lives in localStorage.

Estimated sizes:
- Progress object (99 words): ~50KB
- Progress object (5,000 words, future): ~2.5MB
- Session history (30 sessions): ~30KB
- Settings + UID: ~1KB

**Total at scale: ~2.6MB** — safe within limits.

If approaching limits, implement a session history cleanup that keeps only the last 30 sessions.

---

## 5. Offline-First Architecture

### Core Principle
The app must be **fully functional with no internet connection.** Network availability only affects:
- Progress sync to cloud (future feature)
- Analytics event delivery (events queue locally, flush when online)

### Offline Detection
```javascript
// src/hooks/useNetworkStatus.js

export function useNetworkStatus() {
  const [isOnline, setIsOnline] = useState(navigator.onLine);
  
  useEffect(() => {
    const handleOnline = () => setIsOnline(true);
    const handleOffline = () => setIsOnline(false);
    
    window.addEventListener('online', handleOnline);
    window.addEventListener('offline', handleOffline);
    
    return () => {
      window.removeEventListener('online', handleOnline);
      window.removeEventListener('offline', handleOffline);
    };
  }, []);
  
  return isOnline;
}
```

### Offline Behavior Rules
| Feature | Offline Behavior |
|---------|-----------------|
| Learn session | ✅ Full functionality |
| Review session | ✅ Full functionality |
| Stories reading | ✅ Full functionality (content bundled) |
| Word tap-to-define | ✅ Full functionality |
| Progress saving | ✅ Saves to localStorage |
| Analytics events | ✅ Queue locally, send when online |
| Cloud sync | ❌ Disabled, show status indicator |
| Audio playback | ⚠️ Only if audio files are bundled |

### Analytics Queue for Offline
```javascript
// When offline, queue events — flush when connection restores
// PostHog handles this automatically with its local queue
// Verify posthog persistence is set to 'localStorage' (see setup above)
```

---

## 6. Error Handling — Mandatory Patterns

### Every Page Must Have an Error Boundary
```javascript
// src/components/templates/ErrorBoundary.jsx

class ErrorBoundary extends React.Component {
  state = { hasError: false, error: null };
  
  static getDerivedStateFromError(error) {
    return { hasError: true, error };
  }
  
  componentDidCatch(error, info) {
    analytics.trackError('component_crash', {
      component: info.componentStack?.split('\n')[1]?.trim(),
      error_message: error.message
      // Never log error.stack — may contain sensitive data
    });
  }
  
  render() {
    if (this.state.hasError) {
      return <ErrorScreen onRetry={() => this.setState({ hasError: false })} />;
    }
    return this.props.children;
  }
}
```

### Data Loading Error Pattern
```javascript
// Always handle three states: loading, error, success
const { data, isLoading, error } = useWordData(wordId);

if (isLoading) return <LoadingSkeleton />;
if (error) return <ErrorMessage message="Could not load word data" />;
return <WordCard word={data} />;
```

### Never Do This
```javascript
// ❌ Unhandled promise — will silently fail
fetch('/api/sync').then(res => res.json()).then(setData);

// ❌ Crashing on missing data
const translation = word.translations.primary; // word might be undefined

// ✅ Safe access
const translation = word?.translations?.primary ?? 'Translation unavailable';
```

---

## 7. Data Sanitization

The app uses pre-generated static JSON content — there is no user-generated content that gets stored back into the vocabulary data. However:

- **Never use `dangerouslySetInnerHTML`** except for the word highlighting parser, and only with content from the pre-generated JSON (not user input)
- **Always sanitize** any future user input (search queries, etc.) before using in display or storage
- **Never eval()** any content from JSON files

### The One Allowed Exception — Word Highlighting
```javascript
// This is safe because the content comes from our own pre-generated JSON
// and never from user input
function parseHighlighting(text) {
  return text.replace(/\{([^}]+)\}/g, '<mark>$1</mark>');
}

// Acceptable:
<div dangerouslySetInnerHTML={{ __html: parseHighlighting(example.en) }} />

// NOT acceptable:
<div dangerouslySetInnerHTML={{ __html: parseHighlighting(userInput) }} />
```

---

## 8. Environment & Deployment

- All sensitive keys (PostHog, GA) go in `.env.local` — never committed to git
- `.env.example` file must exist with placeholder values for all required keys
- Production build must strip all `console.log` statements
- Source maps disabled in production (don't expose code structure)

```bash
# .env.example
VITE_POSTHOG_KEY=your_posthog_project_key
VITE_POSTHOG_HOST=https://app.posthog.com
VITE_GA_MEASUREMENT_ID=G-XXXXXXXXXX
```

---

**End of Security Guidelines**
