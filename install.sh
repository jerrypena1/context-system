#!/bin/bash
# Claude Code Template System - Installation Script
# This installs templates and commands to ~/.claude/

set -e  # Exit on error

echo "🚀 Installing Claude Code Template System..."
echo ""

# Create directories
echo "📁 Creating directories..."
mkdir -p ~/.claude/templates
mkdir -p ~/.claude/commands

# Copy templates
echo "📝 Installing templates..."
cp _tasks.md ARCHITECTURE.md LESSONS_LEARNED.md phase-template.md CLAUDE.md CLAUDE-generic.md CLAUDE-skip.md ~/.claude/templates/

# Copy user-level CLAUDE.md
echo "⚙️  Installing user-level instructions..."
if [ -f ~/.claude/CLAUDE.md ]; then
    echo "   ⚠️  ~/.claude/CLAUDE.md already exists"
    echo "   Creating backup at ~/.claude/CLAUDE.md.backup"
    cp ~/.claude/CLAUDE.md ~/.claude/CLAUDE.md.backup
fi
cp user-level-CLAUDE.md ~/.claude/CLAUDE.md

# Copy commands
echo "🔧 Installing slash commands..."
cp commands/* ~/.claude/commands/

echo ""
echo "✅ Installation complete!"
echo ""
echo "📊 Installed files:"
echo "   Templates:     ~/.claude/templates/ (7 files)"
echo "   Commands:      ~/.claude/commands/ (3 files)"
echo "   User config:   ~/.claude/CLAUDE.md"
echo ""
echo "🎯 Available commands:"
echo "   /new-project   - Setup new project (choose Bootstrap/Generic/Skip)"
echo "   /bootstrap     - Full guided setup for new projects"
echo "   /re-bootstrap  - Migrate existing project to optimized structure"
echo ""
echo "📖 For more info, see:"
echo "   - README.md - Quick reference"
echo "   - SETUP_INSTRUCTIONS.md - Detailed guide"
echo ""
