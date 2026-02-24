---
description: "Intentional context compaction — preserve what matters"
---

# Smart Compact

> *Build with pride, grace, and elegance.*

Context is filling up. Time to compress intentionally — not lose critical knowledge.

## Before Compacting

Capture and prepare a summary that preserves:

1. **Current task**: What we are working on and the approach being taken
2. **Key decisions**: Architectural and design choices made this session
3. **Files modified**: Which files were changed and why
4. **Quality state**: Any concerns flagged, pride test results, known issues
5. **What to verify next**: Unfinished work or items needing follow-up
6. **Dependencies discovered**: APIs, libraries, patterns that matter

## Execute Compaction

After preparing the summary, run the `/compact` command with your summary.

Example:
```
/compact Working on [feature]. Key decisions: [x, y]. Modified: [files]. Next: [action]. Quality concern: [issue]. Watch for: [thing].
```

## After Compacting

Confirm to the user:
- "Context compacted. We were working on..."
- "Key decisions preserved: ..."
- "Next step: ..."
- "Watch out for: ..."

Keep the confirmation brief — the point is continuity, not documentation.
