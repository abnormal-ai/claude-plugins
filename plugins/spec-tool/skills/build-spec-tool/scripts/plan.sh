#!/bin/bash
set -e

# plan -- Launch Claude Code with spec-driven planning methodology
#
# This script reads .ai-dev/PLAN.md (the spec template) and .ai-dev/SYSTEM_PROMPT.md
# (the planning methodology), combines them into a single system prompt, and launches
# Claude Code with that context injected.
#
# The system prompt contains the full planning methodology: research steps, guidelines,
# sub-task spawning best practices, and success criteria patterns. The PLAN.md template
# is embedded within it via the {{TECH_PLAN_TEMPLATE}} placeholder.
#
# Usage:
#   bin/plan "description of feature to plan"
#   bin/plan                                    # interactive mode

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

PLAN_FILE="$REPO_ROOT/.ai-dev/PLAN.md"
SYSTEM_PROMPT_FILE="$REPO_ROOT/.ai-dev/SYSTEM_PROMPT.md"

# Verify required files exist
if [ ! -f "$PLAN_FILE" ]; then
  echo "Error: Plan template not found at $PLAN_FILE"
  echo "Run /build-spec-tool to generate .ai-dev/ files first."
  exit 1
fi

if [ ! -f "$SYSTEM_PROMPT_FILE" ]; then
  echo "Error: System prompt not found at $SYSTEM_PROMPT_FILE"
  echo "Run /build-spec-tool to generate .ai-dev/ files first."
  exit 1
fi

# Build the full system prompt:
# 1. Read the planning methodology from SYSTEM_PROMPT.md
# 2. Read the PLAN.md template
# 3. Replace the {{TECH_PLAN_TEMPLATE}} placeholder with the actual template content
PLAN_CONTENT=$(cat "$PLAN_FILE")
SYSTEM_PROMPT=$(cat "$SYSTEM_PROMPT_FILE")

# Use awk for the replacement since sed struggles with multiline content
FULL_PROMPT=$(awk -v plan="$PLAN_CONTENT" '{gsub(/\{\{TECH_PLAN_TEMPLATE\}\}/, plan); print}' <<< "$SYSTEM_PROMPT")

# Launch Claude Code with the combined system prompt
claude --append-system-prompt "$FULL_PROMPT" "$@"
