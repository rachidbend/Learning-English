# Design Guidelines
**Project:** English Vocabulary Learning App  
**Philosophy:** A professional learning tool — not a game, not a toy.  
**Aesthetic:** Premium, focused, calm confidence. Think professional SaaS, not edtech gamification.

---

## ⚠️ CRITICAL

- Never use bright colors as primary UI. Accents only.
- Never add points, XP, gems, coins, or leaderboards.
- Never add confetti or excessive celebration animations.
- Always respect the user's intelligence — clean, direct, no hand-holding clutter.
- Dark mode is the **primary** theme. Light mode is secondary.

---

## 1. Color Tokens

Use these exact values. Never hardcode colors outside of this token system.

### Base Palette
```css
:root {
  /* Backgrounds */
  --color-bg-primary: #0f1b2d;       /* Main app background */
  --color-bg-secondary: #1a2a3f;     /* Cards, panels */
  --color-bg-tertiary: #243447;      /* Elevated surfaces, modals */
  --color-bg-input: #1e3045;         /* Input fields */

  /* Borders */
  --color-border-subtle: #2a3f58;    /* Dividers, card outlines */
  --color-border-active: #3d5a7a;    /* Focused inputs, selected states */

  /* Text */
  --color-text-primary: #f0f4f8;     /* Headings, primary content */
  --color-text-secondary: #8fa8c4;   /* Subtext, labels, metadata */
  --color-text-muted: #4a6580;       /* Placeholders, disabled */
  --color-text-inverse: #0f1b2d;     /* Text on light backgrounds */

  /* Accent — Green (Primary Action) */
  --color-accent-primary: #4ade80;   /* CTA buttons, progress fills */
  --color-accent-primary-dim: #166534; /* Subtle green backgrounds */

  /* Accent — Gold (Achievement, Milestones) */
  --color-accent-gold: #fbbf24;      /* Streaks, ranks, milestones */
  --color-accent-gold-dim: #451a03;  /* Subtle gold backgrounds */

  /* Accent — Blue (Information, Navigation) */
  --color-accent-blue: #60a5fa;      /* Links, info states, active tab */
  --color-accent-blue-dim: #1e3a5f;  /* Subtle blue backgrounds */

  /* Semantic */
  --color-success: #4ade80;
  --color-warning: #fbbf24;
  --color-error: #f87171;
  --color-error-dim: #450a0a;
  --color-neutral: #8fa8c4;
}
```

### Light Mode Overrides
```css
[data-theme="light"] {
  --color-bg-primary: #f0f4f8;
  --color-bg-secondary: #ffffff;
  --color-bg-tertiary: #e8eef5;
  --color-bg-input: #ffffff;
  --color-border-subtle: #dde5ef;
  --color-border-active: #93b5d4;
  --color-text-primary: #0f1b2d;
  --color-text-secondary: #4a6580;
  --color-text-muted: #8fa8c4;
  --color-text-inverse: #f0f4f8;
}
```

---

## 2. Typography

```css
:root {
  /* Font Families */
  --font-primary: 'Inter', system-ui, sans-serif;     /* All UI text */
  --font-arabic: 'Cairo', 'Noto Sans Arabic', sans-serif; /* Arabic text only */
  --font-mono: 'JetBrains Mono', monospace;           /* IPA pronunciation */

  /* Scale */
  --text-xs: 0.75rem;    /* 12px — metadata, timestamps */
  --text-sm: 0.875rem;   /* 14px — secondary labels, captions */
  --text-base: 1rem;     /* 16px — body text, default */
  --text-lg: 1.125rem;   /* 18px — card headings */
  --text-xl: 1.25rem;    /* 20px — section titles */
  --text-2xl: 1.5rem;    /* 24px — page headings */
  --text-3xl: 1.875rem;  /* 30px — hero text */
  --text-4xl: 2.25rem;   /* 36px — display numbers (stats) */

  /* Weights */
  --weight-regular: 400;
  --weight-medium: 500;
  --weight-semibold: 600;
  --weight-bold: 700;

  /* Line Heights */
  --leading-tight: 1.25;   /* Headings */
  --leading-normal: 1.5;   /* Body */
  --leading-relaxed: 1.75; /* Reading content (stories) */
}
```

### Arabic Text Rules
- Always use `--font-arabic` for Arabic content
- Set `direction: rtl` only on the Arabic text element, never on the whole page
- Arabic translations appear below English, in `--color-text-secondary`
- Font size for Arabic should be 1 step larger than its paired English text (Arabic script reads smaller at the same px size)

---

## 3. Spacing System

Follow an 8px base grid. Only use these values.

```css
:root {
  --space-1: 4px;
  --space-2: 8px;
  --space-3: 12px;
  --space-4: 16px;
  --space-5: 20px;
  --space-6: 24px;
  --space-8: 32px;
  --space-10: 40px;
  --space-12: 48px;
  --space-16: 64px;
  --space-20: 80px;
}
```

**Page padding:** 16px horizontal on mobile (--space-4). Never less.  
**Card padding:** 20px (--space-5) minimum, 24px (--space-6) preferred.  
**Section gap:** 24px (--space-6) between major sections.  
**Element gap:** 12px (--space-3) between related elements, 8px (--space-2) between tightly paired elements.

---

## 4. Border Radius

```css
:root {
  --radius-sm: 8px;    /* Tags, badges, small chips */
  --radius-md: 12px;   /* Buttons, inputs, small cards */
  --radius-lg: 16px;   /* Standard cards */
  --radius-xl: 24px;   /* Large cards, modals, bottom sheets */
  --radius-full: 9999px; /* Pills, avatars, circular elements */
}
```

**The signature radius is --radius-xl (24px).** All primary cards use this. It is the visual identity of the app.

---

## 5. Elevation & Shadows

```css
:root {
  --shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.3);
  --shadow-md: 0 4px 12px rgba(0, 0, 0, 0.4);
  --shadow-lg: 0 8px 24px rgba(0, 0, 0, 0.5);
  --shadow-glow-green: 0 0 20px rgba(74, 222, 128, 0.2);  /* Active CTA */
  --shadow-glow-gold: 0 0 20px rgba(251, 191, 36, 0.2);   /* Achievement */
}
```

Don't use shadows to create depth. Use background color differences between layers instead. Shadows are for **interactive feedback** (hover, active states) and **floating elements** (modals, tooltips).

---

## 6. Motion Tokens

All animations must use these values. No arbitrary durations or easing.

```javascript
// src/styles/motion.js — import these into Framer Motion variants

export const duration = {
  instant: 0.1,    // 100ms — immediate feedback (button press)
  fast: 0.2,       // 200ms — UI transitions (tab switch, toggle)
  normal: 0.3,     // 300ms — standard transitions (card appear, modal)
  slow: 0.5,       // 500ms — emphasis transitions (page enter)
  celebration: 0.8 // 800ms — milestone achievements only
};

export const easing = {
  standard: [0.4, 0, 0.2, 1],      // Material standard — most UI
  decelerate: [0, 0, 0.2, 1],      // Elements entering the screen
  accelerate: [0.4, 0, 1, 1],      // Elements leaving the screen
  spring: { type: 'spring', stiffness: 400, damping: 30 },  // Bouncy interactions
  springSmooth: { type: 'spring', stiffness: 200, damping: 25 } // Smooth spring
};
```

### Motion Rules
- **Tab switches:** 200ms fade + 8px slide, `easing.standard`
- **Cards appearing:** 300ms fade + 12px slide up, `easing.decelerate`, staggered by 50ms
- **Button press:** Scale to 0.96, 100ms, `easing.standard`
- **Correct answer:** Green flash, 200ms, then card advance
- **Wrong answer:** Horizontal shake, 300ms (3 cycles × 100ms), `easing.spring`
- **Milestone (word mastered):** Glow pulse on card, 800ms, one time only
- **Bottom sheet:** Slide up from bottom, 300ms, `easing.decelerate`
- **Modal:** Fade + scale from 0.95 to 1, 300ms, `easing.decelerate`
- **Never animate** layout shifts, font size changes, or color-only transitions over 200ms

### Reduced Motion
Always respect `prefers-reduced-motion`. When enabled, replace all animations with instant opacity changes (no movement).

```javascript
const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
```

---

## 7. Component Patterns

### Card
```
Background: --color-bg-secondary
Border: 1px solid --color-border-subtle
Border Radius: --radius-xl (24px)
Padding: --space-5 (20px) or --space-6 (24px)
Hover: background shifts to --color-bg-tertiary, 200ms
```

### Primary Button (CTA)
```
Background: linear-gradient(135deg, #4ade80, #22c55e)
Text: --color-text-inverse, --weight-semibold
Border Radius: --radius-md (12px)
Padding: 14px 24px
Hover: scale(1.02), --shadow-glow-green, 200ms
Active: scale(0.97), 100ms
Disabled: opacity 0.4, no hover effects
```

### Secondary Button
```
Background: --color-bg-tertiary
Border: 1px solid --color-border-active
Text: --color-text-primary
Border Radius: --radius-md
Same hover/active behavior as primary
```

### Input Field
```
Background: --color-bg-input
Border: 1px solid --color-border-subtle
Border Radius: --radius-md
Padding: 12px 16px
Focus: border changes to --color-accent-blue, 200ms transition
```

### Bottom Navigation Bar
```
Background: --color-bg-secondary
Border Top: 1px solid --color-border-subtle
Height: 64px
Icon size: 24px
Active tab: --color-accent-blue icon + label
Inactive tab: --color-text-muted icon, no label
Transition: icon color + label fade, 200ms
```

### Bottom Sheet (for tap-to-define, word details)
```
Background: --color-bg-tertiary
Border Radius: --radius-xl top corners only (24px 24px 0 0)
Drag handle: 4px × 32px, --color-border-active, centered at top
Max height: 60vh
Overlay: rgba(0, 0, 0, 0.6) behind sheet
```

---

## 8. Progress Indicators

### Mini-Grid (word progress in batch)
- Each cell = one word in the batch
- Color states: empty (--color-border-subtle), learning (--color-accent-blue-dim), mastered (--color-accent-primary-dim with green dot)
- Cell size: 8px × 8px, 4px gap, 4px border radius
- Never show word-by-word labels on the grid — it's a visual density indicator only

### Progress Bar
```
Background track: --color-border-subtle
Fill: --color-accent-primary (green)
Height: 4px for compact, 8px for featured
Border Radius: --radius-full
Animated fill: width transition, 600ms, easing.decelerate
```

### Streak / Stat Badges
```
Background: --color-accent-gold-dim
Border: 1px solid rgba(251, 191, 36, 0.3)
Text: --color-accent-gold
Border Radius: --radius-sm (8px)
Icon: flame emoji or SVG, 16px
```

---

## 9. Illustrations

- **Style:** Flat, minimal, friendly — consistent character design across all screens
- **Format:** SVG only. No PNG, no JPEG for illustrations.
- **Colors:** Use the app's color palette. No illustrations with colors outside the design system.
- **Usage:** One illustration per empty state, one per story card, one per level card in Stories
- **Size:** Never exceed 200px height for decorative illustrations, 300px for hero illustrations
- **Offline:** All illustrations must be bundled in the app. No remote image loading for core UI.

---

## 10. Arabic Content Display

- Arabic text always flows RTL, English always LTR — never mix direction on the same line
- Show English word prominently (larger, primary color), Arabic translation beneath (smaller, secondary color)
- In Stories reader: English is the primary reading text, Arabic translation appears in the bottom sheet when a word is tapped
- IPA pronunciation uses `--font-mono` in `--color-text-muted`
- Never auto-translate — always use pre-generated translations from vocabulary_data.json

---

## 11. Responsive Breakpoints

This is a **mobile-first** app. Design for 390px first.

```css
/* Mobile first (default): 360px - 430px */
/* Tablet: */
@media (min-width: 768px) { }
/* Desktop (web fallback): */
@media (min-width: 1024px) { }
```

On desktop, constrain the app to a max-width of 480px centered on screen — it should always feel like a mobile app, not a desktop dashboard.

---

## 12. Empty States

Every tab needs a designed empty state. Never show a blank screen.

**Pattern:**
- Centered illustration (SVG, under 120px)
- Short headline (what's missing)
- One-line explanation (what to do about it)
- One CTA button pointing to the action

**Example — Review tab with no due words:**
> Illustration: resting books  
> Headline: "You're all caught up"  
> Subtext: "No words due for review. Come back tomorrow."  
> No CTA needed here — no action to take

---

**End of Design Guidelines**
