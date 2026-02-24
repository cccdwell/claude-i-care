#!/bin/bash
# Claude I Care — Periodic Craft Reminder
# Tracks tool usage and shows reminders at intervals.
# Runs outside context window (no token cost).
# Adaptive: backs off if reminders are frequent relative to session length.

STATE_DIR="${TMPDIR:-/tmp}/claude-i-care"
mkdir -p "$STATE_DIR"

SESSION_ID="${CLAUDE_SESSION_ID:-$$}"
COUNT_FILE="$STATE_DIR/count_$SESSION_ID"

# Increment tool count
if [ -f "$COUNT_FILE" ]; then
    COUNT=$(cat "$COUNT_FILE")
    COUNT=$((COUNT + 1))
else
    COUNT=1
fi
echo "$COUNT" > "$COUNT_FILE"

# Reminder intervals
SMALL_INTERVAL=20
LARGE_INTERVAL=50

# Small reminder
if [ $((COUNT % SMALL_INTERVAL)) -eq 0 ]; then
    echo ""
    echo "  ┌─────────────────────────────────────────────────────────┐"
    echo "  │  Craft Check (#$COUNT)                                    │"
    echo "  │  Pride. Grace. Elegance.                                │"
    echo "  │  /reflect for a deeper look                             │"
    echo "  └─────────────────────────────────────────────────────────┘"
    echo ""
fi

# Large reminder
if [ $((COUNT % LARGE_INTERVAL)) -eq 0 ]; then
    echo ""
    echo "  ┌─────────────────────────────────────────────────────────┐"
    echo "  │  Session Check (#$COUNT)                                  │"
    echo "  │  Consider /checkpoint to take stock                     │"
    echo "  │  Or /pride to verify before wrapping up                 │"
    echo "  │  Or /smart-compact if context is filling up             │"
    echo "  └─────────────────────────────────────────────────────────┘"
    echo ""
fi
