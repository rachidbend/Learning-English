# English Learning App - Mobile POC

Mobile-first proof of concept for Oxford 3000 vocabulary learning.

## Tech Stack
- React 19
- Vite
- Tailwind CSS

## Mobile Optimization
Designed specifically for mobile viewports (375px - 428px).
- **Viewport**: Locked to device width, no zoom
- **Touch**: Optimized tap targets (min 44px)
- **Layout**: Fluid full-width, no desktop optimization

## Setup

1. **Install dependencies**
   ```bash
   npm install
   ```

2. **Start development server**
   ```bash
   npm run dev
   ```

3. **Build for production**
   ```bash
   npm run build
   ```

4. **Preview build**
   ```bash
   npm run preview
   ```

## Project Structure
- `src/components`: Reusable UI components
- `src/pages`: Route components (views)
- `src/data`: Static data (words, quizzes)
- `src/context`: React context definitions
- `src/utils`: Helper functions

v0.1.0-MVP
