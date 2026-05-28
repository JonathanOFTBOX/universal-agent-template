---
name: bug-tracking
description: Use for bug reports, regressions, broken UI, failed workflows, user screenshots, logs, or unexpected behavior. Guides reproduction, root-cause isolation, focused fixes, verification, and durable bug log entries.
---

# Bug Tracking

## Workflow

1. Capture exact user symptom:
   - visible label;
   - route/page;
   - user role;
   - input/action;
   - exact error/log if provided.
2. Search prior context:

```powershell
rg -n -i "exact label|error|file|function" .agent/LAST_SESSION_INDEX.md .agent/LAST_SESSION.md .agent/tickets .agent/skills
```

3. Reproduce or isolate from code/data before fixing.
4. Identify the smallest code path that explains the symptom.
5. Patch only related files.
6. Run the most relevant verification.
7. If future-relevant, add a `LAST_SESSION.md` entry and index row.

## Root Cause Standard

Do not write a guessed root cause as fact.
Use `to verify` until confirmed by code, data, command output, or browser behavior.

## Fix Standard

- Fix the failing path directly.
- Preserve adjacent behavior.
- Avoid refactors that are not required to fix the bug.
- Include regression checks when risk justifies it.

