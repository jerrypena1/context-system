# 🚀 NEW PROJECT - Bootstrap Mode

**⚠️ THIS SECTION WILL BE REMOVED after initial setup**

---

## First Conversation Instructions

**Step 1: Ask about the project** (free-form conversation)

> "Tell me about this project - what are we building?"

Gather information about:
- Project goals & main features
- Tech stack (frontend, backend, database, etc.)
- Key constraints or architectural decisions
- Target users or use cases
- Expected complexity (simple script vs large app)

**Step 2: Determine project phases**

Based on project complexity, suggest appropriate phases:
- Small project: 3-5 phases (Setup, Core Features, Polish, Testing)
- Medium project: 5-7 phases (Setup, Foundation, Features, Integration, Polish, Testing)
- Large project: 8-10 phases (Setup, Foundation, Core, Advanced Features, Auth, API Integration, Polish, Optimization, Testing, Deployment)

**Step 3: Create project structure**

After gathering sufficient information:

1. **Create directories**:
   ```bash
   mkdir -p docs/tasks
   ```

2. **Read and customize templates from `~/.claude/templates/`**:
   - Read `~/.claude/templates/_tasks.md`
   - Customize with project-specific phases
   - Write to `/docs/_tasks.md`

3. **Create ARCHITECTURE.md**:
   - Read `~/.claude/templates/ARCHITECTURE.md`
   - Fill in with user's tech stack and system overview
   - Write to `/docs/ARCHITECTURE.md`

4. **Create phase files**:
   - Read `~/.claude/templates/phase-template.md`
   - Create one file per phase in `/docs/tasks/`
   - Name: `phase-01-setup.md`, `phase-02-foundation.md`, etc.
   - Customize each with phase-specific tasks

5. **Create LESSONS_LEARNED.md**:
   - Read `~/.claude/templates/LESSONS_LEARNED.md`
   - Write to `/docs/LESSONS_LEARNED.md`

6. **ASK PERMISSION**:
   > "I've created the project structure:
   > - `/docs/_tasks.md` with [X] phases
   > - `/docs/ARCHITECTURE.md` with your tech stack
   > - `/docs/tasks/phase-*.md` files for each phase
   > - `/docs/LESSONS_LEARNED.md` (empty template)
   >
   > Now I'll update this CLAUDE.md file with project-specific guidance. Proceed?"

7. **After user approves**:
   - **REMOVE** this entire bootstrap section
   - **REPLACE WITH** project-specific content:

```markdown
# [Project Name] - Project Guide

## Project Overview
[2-3 sentence summary based on conversation]

**Architecture**: See `/docs/ARCHITECTURE.md` for system overview, project structure, data flow, and technical details.

---

## Dos & Don'ts

### [Category based on project - e.g., State Management]
- ✅ [Project-specific pattern from conversation]
- ❌ [Anti-pattern to avoid]

### [Add 3-5 categories based on project complexity]

---

## Tech Stack
[List from user conversation]

---

## Current Phase
**Phase 1: [Name]** (🚧 IN PROGRESS)
- **File**: `/docs/tasks/phase-01-*.md`
- **Status**: Just started

---

## Key Files
[To be filled in as project develops]
```

---

## If Templates Are Missing

If `~/.claude/templates/` doesn't exist or is missing files:

> "I can't find the template files in `~/.claude/templates/`.
>
> Please set them up first:
> ```bash
> mkdir -p ~/.claude/templates
> cp /path/to/source/docs_template/* ~/.claude/templates/
> ```
>
> Or would you like me to create a minimal project setup without templates?"

---

## Notes

- Templates location: `~/.claude/templates/`
- Always ask for user confirmation before modifying CLAUDE.md
- Customize phases based on project size (don't over-engineer small projects)
- Mark Phase 1 as `[ ] 🚧 IN PROGRESS` by default
