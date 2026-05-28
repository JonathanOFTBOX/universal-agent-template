---
name: database-schema
description: Use for database schema, SQL, migrations, RLS, policies, auth-dependent data, data debugging, or any code that reads/writes persistent tables. Requires source-of-truth inspection before changes.
---

# Database Schema

## Source Of Truth

Document the real source of truth for this project:

- live DB inspection command/tool: `[DB_INSPECT_METHOD]`
- migration folder: `[MIGRATIONS_PATH]`
- generated types: `[DB_TYPES_PATH]`
- schema docs: `[SCHEMA_DOC_PATH]`

## Rules

- Never guess columns, policies, enum values, or relationship names.
- Inspect the live schema or current migration/type source before writing SQL.
- For RLS/auth changes, verify both allowed and denied paths.
- For destructive changes, ask for explicit confirmation unless the user already gave it clearly.
- Do not print secrets or connection strings.

## Change Flow

1. Inspect current schema/policy/data.
2. Identify the minimum SQL or code change.
3. Apply migration through the project's approved migration path.
4. Verify schema/policy/data after applying.
5. Update types/docs if the project requires it.
6. Run app checks that cover the touched path.

