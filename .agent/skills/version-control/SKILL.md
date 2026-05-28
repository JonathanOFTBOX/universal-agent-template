---
name: version-control
description: Use before deployable commits, release prep, version bumps, changelog notes, commit messages, and push requests. Ensures version anchors and commit scope match project policy.
---

# Version Control

## Project Version Anchors

Fill this in per project:

- `[VERSION_FILE_1]`
- `[VERSION_FILE_2]`
- `[VERSION_FILE_3]`

## Before Deployable Commit

1. Confirm the change is deployable.
2. Increment required version files.
3. Run relevant verification.
4. Run `.agent/scripts/agent-doctor.ps1 -CommitReady -StagedOnly` after staging.
5. Show summary before commit.

## Commit Message

- If the user gives an exact message, use it exactly.
- Otherwise use a concise imperative message:

```text
Fix [specific thing]
Add [specific thing]
Update [specific thing]
```

## Push

Push only after commit succeeds and the user asked for push or the workflow clearly includes it.

