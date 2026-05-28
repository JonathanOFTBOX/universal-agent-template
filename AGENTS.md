# Agent Instructions for [PROJECT_NAME]

This file is the entry point for AI coding agents working in this repository.
The user request remains the source of truth. These rules define how to work safely.

## Project Profile

- Project name: `[PROJECT_NAME]`
- Project type: `[PROJECT_TYPE]`
- Production host: `[PRODUCTION_HOST]`
- Deploy target: `[DEPLOY_TARGET]`
- Database provider: `[DATABASE_PROVIDER]`
- Package manager: `[PACKAGE_MANAGER]`
- Main check command: `[CHECK_COMMAND]`
- Main build command: `[BUILD_COMMAND]`

## Start Every Task

Before editing any file:

1. Run `git status --short`.
2. Read `.agent/workflows/before-starting.md`.
3. Read `GEMINI.md` if it exists.
4. Read `.agent/LAST_SESSION_INDEX.md`.
5. Search prior context with targeted keywords:

```powershell
rg -n -i "keyword1|keyword2|exact error" .agent/LAST_SESSION.md .agent/tickets .agent/skills
```

Open only matching sections. Do not load the full running log unless the work is broad,
unclear, or the targeted search gives no useful context.

## Ticket Rule

If the user mentions a ticket, bug id, issue id, task id, or file under `.agent/tickets/`,
read that ticket before touching code.

If active tickets exist and the request is broad, inspect the matching ticket first.
Do not let unrelated tickets widen a narrow user request.

## Skill Routing

The local skills live under `.agent/skills/<skill-name>/SKILL.md`.
Read only the skills that match the task.

Common routes:

- Bug/regression: `.agent/skills/bug-tracking/SKILL.md`
- Code review: `.agent/skills/code-review/SKILL.md`
- API/server/webhooks: `.agent/skills/api-production/SKILL.md`
- Database/schema/RLS/data: `.agent/skills/database-schema/SKILL.md`
- DB field flowing to UI/API: `.agent/skills/data-flow-checklist/SKILL.md`
- UI/frontend/mobile: `.agent/skills/frontend-ui/SKILL.md`
- i18n/visible text: `.agent/skills/i18n-translations/SKILL.md`
- Security/auth/permissions/billing: `.agent/skills/security-check/SKILL.md`
- UTF-8/accents/dollar signs/character safety: `.agent/skills/encoding-utf8/SKILL.md`
- Git scope/staging: `.agent/skills/git-scope/SKILL.md`
- Tests/checks: `.agent/skills/testing-workflow/SKILL.md`
- Version/deploy commit: `.agent/skills/version-control/SKILL.md`
- Session log/index: `.agent/skills/session-log/SKILL.md`

## Work Scope Rules

- Keep changes scoped to the user's request.
- Do not modify unrelated files.
- Do not revert user changes unless explicitly asked.
- If the repo is dirty, preserve unrelated changes.
- Prefer existing project patterns over new abstractions.
- Add an abstraction only when it removes real complexity or matches an existing pattern.
- Do not create bookkeeping files for tiny tasks unless the user asks or the workflow requires it.

## Data And Production Rules

- Never guess database columns, policies, routes, env vars, or production behavior.
- Verify live schema or source-of-truth docs before writing DB-facing code.
- Trace full data paths when adding, removing, or renaming fields.
- Treat auth, billing, permissions, RLS, deploy config, and migrations as high risk.
- Do not print secrets, tokens, private keys, connection strings, or raw credentials.

## Frontend Rules

- Do not hardcode user-facing text if the project has i18n.
- UI changes must work on mobile and desktop unless the user narrows the scope.
- Minimum practical mobile touch target: 44x44 px.
- Preserve adjacent platforms: a mobile fix should not break desktop; a desktop fix should not break mobile.
- For layout changes, verify with a real browser or screenshot when practical.

## Verification

Run the most relevant check for the change.

Use `[CHECK_COMMAND]` or `[BUILD_COMMAND]` when practical. If a command is too slow,
unavailable, or fails because of known unrelated issues, report that clearly with examples.

For DB changes, verify after applying the migration.
For UI changes, verify the affected viewport(s).
For pure docs changes, run a lightweight text/structure check.

## Commit And Push

Before committing:

1. Show a concise summary of changed files.
2. Show verification performed.
3. Stage only files related to the request.
4. Use the user's exact commit message if provided.

For deployable changes, follow `.agent/workflows/commit-ready.md`.

## Session History

Update `.agent/LAST_SESSION.md` and `.agent/LAST_SESSION_INDEX.md` when the work creates
future-relevant context, fixes a bug, adds a ticket, changes production behavior, or spans
multiple steps.

Use `.agent/skills/session-log/SKILL.md` and templates under `.agent/templates/`.
