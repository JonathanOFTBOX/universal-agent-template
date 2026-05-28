---
name: git-scope
description: Use for dirty worktrees, staging, commits, pushes, branch changes, or when multiple agents/users may have modified files. Enforces narrow scope and prevents reverting unrelated work.
---

# Git Scope

## Start

Run:

```powershell
git status --short
```

Classify files:

- related to this request;
- unrelated existing changes;
- generated artifacts;
- unknown/risky.

## Rules

- Do not revert user changes without permission.
- Do not stage unrelated files.
- Do not use broad `git add .` in a dirty repo.
- Do not use destructive commands unless the user clearly asked.
- If a touched file contains unrelated edits, preserve them and stage carefully.

## Before Commit

Run:

```powershell
git diff --stat
git diff --check
git status --short
```

Then stage exact files:

```powershell
git add -- path/to/file1 path/to/file2
```

