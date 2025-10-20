---
description: Bootstrap a new project with full structure (tasks, architecture, phase files)
---

# Bootstrap New Project

Check if `./CLAUDE.md` exists in the project root.

**If CLAUDE.md already exists:**
> "This project already has a CLAUDE.md file. The bootstrap process has already been run. Would you like to:
>
> - **Re-run bootstrap** (will backup existing files first)
> - **Skip** and continue with existing setup"

**If CLAUDE.md does NOT exist:**

Start the bootstrap process:

1. Read the bootstrap template from `~/.claude/templates/CLAUDE.md`
2. Ask me about the project (free-form conversation):
   - Project name and description
   - Tech stack (frontend, backend, database, etc.)
   - Main features and goals
   - Project complexity (small/medium/large)
3. Determine appropriate number of phases (3-5 for small, 5-7 for medium, 8-10 for large)
4. Create project structure:
   - `mkdir -p docs/tasks`
   - Create `/docs/_tasks.md` with customized phases
   - Create `/docs/ARCHITECTURE.md` with tech stack info
   - Create phase files in `/docs/tasks/` (phase-01-*.md, etc.)
   - Create `/docs/LESSONS_LEARNED.md` (empty template)
5. Ask for permission to update `./CLAUDE.md` with project-specific guidance
6. After approval, create `./CLAUDE.md` with project-specific dos/don'ts

**If `~/.claude/templates/` is missing:**
> "Templates not found in ~/.claude/templates/. Please run the setup first:
>
> ```bash
> mkdir -p ~/.claude/templates
> cp /path/to/hotmail-project/docs_template/* ~/.claude/templates/
> ```"
