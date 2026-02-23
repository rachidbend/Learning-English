# Developer Guidelines
**Project:** English Vocabulary Learning App (Web MVP → Flutter)  
**Stack:** React + Vite, Tailwind CSS, Framer Motion, PostHog, Google Analytics  
**Last Updated:** February 2026  

---

## ⚠️ CRITICAL — READ BEFORE WRITING ANY CODE

1. **Read this entire document before starting any task.**
2. **Present a technical plan for approval before writing code.**
3. **Never modify the SRS engine or vocabulary data structure without explicit instruction.**
4. **Every component must follow Atomic Design. No exceptions.**

---

## 1. Project Architecture

### Folder Structure
```
src/
├── components/
│   ├── atoms/          # Smallest UI units (Button, Badge, Icon, Tag)
│   ├── molecules/      # Combinations of atoms (WordCard, QuizOption, StatBadge)
│   ├── organisms/      # Complex sections (BatchGrid, StoryReader, ReviewSession)
│   └── templates/      # Page-level layout wrappers (TabLayout, ModalLayout)
├── pages/              # One file per tab (LearnPage, ReviewPage, StoriesPage, BankPage, AccountPage)
├── hooks/              # Custom React hooks only — no logic inside components
├── engine/             # ⚠️ PROTECTED — SRS logic lives here, do not modify
├── data/               # Static JSON content — do not modify structure
├── utils/              # Pure helper functions (formatters, parsers, calculators)
├── analytics/          # PostHog and GA event definitions only
├── styles/             # Global CSS, design tokens
└── constants/          # App-wide constants (routes, config, event names)
```

### Atomic Design Rules
- **Atoms:** Single responsibility. No internal state except UI state (hover, focus). Under 50 lines.
- **Molecules:** Combine 2–4 atoms. May have local state. Under 80 lines.
- **Organisms:** Compose molecules into a feature section. Extract all logic into custom hooks. Under 150 lines.
- **Pages:** Import organisms and templates only. No logic, no styling. Under 80 lines.

---

## 2. The 150-Line Rule

**No component file may exceed 150 lines.**

If a component is approaching 150 lines:
1. Extract business logic into a custom hook (`useWordSession`, `useBatchProgress`, etc.)
2. Extract repeated JSX patterns into a sub-component
3. Move constants to `src/constants/`

This is non-negotiable. A file that is hard to read is a file that will break.

---

## 3. Custom Hooks Pattern

All logic must live in hooks, not components.

```javascript
// ✅ CORRECT
// hooks/useLearningSession.js
export function useLearningSession(words) {
  const [currentIndex, setCurrentIndex] = useState(0);
  const [answers, setAnswers] = useState([]);
  // ... all session logic here
  return { currentWord, handleAnswer, sessionComplete, progress };
}

// LearnPage.jsx uses the hook, renders the UI
const { currentWord, handleAnswer } = useLearningSession(words);

// ❌ WRONG — logic inside component
function LearnPage() {
  const [currentIndex, setCurrentIndex] = useState(0);
  function handleAnswer(answer) { /* logic here */ }
  // This grows into a God Component
}
```

---

## 4. Protected Files — DO NOT MODIFY

These files may only be changed with explicit user instruction:

| File | Reason |
|------|--------|
| `src/engine/srsEngine.js` | Core SRS algorithm — tested and calibrated |
| `src/data/vocabulary_data.json` | Production data structure — changing breaks everything |
| `src/engine/sessionBuilder.js` | Session logic tied to SRS algorithm |
| `src/engine/progressManager.js` | Handles all user progress persistence |

If a task requires touching these files, **stop and ask for explicit confirmation first.**

---

## 5. State Management

This app uses **no external state library** (no Redux, no Zustand). Keep state local unless it genuinely needs to be shared.

```
Local UI state     → useState inside component
Feature logic      → Custom hook (useReviewSession, useBatchProgress)
Cross-tab state    → React Context (only for: user progress, theme, UID)
Persistent state   → localStorage via progressManager.js only
```

**Never write directly to localStorage outside of `progressManager.js`.**

---

## 6. Data Access Pattern

Always use the established patterns. Never re-invent data loading.

```javascript
// Loading vocabulary
import vocabularyData from '../data/vocabulary_data.json';
const words = vocabularyData.words;

// Loading user progress
import { loadProgress, saveProgress, getAllProgress } from '../engine/progressManager';

// Never do this:
const raw = localStorage.getItem('progress'); // ❌ bypass progressManager
```

---

## 7. Component Naming Conventions

| Type | Convention | Example |
|------|-----------|---------|
| Component files | PascalCase | `WordCard.jsx`, `BatchGrid.jsx` |
| Hook files | camelCase with "use" | `useLearningSession.js` |
| Utility files | camelCase | `formatDate.js`, `calculateStreak.js` |
| Constant files | camelCase | `analyticsEvents.js`, `appRoutes.js` |
| CSS modules | Match component name | `WordCard.module.css` |

---

## 8. Dependencies — Approved List

Only use packages from this list. Do not install new dependencies without asking.

| Package | Purpose |
|---------|---------|
| `react` + `vite` | Framework |
| `tailwindcss` | Styling (utility classes only) |
| `framer-motion` | Animations |
| `posthog-js` | Product analytics |
| `react-ga4` | Google Analytics |
| `recharts` | Charts in Bank & Stats |

**Never install:** Redux, Zustand, Axios (use fetch), Lodash (use native JS), Moment.js (use date-fns or native).

---

## 9. Routing & Navigation

Navigation is handled via a Bottom Tab Bar. Use React state for active tab, not a router, for the MVP.

```javascript
// App.jsx — simple tab state
const [activeTab, setActiveTab] = useState('learn');
const tabs = ['learn', 'review', 'stories', 'bank', 'account'];
```

No `react-router-dom` for tab switching. Only introduce routing if a page requires a deep link (e.g., a specific story).

---

## 10. Plan-First Workflow — MANDATORY

**Phase 1 — Blueprint (always required):**
Before writing any code, present:
- Which files will be created or modified
- Component tree for new UI
- Hook design (what state, what it returns)
- Any data structure changes (must be flagged immediately)
- Estimated complexity

**Phase 2 — Execution:**
Only after the user approves the plan.

---

## 11. Comments & Documentation

```javascript
// ✅ Comment WHY, not WHAT
// Offset by 1 to account for zero-indexed SRS steps
const step = card.learning_step + 1;

// ❌ Useless comment
// Add 1 to learning_step
const step = card.learning_step + 1;
```

Every custom hook must have a JSDoc comment at the top describing its purpose, parameters, and return value.

---

## 12. Error Handling — Mandatory Patterns

Every data load must handle failure gracefully:

```javascript
// ✅ Always wrap async operations
try {
  const data = await fetchStoryContent(storyId);
  setStory(data);
} catch (error) {
  setError('Could not load story. Check your connection.');
  // Log to analytics — but never log PII
  analytics.trackError('story_load_failed', { storyId });
}
```

Every page must have an error boundary. No page should be able to crash the entire app.

---

## 13. Performance Rules

- No synchronous heavy computation on the main thread
- Lazy load Stories content (don't preload all stories at app start)
- Memoize expensive list renders with `useMemo` and `React.memo`
- Never block the UI during localStorage reads — they are synchronous by nature, keep them small

---

**End of Developer Guidelines**
