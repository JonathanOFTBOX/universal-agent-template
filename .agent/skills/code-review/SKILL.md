---
name: code-review
description: Use when asked to review code, a pull request, branch, diff, commit, or implementation. Prioritizes bugs, regressions, security risks, missing tests, and file/line grounded findings.
---

# Code Review

## Output Order

1. Findings first, ordered by severity.
2. Open questions or assumptions.
3. Short change summary only after findings.
4. Test gaps or residual risk.

## Finding Format

```markdown
- [P1] Short issue title - `path/file.ts:123`
  Explain the concrete bug/risk, when it happens, and what should change.
```

Severity:

- `P0`: breaks production, data loss, security incident.
- `P1`: likely user-facing bug or serious regression.
- `P2`: edge case, maintainability risk, missing important test.
- `P3`: minor polish.

## Rules

- Do not lead with praise.
- Do not list style opinions unless they create real risk.
- Cite exact files/lines when possible.
- If no issues are found, say that clearly and mention remaining test gaps.

