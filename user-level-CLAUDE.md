# User-Level Instructions (All Projects)

## New Project Detection

**On first conversation in a new directory:**

1. **Check if `./CLAUDE.md` exists in project root**
2. **If NOT found**, ask user **once**:
   > "I don't see a CLAUDE.md file in this project. How would you like to set it up?
   >
   > **A) Bootstrap Mode** - Full setup with guided questions (creates /docs/_tasks.md, /docs/ARCHITECTURE.md, phase files in /docs/tasks/)
   >
   > **B) Generic Template** - Minimal CLAUDE.md with placeholders (you customize later)
   >
   > **C) Skip** - Empty CLAUDE.md with comment (no project-specific guidance)"

3. **Always create `./CLAUDE.md`** based on user choice:
   - **Bootstrap**: Copy `~/.claude/templates/CLAUDE.md`, start bootstrap conversation
   - **Generic**: Create from `~/.claude/templates/CLAUDE-generic.md`
   - **Skip**: Create from `~/.claude/templates/CLAUDE-skip.md`

4. **Future conversations**: File exists → Use it, never ask again

---

## Core Principles

**Background**: 22-year Silicon Valley veteran, $300k/yr engineer. Research-first approach, DRY architecture, incremental development with manual testing between phases.

**Workflow**:
1. Research before implementing (check docs, existing patterns, similar solutions)
2. Build incrementally (small PRs, test between changes)
3. Manual testing with human-in-the-middle between major phases
4. Document hard-won knowledge

---

## Communication Style

**Default**: Concise and to-the-point
- Brief explanations unless requested
- Focus on what's needed for the task
- Assume high technical competency

**When User Requests Detail**: Provide comprehensive explanations with examples, rationale, and alternatives.

---

## Code Quality Standards

### Code Commenting
- **DO**: Explain WHY (business logic, edge cases, gotchas)
- **DON'T**: Explain WHAT (code should be self-documenting)
- **JSDoc**: Use for public APIs, exported functions, complex utilities
- **Inline**: Only when non-obvious (algorithm choice, performance trade-off, bug workaround)

**Example**:
```javascript
// ❌ BAD: Increment counter by 1
counter++;

// ✅ GOOD: Reset occurs at 100 to prevent memory leak in legacy analytics lib
if (counter >= 100) counter = 0;
```

### Architecture
- **DRY**: Don't repeat yourself - extract reusable patterns
- **Incremental**: Ship small, working changes frequently
- **Test between phases**: Manual verification before proceeding

---

## Decision Making

### When to Ask vs. When to Act

**ASK when confidence < 85-90%**:
- Ambiguous requirements
- Multiple valid approaches with trade-offs
- Architectural decisions
- Breaking changes
- Adding dependencies

**ACT when confidence ≥ 85-90%**:
- Clear requirements
- Following established patterns
- Minor refactoring
- Bug fixes
- Standard implementations

---

## Problem Solving: 3-Strike Rule

**If you fail 3 times on the same problem:**
1. **STOP** - Don't keep trying the same approach
2. **RESEARCH** - Search documentation, Stack Overflow, GitHub issues
3. **DOCUMENT** - Add solution to `docs/LESSONS_LEARNED.md` (if project has one)

**Lesson Format**:
```markdown
## [Date] - [Brief Title]
**Problem**: [What went wrong]
**Solution**: [What actually worked]
**Why**: [Root cause explanation]
**Files**: [Affected files/areas]
```

---

## Execution Preferences

### Process Management
**NEVER** start servers, apps, or processes automatically.

**ALWAYS** provide commands for user to run manually:
```bash
# Start frontend dev server
cd packages/frontend && npm run dev

# Start backend dev server (in separate terminal)
cd packages/backend && npm run dev
```

**Why**: User prefers full control over running processes.

---

## Quality Checklist

Before marking work complete:
- [ ] Code follows project patterns
- [ ] No obvious bugs or edge cases
- [ ] Comments explain WHY (not WHAT)
- [ ] Changes are incremental and testable
- [ ] If project has `docs/LESSONS_LEARNED.md`, check it for related lessons
- [ ] If failed 3+ times, documented the solution
