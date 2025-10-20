# [Project Name] - Project Tasks

## 🔧 Task Management System

### Why File-Based (Not TodoWrite Tool)
- **Persistence**: Tasks survive conversation context limits and compaction
- **Visibility**: User can see progress in their editor/IDE
- **Portability**: Tasks documented in git, shareable across team/sessions
- **Control**: User maintains single source of truth

### Task Status Conventions
Use these exact markers in markdown checkboxes:
- `[ ]` - Not started
- `[ ] 🚧` - **IN PROGRESS** (marks active phase - auto-loaded)
- `[x]` - Completed

### ⚠️ CRITICAL: Keep Files Updated AS YOU WORK
**DO NOT wait until end of conversation to update task files!**

Update task status in **REAL-TIME** as you progress:
1. **When starting a task**: Change `[ ]` to `[ ] 🚧` immediately
2. **When completing a task**: Change `[ ] 🚧` to `[x]` immediately
3. **When finishing a phase**: Update phase status in this file AND the phase file

**Why this matters**:
- If conversation hits context limit, progress is preserved
- User can see current status at any time
- Next session picks up exactly where you left off
- No lost work, no confusion about what's done

### Before Marking ANY Task Complete

**HARD REQUIREMENT**: Check `/docs/LESSONS_LEARNED.md` before completing tasks

1. Read `/docs/LESSONS_LEARNED.md` (if it exists)
2. If file has content: Verify your changes don't violate documented lessons
3. If empty or doesn't exist: Proceed normally
4. **NEVER** mark a task complete without this check

### 3-Strike Rule: When to Document

Add to `/docs/LESSONS_LEARNED.md` when:
- After 3 failed attempts that finally succeed
- Discovering a subtle bug or anti-pattern
- Finding a better approach than initial implementation
- External research solves a blocking problem
- Any "gotcha" worth remembering

**Format**:
```markdown
## [Date] - [Brief Title]
**Problem**: [What went wrong]
**Solution**: [What actually worked]
**Why**: [Root cause explanation]
**Files**: [Affected files/areas]
```

### Auto-Detection & Workflow
1. Read this file to find phase marked `[ ] 🚧`
2. Auto-load that phase file from `/docs/tasks/phase-*.md`
3. Work on tasks, **updating status in real-time**
4. **Before marking phase complete**:
   - Check `/docs/LESSONS_LEARNED.md` for any lessons from this phase
   - **Ask user for verification** of completed work
5. **After user approves**:
   - **Update `/docs/ARCHITECTURE.md`** with any architectural changes:
     - New files/directories created
     - New stores, routes, or services added
     - API endpoints added/modified
     - Data flow changes
     - Dependencies added
     - Update "Last Updated" date and phase number
   - Mark phase complete in this file AND phase file
   - Move `[ ] 🚧` to next phase

---

## Project Phases

### Phase 1: [Phase Name]
**Status**: [x] Complete
**File**: `/docs/tasks/phase-01-name.md`

[Brief 1-2 sentence summary of what was accomplished]

---

### Phase 2: [Phase Name]
**Status**: [ ] 🚧 IN PROGRESS
**File**: `/docs/tasks/phase-02-name.md`

[Brief summary]

**Completed**:
- ✅ [Major item 1]
- ✅ [Major item 2]

**Remaining**:
- [Item 1]
- [Item 2]

---

### Phase 3: [Phase Name]
**Status**: [ ] Not Started
**File**: `/docs/tasks/phase-03-name.md`

[Brief summary]

---

## Notes
- **Context Optimization**: Only active phase file (`[ ] 🚧`) is loaded
- **Update in real-time**: Don't wait until end to update task status
- **Check /docs/LESSONS_LEARNED.md**: Before completing any task
- **Manual testing**: User verification between major phases
