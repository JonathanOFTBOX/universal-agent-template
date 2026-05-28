---
name: session-log
description: Use when updating LAST_SESSION.md or LAST_SESSION_INDEX.md, creating handoff context, recording bug fixes, deploy notes, tickets, or reusable project memory. Keeps entries searchable and append-only.
---

# Session Log Management

## Core Rule

`LAST_SESSION.md` is append-only.
`LAST_SESSION_INDEX.md` is the lightweight search map.

## Do

- Read `.agent/LAST_SESSION_INDEX.md` first.
- Search `.agent/LAST_SESSION.md` before adding duplicate topics.
- Add new entries at the top of `.agent/LAST_SESSION.md`.
- Add or refresh an index row when future agents need the context.
- Use exact anchors: UI labels, routes, endpoints, files, functions, tables, columns, ticket ids, error text.

## Do Not

- Do not overwrite the full running log.
- Do not delete old entries.
- Do not remove known issues; mark status changes.
- Do not write secrets, tokens, private keys, or raw credentials.

## Standard Entry

```markdown
# [Type] - [Short topic]
- **Date:** YYYY-MM-DD
- **Keywords:** exact UI label, route, endpoint, file, function, table.column, ticket, error text
- **Code/App Anchors:** `path/file.ts`, `functionName()`, `/api/route`, `table.column`
- **Request:** [what the user asked]
- **Root Cause:** [verified cause, or `to verify`]
- **Fix Applied:** [what changed]
- **Verification:** [commands, live checks, browser checks, or `not run`]
- **Version:** [version if deployable, otherwise `n/a`]
- **Commit:** [commit hash if committed, otherwise `not committed`]
- **STATUS:** [open / local verified / deployed / to test / confirmed fixed]
```

## Standard Index Row

```markdown
| YYYY-MM-DD | keyword1, keyword2, exactFunction, table.column | status | `LAST_SESSION heading` | one critical gotcha |
```

