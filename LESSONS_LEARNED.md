# Lessons Learned

This file documents problems encountered and solutions discovered during development. Check this file before marking tasks complete to avoid repeating past mistakes.

---

## 2025-01-15 - Example: State Update Not Triggering Re-render

**Problem**: Component wasn't re-rendering after state update in MobX store. Spent 2 hours debugging why UI wasn't updating.

**Solution**: Needed to wrap component with `observer()` from `mobx-react-lite`. The component was accessing observable state but wasn't marked as an observer.

**Why**: MobX requires components that read observable state to be wrapped with `observer()` to track dependencies and trigger re-renders. Without it, React doesn't know to re-render when the observable changes.

**Files**: `src/components/UserProfile.jsx`, `src/stores/UserStore.js`

---

## [Date] - [Brief Title]

**Problem**: [What went wrong or what was the challenge]

**Solution**: [What actually worked]

**Why**: [Root cause explanation - why did this happen?]

**Files**: [Affected files, components, or areas of the codebase]
