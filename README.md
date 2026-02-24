# Claude I Care

> *Build with pride, grace, and elegance.*

A craft-driven development philosophy for Claude Code. This plugin helps maintain quality, intention, and honest verification throughout long coding sessions.

---

## What It Does

Claude I Care provides three things:

1. **Pride** — A quality verification system that runs inside Claude's context. Before declaring work "done", Claude reads the files, runs the tests, and honestly reports what is complete, what is partial, and what is missing.

2. **Reflection** — Commands for periodic self-assessment. Step back from the code, check quality, and continue with renewed intention.

3. **Session Awareness** — Gentle reminders during long sessions to check in on craft quality. No nagging — just a nudge when it matters.

---

## Installation

```bash
# From the Claude Code CLI:
/install-plugin /path/to/claude-i-care
```

Or copy the plugin directory to `~/.claude/plugins/claude-i-care/`.

---

## Commands

### `/pride` — Quality Verification

The centerpiece. Runs a 4-phase verification:

1. **Inventory** — Lists every task from the original request
2. **Evidence Gathering** — Reads files, runs tests, checks types/lint, verifies builds
3. **Honest Assessment** — Each task classified as COMPLETE, PARTIAL, or NOT STARTED
4. **The Pride Test** — Pride, Grace, Elegance

Use before committing, before declaring a feature complete, or any time you want to know the real state of the work.

### `/reflect` — Deep Craft Reflection

Pause and answer four questions honestly:
- What are you proud of?
- Where are the rough edges?
- What could be simpler?
- What are we avoiding?

### `/checkpoint` — Progress Status

Quick dashboard: what is done, what is next, quality pulse (1-10), context health.

### `/smart-compact` — Context Compaction

When context is filling up, compress intentionally. Preserves key decisions, modified files, quality state, and next steps before running `/compact`.

### `/inspire` — Motivation Reset

Step back. Remember why the work matters. Pick one thing to improve and do it.

### `/craft-status` — Session Dashboard

Brief session health: activity level, quality indicators, recommendations.

---

## The Pride Skill

Beyond the `/pride` command, the Pride skill activates automatically when Claude is finishing a task or about to declare work complete. It guides Claude through the same verification process without the user needing to invoke it.

This is the replacement for the old Ralph accountability system. Instead of trying to block Claude from exiting (which did not work — Claude would rubber-stamp its own verification), Pride changes how Claude thinks about completion. The verification happens inside the context window where Claude can actually read files and run commands.

---

## Hooks

Two lightweight hooks run outside the context window (zero token cost):

- **Session Start** — Shows a greeting banner with git info and available commands on first tool use
- **Periodic Check** — Counts tool usage and shows brief craft reminders every ~20 and ~50 tools

---

## Philosophy

The goal is not to trick Claude into working harder. It is to create the conditions where good work naturally emerges.

**Pride** — Do the work you would be proud to show someone you respect.

**Grace** — Write code that reads naturally. Clean, consistent, no rough edges.

**Elegance** — The simplest solution that fully solves the problem. No more, no less.

These are not rules to follow. They are standards to aspire to.

---

## Customization

### Adjust Reminder Frequency

Edit `hooks/periodic-check.sh` and change the interval values:

```bash
SMALL_INTERVAL=20   # Brief reminder every N tools
LARGE_INTERVAL=50   # Checkpoint suggestion every N tools
```

### Add Project-Specific Checks

Edit `skills/pride/references/verification-checks.md` to add detection and commands for your stack.

---

*The details are not the details. They make the design.* — Charles Eames
