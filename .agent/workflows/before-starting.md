---
description: Read this workflow before editing in this repository.
trigger: always
---

# Before Starting Work

Keep this workflow fast and targeted. `AGENTS.md` wins if rules conflict.

## Step 0 - Minimal Bootstrap

Always do this before editing:

1. Run `git status --short`.
2. Read `AGENTS.md`.
3. Read `GEMINI.md` if it exists.
4. Read `.agent/LAST_SESSION_INDEX.md`.
5. Read `.agent/KNOWN_GOTCHAS.md` when the task touches production, DB, billing,
   auth, permissions, realtime, deploy/versioning, or git scope.
6. Search prior context with task keywords:

```powershell
rg -n -i "keyword1|keyword2|exact error" .agent/LAST_SESSION.md .agent/tickets .agent/skills
```

Open only matching sections.

## Step 1 - Ticket Check

If the user references a ticket, issue, task id, bug id, or `.agent/tickets/*`,
read the matching ticket before touching code.

If the request is broad and active tickets exist, inspect the matching ticket first.
Do not let unrelated tickets widen a narrow request.

## Step 2 - Route The Task

Use the smallest matching route. Load only the required skill files.

| Request type | Read / use | Required behavior |
| --- | --- | --- |
| Simple question | index + targeted search | Answer from evidence. Do not create docs unless useful. |
| Bug report | `bug-tracking` | Reproduce or isolate before fixing. Add log if future-relevant. |
| Code review | `code-review` | Findings first, severity ordered, file/line references. |
| UI/frontend | `frontend-ui` | Preserve mobile and desktop. Verify practical viewport. |
| API/server/webhook | `api-production` | Verify production path, auth scope and local parity when needed. |
| DB/schema/data | `database-schema`, `data-flow-checklist` | Never guess columns/policies. Trace field path. |
| i18n/visible text | `i18n-translations` | Update every required language file. |
| Security-sensitive | `security-check` | Verify allowed and denied paths. Do not expose secrets. |
| Accents/UTF-8/$/copied text | `encoding-utf8` | Preserve UTF-8 and prevent broken characters or shell interpolation. |
| Tests/checks | `testing-workflow` | Run the most relevant check. Report blockers. |
| Commit/push | `git-scope`, `version-control`, `commit-ready` | Freeze scope and stage only related files. |
| Deploy/test release | `deploy-verify` | Build/check and document exact result. |
| Session docs | `session-log` | Use standard format and update index. |

## Step 3 - Scope Rules

- Keep the user request as the source of truth.
- Do not modify unrelated files.
- Do not revert user changes without explicit permission.
- Work with dirty files if they affect the task; ignore unrelated dirty files.
- Prefer existing project patterns.
- Avoid broad refactors unless needed to complete the request safely.

## Step 4 - Data Path Verification

For any field flowing between database, API, types, state, and UI:

1. Confirm live DB column or source-of-truth schema exists.
2. Confirm SELECT/query includes the field when explicit lists are used.
3. Confirm mapping/normalization includes the field.
4. Confirm shared schema/types match the live shape.
5. Confirm component/service types match usage.
6. Confirm insert/update payloads only write valid fields.

Use `.agent/skills/data-flow-checklist/SKILL.md`.

## Step 5 - Verification

Run the most relevant check:

- docs/workflow: text scan or script check;
- UI: browser/screenshot when practical;
- DB: inspect, apply, verify;
- code: targeted tests, typecheck, lint or build.

If verification cannot run, say exactly why.

## Step 6 - Documentation

Update `.agent/LAST_SESSION.md` and `.agent/LAST_SESSION_INDEX.md` only when the result
is useful for future sessions: bugs, deploys, production changes, architecture changes,
long investigations, or explicit user request.
