# Template Setup Instructions

## One-Time Setup

Copy these templates to your user-level Claude directory. You only need to do this once, and they'll be available for all future projects.

### Step 1: Create Templates Directory

```bash
mkdir -p ~/.claude/templates
```

### Step 2: Copy All Templates

```bash
# From this project's docs_template folder, copy everything
cp /Users/juanpena/Sites/AI/hotmail-mail-antispam/docs_template/*.md ~/.claude/templates/
```

Or if you're in the project root:

```bash
cp docs_template/*.md ~/.claude/templates/
```

### Step 3: Copy Slash Commands (Optional but Recommended)

```bash
# Copy user-level slash commands
mkdir -p ~/.claude/commands
cp /Users/juanpena/Sites/AI/hotmail-mail-antispam/docs_template/commands/* ~/.claude/commands/
```

Or from project root:

```bash
mkdir -p ~/.claude/commands
cp docs_template/commands/* ~/.claude/commands/
```

This gives you:
- `/bootstrap` - Full bootstrap setup for new projects (creates all files)
- `/new-project` - Quick setup choice (Bootstrap/Generic/Skip)
- `/re-bootstrap` - Re-bootstrap existing project to new optimized structure (preserves all progress)

### Step 4: Verify Setup

```bash
ls -la ~/.claude/templates/
```

You should see:
- `CLAUDE.md` (Bootstrap template)
- `CLAUDE-generic.md` (Generic template)
- `CLAUDE-skip.md` (Skip template)
- `_tasks.md` (Task management template)
- `ARCHITECTURE.md` (Architecture doc template)
- `example-ARCHITECTURE.md` (Example for reference)
- `example-_tasks.md` (Example for reference)
- `example-LESSONS_LEARNED.md` (Example for reference)
- `example-phase-01.md` (Example phase file)
- `user-level-CLAUDE.md` (User-level instructions)

### Step 5: Copy User-Level Instructions

```bash
cp ~/.claude/templates/user-level-CLAUDE.md ~/.claude/CLAUDE.md
```

---

## How It Works

Once set up, whenever you start a new project:

### Option 1: Use Slash Commands (Recommended)

1. Open Claude Code in the new project directory
2. Type `/bootstrap` or `/new-project`
3. Follow the prompts
4. Done!

**Slash Commands**:
- `/bootstrap` - Jump straight into full setup for new projects
- `/new-project` - Choose Bootstrap/Generic/Skip, then proceed
- `/re-bootstrap` - Re-bootstrap existing project from old structure to new optimized structure

### Option 2: Start Conversation Naturally

1. Open Claude Code in the new project directory
2. Say anything: "help me build..." or "hi"
3. Claude detects no `./CLAUDE.md` in project
4. Asks: "Bootstrap Mode / Generic Template / Skip?"
5. Creates project structure based on your choice

### Bootstrap Mode
- Asks questions about your project
- Creates `/docs/_tasks.md`, `/docs/ARCHITECTURE.md`, phase files in `/docs/tasks/`, `/docs/LESSONS_LEARNED.md`
- Customizes everything based on your answers
- Replaces bootstrap CLAUDE.md with project-specific guidance

### Generic Template
- Creates minimal `CLAUDE.md` with placeholders
- You customize manually as project grows

### Skip Mode
- Creates empty `CLAUDE.md` with comment
- Minimal overhead for quick scripts

---

## For New Projects on Other Machines

If you move to a new computer:

```bash
# 1. Copy templates
scp -r old-machine:~/.claude/templates ~/.claude/

# 2. Copy user-level CLAUDE.md
scp old-machine:~/.claude/CLAUDE.md ~/.claude/CLAUDE.md
```

Or keep templates in a dotfiles repo and symlink them.

---

## Re-Bootstrapping Existing Projects

Have an existing project with old structure? Use `/re-bootstrap`:

### What `/re-bootstrap` Does

1. **Backs up** everything to `/docs_backup/YYYY-MM-DD-HHMMSS/`
2. **Discovers** all referenced files by following the chain recursively:
   - Starts with `CLAUDE.md`
   - Reads any files it references (e.g., `ARCHITECTURE.md`)
   - Reads any files THOSE files reference (e.g., `INNOVATION_IDEAS.md`)
   - Builds comprehensive context from all project documentation
3. **Analyzes** your current tasks file (either `_tasks.md` or `/docs/_tasks.md`) to find phases
4. **Splits** tasks into individual phase files in `/docs/tasks/`
5. **Creates** new lean `/docs/_tasks.md` (~150 lines)
6. **Analyzes & Transforms** your existing `CLAUDE.md` to new lean format:
   - Uses context from ALL discovered files (not just CLAUDE.md)
   - Synthesizes project overview, tech stack, dos/don'ts from all sources
   - Incorporates patterns from `/docs/LESSONS_LEARNED.md`
   - Asks probing questions only if critical info still missing
   - Reorganizes into clean categories
   - Reduces from potentially 200-500+ lines to ~80-120 lines
7. **Creates** `/docs/ARCHITECTURE.md` if missing
8. **Moves and preserves** `/docs/LESSONS_LEARNED.md` (moves from root if needed, unchanged - it's fine to be large)
9. **Preserves** all task completion status (✓ done, 🚧 in progress)

### Usage

```bash
# In your existing project
cd ~/my-old-project

# Run re-bootstrap
/re-bootstrap
```

Claude will:
- Show you what was found
- Follow all file references to build complete context
- Ask for confirmation before making changes
- Create backup first
- Guide you through the re-bootstrap process
- Let you verify before finalizing

### Example: Recursive File Discovery

Your project has:
```
CLAUDE.md (mentions "See ARCHITECTURE.md for details")
  ↓
ARCHITECTURE.md (mentions "See INNOVATION_IDEAS.md for roadmap")
  ↓
INNOVATION_IDEAS.md (mentions "See /docs/api-design.md")
  ↓
/docs/api-design.md (no further references)
```

**What `/re-bootstrap` does**:
1. Reads `CLAUDE.md` → finds reference to `/docs/ARCHITECTURE.md`
2. Reads `/docs/ARCHITECTURE.md` → finds reference to `INNOVATION_IDEAS.md`
3. Reads `INNOVATION_IDEAS.md` → finds reference to `/docs/api-design.md`
4. Reads `/docs/api-design.md` → no new references, chain complete
5. Synthesizes knowledge from all 4 files into new lean `CLAUDE.md`

**Result**: New CLAUDE.md contains distilled wisdom from all files, organized cleanly. Files moved to `/docs/` folder for better organization. Nothing lost, everything preserved in appropriate files.

### Safety

- All original files backed up with timestamp
- Easy to restore if anything goes wrong:
  ```bash
  cp -r docs_backup/YYYY-MM-DD-HHMMSS/* ./
  ```
- Re-bootstrap is reversible
- `/docs/LESSONS_LEARNED.md` is never modified (just moved to /docs/ if needed and preserved)

---

## Updating Templates

To update templates after improvements:

```bash
# Update from this project
cp /path/to/hotmail-project/docs_template/*.md ~/.claude/templates/
cp /path/to/hotmail-project/docs_template/commands/* ~/.claude/commands/

# Or from any project with updated templates
cp /path/to/project/docs_template/*.md ~/.claude/templates/
cp /path/to/project/docs_template/commands/* ~/.claude/commands/
```

Templates are shared across all projects, so updates benefit everything!
