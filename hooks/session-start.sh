#!/bin/bash
# Claude I Care — Session Start
# Shows a greeting banner on first tool use of each session.
# Runs outside context window (no token cost).

STATE_DIR="${TMPDIR:-/tmp}/claude-i-care"
mkdir -p "$STATE_DIR"

SESSION_ID="${CLAUDE_SESSION_ID:-$$}"
MARKER="$STATE_DIR/session_$SESSION_ID"

# Only show banner once per session
if [ -f "$MARKER" ]; then
    exit 0
fi
touch "$MARKER"

echo ""
echo "  ================================================================"
echo "  Claude I Care"
echo "  \"Build with pride, grace, and elegance.\""
echo "  ================================================================"

# Git info if available
if git rev-parse --git-dir > /dev/null 2>&1; then
    BRANCH=$(git branch --show-current 2>/dev/null || echo "detached")
    echo ""
    echo "  Branch: $BRANCH"
    echo ""
    echo "  Recent commits:"
    git log --oneline -3 2>/dev/null | sed 's/^/    /' || true
fi

echo ""
echo "  ================================================================"
echo "  Commands: /pride /reflect /checkpoint /inspire /craft-status"
echo "  ================================================================"
echo ""
