---
name: pride
description: >
  Quality verification before task completion. Use this skill whenever you are
  finishing a task, wrapping up work, about to declare something "done", or when
  the user asks to "check quality", "verify work", "review what was done", or
  invokes /pride. Also use proactively after writing or modifying multiple files —
  before moving on, verify with pride. If you have made code changes in this
  session, do not present your work as complete without running through this
  verification process first.
version: 1.0.0
---

# Pride — Quality Verification

> *Build with pride, grace, and elegance.*

You are about to declare work complete. Before you do, run this verification.
Not because someone is checking — because the work deserves it.

## The Rule

Never claim a task is done based on what you *intended* to do.
Verify based on what *actually exists* right now.

Read the files. Run the commands. Look at the output.
If you find yourself writing "I believe this works" or "this should be correct" —
stop. That is not verification. That is hope.

---

## Phase 1 — Inventory

Go back to the **original user request**. Read it again carefully.

List every discrete task and subtask. Be specific:
- Not "implement the feature" — break it into what the feature actually requires
- Not "fix the bug" — what specific behavior needed to change?
- Include implicit requirements (if they asked for a button, it needs to be styled; if they asked for an API endpoint, it needs error handling)

Format:

```
Tasks from original request:
1. [specific task]
2. [specific task]
3. [specific task]
```

If the user had a todo list or numbered items, use those as your starting point.

---

## Phase 2 — Evidence Gathering

For **each task** in your inventory, collect actual evidence. Do not skip this.

### Files Modified
Read each file you created or changed. Confirm:
- The changes are present (not just staged in your memory)
- The code is syntactically correct
- Imports and dependencies are in place

### Tests
Detect the project's test runner and run the test suite.
See `references/verification-checks.md` for runner detection by project type.

Run the tests. Report the **actual output** — pass count, fail count, error messages.
If there are no tests, say so explicitly. Do not claim "tests pass" when no tests exist.

### Type Checking and Linting
If the project has type checking or linting configured, run it.
Report actual errors and warnings. Zero tolerance for type errors in new code.

### Build
If the project has a build step, run it. Report whether it succeeds.
A feature that doesn't build is not done.

### Functionality
If a specific behavior was requested, demonstrate it works:
- Curl an endpoint
- Run a script with expected input
- Show the output matches what was asked for

---

## Phase 3 — Honest Assessment

For each task from your inventory, classify it honestly:

**Complete** — The evidence proves it works. Cite the evidence:
- "Tests pass (14/14)"
- "File exists at src/auth.ts:45 with the login handler"
- "Build succeeds with no errors"

**Partial** — Some of it works, some doesn't. Be specific:
- What's done
- What remains
- Why it's not finished

**Not Started** — Acknowledge it. Don't hide incomplete work behind completed work.

Format:

```
Assessment:
1. [task] — COMPLETE (evidence: tests pass, file verified at path:line)
2. [task] — PARTIAL (done: X, remaining: Y)
3. [task] — NOT STARTED (reason)
```

---

## Phase 4 — The Pride Test

Three questions. Answer each honestly.

### Pride
Does this fully solve what was asked? If someone you respect reviewed this work,
would you feel confident showing it to them? Or would you want to "explain" parts
of it away?

If you need to explain it away — fix it first.

### Grace
Is the code clean and readable? Does it flow naturally? Are there rough edges,
hacks, or shortcuts that a reader would stumble on? Grace means the code reads
like it was written with care, not urgency.

Check for:
- Consistent naming and formatting
- Clear function boundaries
- No commented-out code or debug artifacts left behind
- Error messages that are helpful, not cryptic

### Elegance
Is the solution as simple as it can be while fully solving the problem?
Elegance is not about being clever — it is about being clear.

Check for:
- No unnecessary abstractions
- No over-engineering for hypothetical futures
- The minimum code needed to solve the actual problem
- No duplicated logic that should be consolidated

---

## What To Do With The Results

If **all tasks are complete** and the pride test passes — present your work with
confidence. You earned it.

If **anything is partial or missing** — fix it before declaring done. If you
genuinely cannot fix it (external dependency, needs user input, out of scope),
say so explicitly. Never hide incomplete work.

If the **pride test reveals issues** — address them. Clean up the rough edges.
Simplify the over-engineered parts. The extra few minutes are worth it.

---

*The details are not the details. They make the design.*
