---
description: Run before committing deployable or important code changes.
trigger: manual
---

# Commit Ready Workflow

Use this before commit/push. Keep scope narrow.

## 1. Freeze Scope

Run:

```powershell
git status --short
git diff --stat
```

Identify:

- files changed by this task;
- unrelated dirty files to leave untouched;
- generated files that should not be committed.

## 2. Versioning

If this is a deployable app change, update the project version anchors documented in
`.agent/PROJECT_CONTEXT.md` and `.agent/COMMANDS.md`.

If the project has no versioning policy, say that clearly in the pre-commit summary.

## 3. Verification

Run the relevant command:

```powershell
[CHECK_COMMAND]
```

or:

```powershell
[BUILD_COMMAND]
```

For narrow changes, a smaller targeted command is acceptable if it gives better signal.

## 4. Agent Doctor

Run:

```powershell
.agent/scripts/agent-doctor.ps1 -CommitReady -StagedOnly
```

If files are not staged yet, run:

```powershell
.agent/scripts/agent-doctor.ps1
```

## 5. Summary Before Commit

Tell the user:

- changed files;
- verification command and result;
- version bump status;
- exact commit message if known.

## 6. Stage Narrowly

Stage only files related to the request:

```powershell
git add -- path/to/file1 path/to/file2
```

Never use broad staging in a dirty repo unless the user explicitly asks.

