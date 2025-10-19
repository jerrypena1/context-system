# Claude Code Template System

This folder contains templates and commands for the optimized Claude Code project management system.

## Quick Setup

### Option 1: Install Script (Recommended)

```bash
# From this directory
./install.sh
```

The script will:
- Create `~/.claude/templates/` and `~/.claude/commands/` directories
- Copy all template files
- Install user-level CLAUDE.md (backs up if exists)
- Install slash commands
- Show summary of installed files

### Option 2: Manual Installation

```bash
# From this directory
mkdir -p ~/.claude/templates ~/.claude/commands

# Copy templates
cp _tasks.md ARCHITECTURE.md LESSONS_LEARNED.md phase-template.md CLAUDE.md CLAUDE-generic.md CLAUDE-skip.md ~/.claude/templates/

# Copy user-level instructions
cp user-level-CLAUDE.md ~/.claude/CLAUDE.md

# Copy slash commands
cp commands/* ~/.claude/commands/
```

---

## File Structure

### Project Templates (→ `~/.claude/templates/`)

These are templates used to bootstrap new projects:

| File | Purpose | Used By |
|------|---------|---------|
| `CLAUDE.md` | Bootstrap template (self-modifying) | `/bootstrap`, `/new-project` |
| `CLAUDE-generic.md` | Minimal project template | `/new-project` (option B) |
| `CLAUDE-skip.md` | Empty project template | `/new-project` (option C) |
| `_tasks.md` | Task management template | `/bootstrap`, `/re-bootstrap` |
| `ARCHITECTURE.md` | Architecture doc template | `/bootstrap`, `/re-bootstrap` |
| `LESSONS_LEARNED.md` | Lessons learned template | `/bootstrap` |
| `phase-template.md` | Individual phase file template | `/bootstrap` |

### User-Level Files (→ `~/.claude/`)

| File | Destination | Purpose |
|------|-------------|---------|
| `user-level-CLAUDE.md` | `~/.claude/CLAUDE.md` | Global instructions for all projects |

### Slash Commands (→ `~/.claude/commands/`)

| File | Command | Purpose |
|------|---------|---------|
| `commands/bootstrap.md` | `/bootstrap` | Full setup for new projects |
| `commands/new-project.md` | `/new-project` | Choose setup type (Bootstrap/Generic/Skip) |
| `commands/re-bootstrap.md` | `/re-bootstrap` | Migrate existing project to new structure |

### Documentation

| File | Purpose |
|------|---------|
| `SETUP_INSTRUCTIONS.md` | Complete setup guide with examples |
| `README.md` (this file) | Quick reference |

### Examples (Reference Only)

| File | Purpose |
|------|---------|
| `examples/example-_tasks.md` | Example of a complete task file |
| `examples/example-ARCHITECTURE.md` | Example architecture doc |
| `examples/example-LESSONS_LEARNED.md` | Example lessons file |
| `examples/example-phase-01.md` | Example phase file |

---

## After Setup

Once copied to `~/.claude/`, you can use these slash commands in any project:

### `/new-project`
Detects new project, asks for setup type:
- **A) Bootstrap Mode**: Full guided setup
- **B) Generic Template**: Minimal placeholders
- **C) Skip**: Empty file

### `/bootstrap`
Jumps straight into full bootstrap setup:
1. Asks about your project
2. Creates task structure
3. Creates architecture docs
4. Replaces bootstrap CLAUDE.md with project-specific guidance

### `/re-bootstrap`
Migrate existing project from old structure:
1. Backs up everything
2. Discovers all referenced files (recursive)
3. Splits huge `_tasks.md` into phase files
4. Transforms CLAUDE.md using context from all discovered files
5. Creates optimized structure

---

## Context Optimization

**Before** (old system):
- Single 500+ line `_tasks.md`
- Bloated 200-300 line `CLAUDE.md`
- No architecture docs (repeated discovery)
- Total: 700-1000+ lines per session

**After** (new system):
- Lean 150-line `_tasks.md` (high-level)
- Active phase file (60-200 lines)
- Lean 80-120 line `CLAUDE.md`
- Architecture docs loaded on-demand
- Total: 290-470 lines typical session
- **~40-60% context reduction**

---

## Copying to Another Machine

```bash
# From old machine
scp -r ~/.claude/templates ~/.claude/commands ~/.claude/CLAUDE.md new-machine:~/.claude/

# Or use this template folder
scp -r /path/to/docs_template new-machine:~/
# Then run setup commands on new machine
```

---

## See Also

- `SETUP_INSTRUCTIONS.md` - Detailed setup guide with examples
- `examples/` - Real-world examples from the Hotmail project
