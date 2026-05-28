---
name: api-production
description: Use when changing API routes, server handlers, edge functions, webhooks, background jobs, provider callbacks, or production/backend behavior. Forces production path verification before local-only edits.
---

# API Production

## Rules

- Identify the production code path before editing.
- Do not change only local dev routes if production uses a different folder.
- Verify auth, tenant/company/user scope where applicable.
- For webhooks, verify signature validation and idempotency.
- For external providers, verify current provider docs or source code when behavior may have changed.

## Checklist

1. Production route file: `[PRODUCTION_API_PATH]`
2. Local route file if different: `[LOCAL_API_PATH]`
3. Auth/session middleware: `[AUTH_PATH]`
4. Shared types/schema: `[SHARED_TYPES_PATH]`
5. Tests/checks: `[API_TEST_COMMAND]`

## Verification

Use a real request, test, or build where practical.
If production and local routes differ, state which one was changed.

