# Legacy Agent Rules for [PROJECT_NAME]

Read this on every new user request when working in this repository.
`AGENTS.md` is the main source for Codex. This file exists for compatibility with
agents that look for `GEMINI.md`.

## Mandatory Pre-Code Checklist

Before touching any file:

1. Run `git status --short`.
2. Read `AGENTS.md`.
3. Read `.agent/workflows/before-starting.md`.
4. Read `.agent/LAST_SESSION_INDEX.md`.
5. Search prior context with task-specific keywords.
6. Read the matching ticket if the user mentions one.
7. Read only the relevant local skills under `.agent/skills/`.

## Non-Negotiables

- Do not modify unrelated files.
- Do not revert human changes without explicit permission.
- Do not guess production behavior.
- Do not guess database columns or policies.
- Do not write secrets to logs, docs, commits, tickets, or chat.
- Do not commit without a summary and verification.

## Data Path Rule

If a change touches data moving between database, API, types, state, and UI, complete
the six-step check in `.agent/skills/data-flow-checklist/SKILL.md`.

## Version / Deploy Rule

If the project has version files, update all required version anchors before a deployable
commit. Document those files in `.agent/PROJECT_CONTEXT.md` and `.agent/COMMANDS.md`.

