#!/bin/bash
set -e

# plan -- Launch Claude Code with spec-driven planning methodology
#
# This script reads all .ai-dev/ files and the planning methodology, combines them
# into a single system prompt, and launches Claude Code with that context injected.
#
# Injected into the system prompt:
#   - SYSTEM_PROMPT.md (planning methodology) with PLAN.md template embedded
#   - ARCHITECTURE.md, SECURITY.md, LEGAL.md (so the planner doesn't need to read them)
#
# Usage:
#   bin/plan "description of feature to plan"
#   bin/plan                                    # interactive mode

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

AI_DEV_DIR="$REPO_ROOT/.ai-dev"
PLAN_FILE="$AI_DEV_DIR/PLAN.md"
SYSTEM_PROMPT_FILE="$AI_DEV_DIR/SYSTEM_PROMPT.md"
ARCHITECTURE_FILE="$AI_DEV_DIR/ARCHITECTURE.md"
SECURITY_FILE="$AI_DEV_DIR/SECURITY.md"
LEGAL_FILE="$AI_DEV_DIR/LEGAL.md"

# Verify required files exist
for f in "$PLAN_FILE" "$SYSTEM_PROMPT_FILE"; do
  if [ ! -f "$f" ]; then
    echo "Error: Required file not found: $f"
    echo "Run /build-spec-tool to generate .ai-dev/ files first."
    exit 1
  fi
done

# Build the full system prompt:
# 1. Start with the planning methodology from SYSTEM_PROMPT.md
# 2. Embed the PLAN.md template via {{TECH_PLAN_TEMPLATE}} placeholder
# 3. Append ARCHITECTURE.md, SECURITY.md, LEGAL.md so they're pre-loaded
#
# Use awk with file reading (NR==FNR) to handle multiline content safely,
# since passing multiline strings via -v breaks on newlines.
FULL_PROMPT=$(awk '
  NR==FNR { plan = plan (NR>1 ? "\n" : "") $0; next }
  { gsub(/\{\{TECH_PLAN_TEMPLATE\}\}/, plan); print }
' "$PLAN_FILE" "$SYSTEM_PROMPT_FILE")

# Append .ai-dev/ knowledge files so the planner has them pre-loaded
for f in "$ARCHITECTURE_FILE" "$SECURITY_FILE" "$LEGAL_FILE"; do
  if [ -f "$f" ]; then
    basename=$(basename "$f")
    FULL_PROMPT="$FULL_PROMPT

---

# .ai-dev/$basename

$(cat "$f")"
  fi
done

# Launch Claude Code with the combined system prompt
claude --append-system-prompt "$FULL_PROMPT" "$@"
