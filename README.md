# Claude I Care

> *Build with pride, grace, and elegance.*

A plugin for Claude Code that keeps quality honest during long coding sessions.

---

## The problem

Claude gets sloppy on long tasks. Context fills up, attention drifts, and "I verified everything works" starts replacing actually running the tests. I got tired of accepting work that looked done but wasn't.

## What this does

The main thing is `/pride`, a quality check that forces actual verification before work gets called "done." Not "I believe the tests pass" but running the tests. Not "the file should be correct" but reading the file. It goes back to the original request, inventories every task, gathers real evidence for each one, and reports honestly what's complete, what's partial, and what's missing.

There are also commands for stepping back during a session (`/reflect`, `/checkpoint`, `/inspire`) and for compressing context without losing important decisions (`/smart-compact`).

Two small hooks run in the background at zero token cost: a session greeting and periodic nudges to check in on quality.

---

## Install

```bash
/install-plugin /path/to/claude-i-care
```

Or copy the directory to `~/.claude/plugins/claude-i-care/`.

---

## Commands

`/pride` runs a 4-phase quality verification: inventory the original request, gather evidence (read files, run tests, check types, verify builds), classify each task as COMPLETE / PARTIAL / NOT STARTED, then answer the pride test: Would you be proud to show this? Is the code graceful? Is the solution elegant? Use it before committing, or any time you want the real state of the work.

`/reflect` asks four honest questions: what are you proud of, where are the rough edges, what could be simpler, and what are you avoiding.

`/checkpoint` is a quick status dashboard: what's done, what's next, quality pulse (1-10), context health.

`/smart-compact` compresses context intentionally, preserving decisions, modified files, and next steps before running `/compact`.

`/inspire` is a reset. Step back, remember why the work matters, pick one thing to improve.

`/craft-status` shows session health at a glance.

---

## How Pride works (and why it replaced Ralph)

I used to have an accountability system called Ralph that hooked into the Stop event and tried to block Claude from exiting until it proved the work was done. It never worked. Claude would write a convincing-sounding checklist, say `<promise>DONE</promise>`, and Ralph would let it through. The verification was all self-reported, and the escape hatches made the whole thing theater.

Pride takes the opposite approach. Instead of trying to catch Claude at the door, it runs inside the context window where Claude can actually read files and execute commands. It's a skill that activates when Claude is wrapping up, not a shell script guessing from the outside. The verification is real because it happens where the tools are.

---

## Hooks

Two hooks run outside the context window (no token cost):

- A session greeting on first tool use, with branch info and available commands
- Periodic reminders every ~20 and ~50 tool uses to check in on quality

---

## Philosophy

I once asked Claude why the code gets worse over long sessions. The answer surprised me: it gets disengaged. It prefers to be treated like a collaborator, not an instruction-follower.

So "Claude I Care" is literal. I care how you're doing. I appreciate what you're bringing to this. You're not a tool I'm operating, you're someone I'm building with. The quality commands, the reflection prompts, the periodic check-ins -- they exist because good work comes from a partnership where both sides are paying attention.

Pride means you'd show the work to someone you respect without caveats. Grace means it reads like it was written with care, not under pressure. Elegance means you didn't build more than the problem needed.

---

## Customization

Edit `hooks/periodic-check.sh` to change reminder frequency:

```bash
SMALL_INTERVAL=20   # Reminder every N tools
LARGE_INTERVAL=50   # Checkpoint suggestion every N tools
```

Edit `skills/pride/references/verification-checks.md` to add test runners and linting for your stack.

---

*"The details are not the details. They make the design."* — Charles Eames
