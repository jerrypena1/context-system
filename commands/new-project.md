---
description: Quick setup for new project (Bootstrap/Generic/Skip)
---

# New Project Setup

Check if `./CLAUDE.md` exists in project root.

**If it exists:**
> "This project already has a CLAUDE.md file. Setup is complete!"

**If it does NOT exist:**

Ask the user:
> "How would you like to set up this project?
>
> **A) Bootstrap Mode** - Full guided setup (creates _tasks.md, ARCHITECTURE.md, phase files)
>   - I'll ask questions about your project
>   - Create complete task management structure
>   - Best for: Complex projects, team projects, long-term development
>
> **B) Generic Template** - Minimal CLAUDE.md with placeholders
>   - Quick setup you customize later
>   - Best for: Medium projects, solo work, evolving requirements
>
> **C) Skip** - Empty CLAUDE.md with comment
>   - Bare minimum, add guidance when needed
>   - Best for: Quick scripts, experiments, throwaway code
>
> Choose A, B, or C"

Then execute the user's choice:
- **A**: Run bootstrap process (same as `/bootstrap` command)
- **B**: Create from `~/.claude/templates/CLAUDE-generic.md`
- **C**: Create from `~/.claude/templates/CLAUDE-skip.md`
