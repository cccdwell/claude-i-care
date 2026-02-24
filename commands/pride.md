---
description: "Run a pride quality verification on current work"
allowed-tools: [Bash, Read, Glob, Grep, TodoWrite]
---

# Pride Check

> *Build with pride, grace, and elegance.*

Run a full quality verification on the work done in this session.

## Instructions

Read the Pride skill at `skills/pride/SKILL.md` in this plugin and follow the
complete 4-phase verification process:

1. **Inventory** — List every task from the original request
2. **Evidence Gathering** — Read files, run tests, check types/lint, verify builds
3. **Honest Assessment** — Classify each task as COMPLETE, PARTIAL, or NOT STARTED
4. **The Pride Test** — Pride, Grace, Elegance

For project-specific test runners and linting commands, consult
`skills/pride/references/verification-checks.md`.

## Output Format

Present results as:

```
Pride Check
===========

Tasks:
1. [task] — COMPLETE | PARTIAL | NOT STARTED
   Evidence: [what you verified and how]

2. [task] — COMPLETE | PARTIAL | NOT STARTED
   Evidence: [what you verified and how]

Test Results: [actual output from test runner]
Type Check:   [actual output or "not configured"]
Build:        [actual output or "not applicable"]

The Pride Test:
  Pride:    [pass/fix needed — brief explanation]
  Grace:    [pass/fix needed — brief explanation]
  Elegance: [pass/fix needed — brief explanation]
```

If anything needs fixing, fix it and re-run the relevant checks.
Do not present a pride check with known failures.
