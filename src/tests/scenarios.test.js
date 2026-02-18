/**
 * scenarios.test.md
 *
 * Manual test scenarios for the active recall system.
 * To be executed by a human tester in the browser.
 *
 * Pre-requisites:
 * - npm run dev  (or npx vite --port 5175)
 * - Navigate to http://localhost:5175/?dev=true
 * - DevPanel accessible via gear icon or Ctrl+Shift+D
 */

// ──────────────────────────────────────────
// SCENARIO 1: Complete Learning Flow (New User)
// ──────────────────────────────────────────
//
// Setup:
//   DevPanel → Session tab → "Factory Reset" (clears all progress)
//   Refresh page
//
// Steps:
//   1. Dashboard should show "Learn New Words" button (no reviews due)
//   2. Click "Learn New Words" → navigates to /learn
//   3. Select word count (e.g. 3), click Start
//   4. See first WordCard, click "I've studied this"
//   5. Answer quiz question (Step 0)
//   6. Repeat for all 3 words
//   7. Enter waiting phase → timer shown
//   8. DevPanel → Time → "+11 Minutes" → Step 1 triggers
//   9. Answer Step 1 for all words
//  10. DevPanel → Time → "+46 Minutes" → Step 2 triggers
//  11. Answer Step 2 → should show "Learning Complete"
//  12. Return to Dashboard → stats updated
//
// Expected: 3 words now in review, stats show 3 total
// ──────────────────────────────────────────

// ──────────────────────────────────────────
// SCENARIO 2: Review Session Flow
// ──────────────────────────────────────────
//
// Setup:
//   DevPanel → Scenarios → "Generate Test Data" (creates 5 words due)
//
// Steps:
//   1. Dashboard shows "Review Words (5)"
//   2. Click "Review Words" → /review
//   3. Answer questions, mix some correct and incorrect
//   4. No consecutive same-word questions
//   5. Session complete screen shows accurate stats
//   6. Return to Dashboard → due count updated
//   7. DevPanel → Words → inspect word → check confidence/interval
//
// Expected: All words processed, intervals updated
// ──────────────────────────────────────────

// ──────────────────────────────────────────
// SCENARIO 3: First Two Weeks Schedule
// ──────────────────────────────────────────
//
// Setup:
//   Have a word in review at first_two_weeks_index = 0
//
// Steps:
//   1. Review word, answer GOOD
//   2. Check: index should advance to 1, interval = 2 days
//   3. DevPanel → Make Due Now → review again
//   4. Repeat until index = 7
//   5. Next GOOD answer: is_in_first_two_weeks → false
//
// Expected: Clean transition through all 7 schedule positions
// ──────────────────────────────────────────

// ──────────────────────────────────────────
// SCENARIO 4: Lapse and Relearning
// ──────────────────────────────────────────
//
// Setup:
//   Word with 30-day interval in review
//
// Steps:
//   1. Review word, answer all wrong → AGAIN quality
//   2. Check: card_state = 'relearning', lapses = 1
//   3. Review again (relearning), answer correctly
//   4. Check: back to 'review', interval < 30 days
//
// Expected: Lapse → relearn → review with reduced interval
// ──────────────────────────────────────────

// ──────────────────────────────────────────
// SCENARIO 5: Time Simulation
// ──────────────────────────────────────────
//
// Steps:
//   1. DevPanel → Time → "+1 Day"
//   2. Refresh Dashboard → more words due
//   3. DevPanel → Time → "+7 Days" (total 8)
//   4. Even more words due
//   5. DevPanel → Time → "Reset to Real Time"
//   6. Counts return to normal
//
// Expected: Time simulation correctly affects due calculations
// ──────────────────────────────────────────

// ──────────────────────────────────────────
// SCENARIO 6: Progress Persistence
// ──────────────────────────────────────────
//
// Steps:
//   1. Learn 2 words (complete Step 0)
//   2. Refresh page (F5)
//   3. Dashboard shows updated stats
//   4. Close and reopen browser
//   5. Progress is intact
//
// Expected: localStorage persistence works
// ──────────────────────────────────────────

// ──────────────────────────────────────────
// SCENARIO 7: Edge Cases
// ──────────────────────────────────────────
//
// A. No reviews due → Dashboard shows "All caught up"
// B. No new words → "Learn" button shows 0 available
// C. Very long interval → capped at 180 days
// D. Very low ease → never below 1.3
//
// ──────────────────────────────────────────
