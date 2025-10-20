---
description: Re-bootstrap existing project to new optimized structure (preserves all progress)
---

# Re-Bootstrap Project to New Structure

**Purpose**: Re-bootstrap existing project from old single-file system to new optimized phase-based structure. Preserves all progress, tasks, and lessons learned.

---

## Step 1: Analyze Existing Project

Check what files exist:
- `_tasks.md` or `/docs/_tasks.md` (old huge file)
- `LESSONS_LEARNED.md` or `/docs/LESSONS_LEARNED.md` (may be large)
- `CLAUDE.md` (old project-level file)
- `/docs/ARCHITECTURE.md` (may or may not exist)

Show the user what was found and ask:
> "I found these files in your project:
> - `_tasks.md` or `/docs/_tasks.md` (X lines)
> - `LESSONS_LEARNED.md` or `/docs/LESSONS_LEARNED.md` (Y lines)
> - `CLAUDE.md` (Z lines)
> - `/docs/ARCHITECTURE.md` (exists/missing)
>
> I'll re-bootstrap this to the new optimized structure:
> 1. **Backup** everything to `/docs_backup/YYYY-MM-DD-HHMMSS/`
> 2. **Discover** all referenced files by following the chain (CLAUDE.md → ARCHITECTURE.md → etc.)
> 3. **Analyze** existing tasks file to identify phases
> 4. **Split** into phase files in `/docs/tasks/`
> 5. **Create** new lean `/docs/_tasks.md` (high-level overview)
> 6. **Analyze & Transform** `CLAUDE.md` to new lean format using context from ALL discovered files
> 7. **Create** `/docs/ARCHITECTURE.md` if missing
> 8. **Keep** `/docs/LESSONS_LEARNED.md` as-is (it's fine to be large)
>
> **Expected Result**:
> - Reduced context load (~40% fewer lines)
> - Better organization (phase files, architecture docs)
> - All progress preserved
>
> Proceed with re-bootstrap?"

---

## Step 2: Create Backup (After User Approves)

```bash
mkdir -p docs_backup/$(date +%Y-%m-%d-%H%M%S)
cp _tasks.md docs_backup/$(date +%Y-%m-%d-%H%M%S)/ 2>/dev/null || true
cp LESSONS_LEARNED.md docs_backup/$(date +%Y-%m-%d-%H%M%S)/ 2>/dev/null || true
cp CLAUDE.md docs_backup/$(date +%Y-%m-%d-%H%M%S)/ 2>/dev/null || true
cp -r docs docs_backup/$(date +%Y-%m-%d-%H%M%S)/ 2>/dev/null || true

# Also backup any files already in /docs/ (new structure)
mkdir -p docs_backup/$(date +%Y-%m-%d-%H%M%S)/docs
cp docs/_tasks.md docs_backup/$(date +%Y-%m-%d-%H%M%S)/docs/ 2>/dev/null || true
cp docs/LESSONS_LEARNED.md docs_backup/$(date +%Y-%m-%d-%H%M%S)/docs/ 2>/dev/null || true
```

Tell user:
> "✅ Backup created in `/docs_backup/YYYY-MM-DD-HHMMSS/`
>
> All original files are safely backed up before re-bootstrapping."

---

## Step 3: Analyze and Split Tasks File

Read the existing tasks file (either `_tasks.md` or `/docs/_tasks.md`) carefully:

1. **Identify phases**:
   - Look for major section headings
   - Common patterns: "Phase 1:", "## Phase X:", "### Phase"
   - If no clear phases, ask user how many phases to create

2. **Extract completed vs in-progress vs not started**:
   - Look for `[x]` completed checkboxes
   - Look for `[ ] 🚧` in-progress markers
   - Look for `[ ]` not-started markers

3. **Group tasks by phase**

4. **Show analysis to user**:
   > "I found these phases in your tasks file:
   > - Phase 1: [Name] - X tasks completed, Y in progress, Z not started
   > - Phase 2: [Name] - A tasks completed, B in progress, C not started
   > - ...
   >
   > Does this look correct? Should I adjust any phase groupings?"

---

## Step 4: Create New Structure (After User Confirms)

1. **Create directories**:
   ```bash
   mkdir -p docs/tasks
   ```

2. **Create individual phase files**:
   - `/docs/tasks/phase-01-[name].md` with Phase 1 tasks
   - `/docs/tasks/phase-02-[name].md` with Phase 2 tasks
   - etc.

3. **Create new lean `/docs/_tasks.md`**:
   - Read template from `~/.claude/templates/_tasks.md`
   - Populate with phases from old file
   - Mark current phase with `[ ] 🚧`
   - Mark completed phases with `[x]`
   - Keep it ~150-200 lines (high-level overview only)
   - Move old root-level `_tasks.md` to `/docs/_tasks.md` if needed

4. **Create/Update `/docs/ARCHITECTURE.md`**:
   - If exists: Keep as-is (user may have customized it)
   - If missing: Ask user if they want to create it now
     > "I notice `/docs/ARCHITECTURE.md` is missing. Would you like me to:
     > - **Create it now** (I'll ask about your tech stack)
     > - **Skip for now** (you can create it later)"

5. **Transform `CLAUDE.md`** (see Step 4.5 below for details)

6. **Move and keep `/docs/LESSONS_LEARNED.md`**:
   - Move from root to `/docs/LESSONS_LEARNED.md` if needed
   - Don't modify contents - it's fine to be large
   - Valuable historical knowledge should stay intact

---

## Step 4.5: Analyze and Transform Project CLAUDE.md

Read the existing `./CLAUDE.md` file carefully:

### 0. Discover Referenced Files (Build Full Context)

Follow the reference chain to gather all project knowledge:

1. **Start with `CLAUDE.md`**:
   - Read the entire file
   - Look for file references: `ARCHITECTURE.md`, `_tasks.md`, `/docs/`, `LESSONS_LEARNED.md`, etc.
   - Common patterns to search for:
     - "See `filename.md`"
     - "Refer to `/path/to/file.md`"
     - "`/docs/ARCHITECTURE.md`"
     - Links: `[text](filename.md)`
     - Mentions: "documented in X", "see X for details"

2. **Read all referenced files**:
   - For each file found, read it completely
   - Extract project knowledge from each
   - Look for additional file references in THOSE files

3. **Follow the chain recursively**:
   - If `CLAUDE.md` references `ARCHITECTURE.md`
   - And `ARCHITECTURE.md` references `INNOVATION_IDEAS.md`
   - Then read `INNOVATION_IDEAS.md` too
   - Continue until no new files are discovered

4. **Common files to check** (if they exist):
   - `ARCHITECTURE.md` - System design, tech stack
   - `LESSONS_LEARNED.md` - Historical knowledge, solutions
   - `INNOVATION_IDEAS.md` - Future features, ideas
   - `CONTRIBUTING.md` - Development patterns
   - `DESIGN_DECISIONS.md` - Key architectural choices
   - `API_PATTERNS.md` - API design patterns
   - `TESTING_STRATEGY.md` - Testing approaches
   - Any `/docs/*.md` files referenced

5. **Build comprehensive context**:
   - Combine knowledge from ALL discovered files
   - This gives complete picture of:
     - Project architecture
     - Historical decisions
     - Patterns and anti-patterns
     - Tech stack details
     - Future plans
     - Team conventions

**Example flow**:
```
CLAUDE.md → mentions ARCHITECTURE.md
  → Read ARCHITECTURE.md → mentions INNOVATION_IDEAS.md
    → Read INNOVATION_IDEAS.md → mentions /docs/api-design.md
      → Read /docs/api-design.md → no new references
```

**Why this matters**:
- Captures distributed knowledge across multiple files
- Ensures new CLAUDE.md reflects full project context
- Prevents loss of documented patterns and decisions
- Creates what `/bootstrap` would have created with full information

### 1. Extract Key Information

Extract from ALL discovered files (CLAUDE.md + all referenced files):

From **CLAUDE.md** and related files:
- **Project name and overview**: Look for "Project Overview", "## Overview", "# Project", first paragraph
- **Tech stack**: Look for "Tech Stack", "Technologies", "Dependencies", "Built with"
- **Dos & Don'ts patterns**: Look for "Do:", "Don't:", "✅", "❌", "Best Practices", "Avoid"
- **Architecture references**: Any mentions of architecture, file structure, system design
- **Current phase**: Look for "Current Phase", "Working on", "In Progress", `[ ] 🚧`
- **Key files**: Important files mentioned (stores, components, services)

From **ARCHITECTURE.md** (if found):
- System architecture and data flow
- Tech stack details and versions
- File structure and organization
- Integration patterns
- Database schema

From **LESSONS_LEARNED.md** (if found):
- Key patterns that worked well
- Anti-patterns to avoid
- Solutions to complex problems
- Performance optimizations discovered

From **INNOVATION_IDEAS.md** or similar (if found):
- Future feature plans
- Technical debt items
- Architectural improvements planned

From **any other referenced files**:
- Domain-specific patterns
- API design guidelines
- Testing strategies
- Deployment procedures

### 2. Identify Information Gaps

Check if any critical information is missing:
- No clear project description
- Unclear or incomplete tech stack
- No dos/don'ts patterns or best practices
- No architecture reference
- No current phase tracking
- File references but no context

### 3. Ask Probing Questions (Only If Gaps Remain)

After following the complete reference chain, if critical information is still missing:

> "I've analyzed your project documentation:
>
> **Files Read**:
> - CLAUDE.md
> - ARCHITECTURE.md (if found)
> - LESSONS_LEARNED.md (if found)
> - [List any other discovered files]
>
> **Information Extracted**:
> - [List what was successfully extracted from all files]
>
> **Still need clarification on**:
> - What's a 2-3 sentence description of this project's purpose?
> - What are the main technologies/frameworks? (e.g., React 18, Node.js, PostgreSQL)
> - What are 3-5 key architectural patterns or dos/don'ts specific to this project?
> - Which phase are you currently working on?"

**Note**: With the recursive file discovery, you should have comprehensive context, so questions should be rare. Only ask if truly critical information is missing after reading all referenced files.

### 4. Transform to New Lean Format

After gathering all information:

1. **Read template**: Get structure from `~/.claude/templates/CLAUDE-generic.md`
2. **Fill in sections**:
   - Project Overview (2-3 sentences)
   - Organize dos/don'ts by category (State Management, Components, API, Data Flow, etc.)
   - Add architecture reference: "See `/docs/ARCHITECTURE.md` for system overview..."
   - List tech stack (frameworks and key libraries)
   - Add current phase section with file reference
   - Add key files section if relevant
3. **Keep it lean**: Target ~80-120 lines (down from potentially 200-500+ lines)
4. **Remove redundancy**: Move detailed architecture to ARCHITECTURE.md, detailed tasks to phase files

### 5. Show Transformation Preview

Before replacing, show user:

> "Here's how I'll transform your CLAUDE.md based on comprehensive context from all discovered files:
>
> **Context Sources** (files analyzed):
> - CLAUDE.md (old format, X lines)
> - ARCHITECTURE.md (Y lines) [if found]
> - LESSONS_LEARNED.md (Z lines) [if found]
> - [List any other files discovered and read]
> - **Total context analyzed**: ~N lines across M files
>
> **Before** (old CLAUDE.md):
> - [Show first 10-15 lines of old CLAUDE.md as preview]
> - ...
>
> **After** (new lean CLAUDE.md, informed by all files):
> ```markdown
> # [Project Name] - Project Guide
>
> ## Project Overview
> [Synthesized from CLAUDE.md, ARCHITECTURE.md, and other sources]
>
> **Architecture**: See `/docs/ARCHITECTURE.md` for system overview...
>
> ## Dos & Don'ts
>
> ### [Category 1 - e.g., State Management]
> - ✅ [Pattern from CLAUDE.md or LESSONS_LEARNED.md]
> - ❌ [Anti-pattern from discovered files]
>
> ### [Category 2 - e.g., API Design]
> - ✅ [Pattern from API_PATTERNS.md or ARCHITECTURE.md]
> - ❌ [Anti-pattern discovered]
>
> [Additional categories based on all discovered knowledge...]
>
> ## Tech Stack
> [Synthesized from ARCHITECTURE.md, package.json references, CLAUDE.md]
>
> ## Current Phase
> **Phase X: [Name]** (🚧 IN PROGRESS)
> - **File**: `/docs/tasks/phase-XX-*.md`
> - **Status**: [From _tasks.md]
> ```
>
> **Transformation Summary**:
> - Analyzed ~N lines across M files
> - Created lean CLAUDE.md (~Y lines, down from X)
> - Reduction: ~Z% fewer lines in CLAUDE.md
> - All knowledge preserved (moved to ARCHITECTURE.md or phase files)
> - Dos/don'ts synthesized from all sources
> - Architecture details kept in ARCHITECTURE.md
> - Historical lessons inform patterns
>
> Approve this transformation?"

### 6. Edge Cases

**If CLAUDE.md is already in new lean format**:
- Check for key indicators: Architecture reference, phase tracking, ~80-150 lines
- If already optimized:
  > "Your CLAUDE.md is already in the new lean format (~X lines). Keeping as-is."

**If CLAUDE.md is heavily customized with unique sections**:
- Preserve unique sections
- Transform standard sections (overview, tech stack, etc.)
- Ask user about each unique section:
  > "I found a custom section '[Section Name]'. Should I:
  > - Keep it in CLAUDE.md
  > - Move it to ARCHITECTURE.md
  > - Move it to relevant phase file"

**If CLAUDE.md contains old bootstrap instructions**:
- Remove all bootstrap-related content
- Keep only project-specific information
- Transform to new lean format

---

## Step 5: Verify Re-Bootstrap

Show summary:
> "✅ Re-bootstrap complete!
>
> **Created**:
> - `/docs/tasks/` folder with X phase files
> - New lean `/docs/_tasks.md` (Y lines, down from Z lines)
> - `/docs/ARCHITECTURE.md` [if created]
>
> **Transformed**:
> - `CLAUDE.md` (Y lines, down from Z lines) - New lean format with:
>   - Project overview (synthesized from all discovered files)
>   - Organized dos/don'ts by category (from CLAUDE.md, /docs/LESSONS_LEARNED.md, etc.)
>   - Architecture reference (points to /docs/ARCHITECTURE.md)
>   - Current phase tracking (from /docs/_tasks.md)
>   - **Context sources**: Analyzed ~N lines across M files (CLAUDE.md + all referenced files)
>
> **Moved & Preserved**:
> - `/docs/LESSONS_LEARNED.md` (moved from root if needed, unchanged)
> - All task progress and completion status
> - All dos/don'ts patterns (reorganized)
>
> **Backed up**:
> - Original files in `/docs_backup/YYYY-MM-DD-HHMMSS/`
>
> **Context Optimization**:
> - Before: ~X lines total context load
> - After: ~Y lines total context load
> - Reduction: ~Z% fewer lines in typical session
>
> **Next Steps**:
> - Review the new `/docs/_tasks.md` for accuracy
> - Check phase files in `/docs/tasks/`
> - Review transformed `CLAUDE.md`
> - Update `/docs/ARCHITECTURE.md` if needed
> - Delete backup folder when satisfied (or keep for safety)"

---

## Edge Cases

**If re-bootstrap fails**:
- Restore from backup:
  ```bash
  cp -r docs_backup/YYYY-MM-DD-HHMMSS/* ./
  ```

**If tasks file has custom format**:
- Ask user to help identify phase boundaries
- Offer to create default 5 phases and let user reorganize

**If no clear phases exist**:
- Suggest default structure based on project type
- Let user customize after initial re-bootstrap

---

## Safety Features

1. **Always backup first** - Never modify without backup
2. **Ask before each major step** - User must approve
3. **Show diffs** - Let user see what will change
4. **Reversible** - Easy to restore from backup
5. **Preserve LESSONS_LEARNED.md** - Never split or modify it
