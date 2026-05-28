---
name: testing-workflow
description: Use when choosing or running verification commands, tests, lint, typecheck, build, browser checks, smoke tests, or when a check fails. Requires reporting exact commands and meaningful failures.
---

# Testing Workflow

## Choose The Smallest Useful Check

- Pure docs: text scan, script check, or `git diff --check`.
- Narrow function: unit test or targeted command.
- Shared types/API: typecheck and relevant tests.
- UI layout: browser/screenshot plus typecheck if code changed.
- DB/schema: inspect/apply/verify plus app checks.
- Deployable change: build or project deploy verification command.

## Report Format

```markdown
Verification:
- Command: `[COMMAND]`
- Result: pass/fail/not run
- Notes: exact failure or reason not run
```

## Failure Rule

If a check fails:

1. Read the first real error.
2. Decide if it is related to the change.
3. Fix related failures.
4. Report unrelated known failures with examples.

Do not claim success without command output or direct verification.

