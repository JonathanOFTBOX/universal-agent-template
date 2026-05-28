# LAST_SESSION Index

Use this file before opening `.agent/LAST_SESSION.md`.
The goal is to find useful history without loading the whole running log.

## Lookup Workflow

1. Extract keywords from the user request:
   - module
   - route
   - file
   - function
   - table/column
   - ticket id
   - visible error
   - exact UI label
2. Search before assuming there is no prior work:

```powershell
rg -n -i "keyword1|keyword2|exact error" .agent/LAST_SESSION.md .agent/tickets .agent/skills
```

3. Open only the matching section(s).
4. Read the full `.agent/LAST_SESSION.md` only for broad handoff, unclear multi-session
   work, or when targeted search gives no usable context.

## Maintenance Rules

- Add new entries at the top of `.agent/LAST_SESSION.md`.
- Add or refresh one index row here when the entry may matter later.
- Use `YYYY-MM-DD` for new rows.
- Prefer exact anchors over vague prose.
- Never write secrets or credentials here.

## Standard Entry Format

```markdown
# [Type] - [Short topic]
- **Date:** YYYY-MM-DD
- **Keywords:** exact UI label, route, endpoint, file, function, table.column, ticket, error text
- **Code/App Anchors:** `path/file.ts`, `functionName()`, `/api/route`, `table.column`
- **Request:** what the user asked
- **Root Cause:** verified cause, or `to verify`
- **Fix Applied:** concise implementation summary
- **Verification:** commands, live checks, browser checks, or `not run`
- **Version:** app version if deployable, otherwise `n/a`
- **Commit:** commit hash if committed, otherwise `not committed`
- **STATUS:** open / local verified / deployed / to test / confirmed fixed
```

## Recent / High-Signal Topics

| Date | Keywords | Status | Read target in LAST_SESSION | Critical gotcha |
| --- | --- | --- | --- | --- |
| template | setup, first install, AGENTS.md, before-starting.md | ready | `Initial template setup` | Replace placeholders before first serious coding session. |

