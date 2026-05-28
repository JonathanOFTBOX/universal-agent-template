# Universal Agent Template

A reusable workflow system for working with Codex and other LLM agents on real projects.

This is not only for code.

It was built first for software projects, but the method can be used for any long project where an AI agent needs to remember rules, decisions, context, tasks, workflows and previous work.

## The Main Idea

Most people use AI agents with prompts only.

That works for small tasks, but it breaks down on real projects.

The chat context gets long.
Rules get forgotten.
Decisions get lost.
The agent may touch files that are not related.
The same instructions must be repeated again and again.

This template fixes that by putting the project memory inside the project itself.

The agent does not rely only on the temporary chat context.
It can reload the important project context from files.

## What This Template Adds

This template gives your project:

- a main instruction file with `AGENTS.md`;
- reusable workflows in `.agent/workflows`;
- specialized skills in `.agent/skills`;
- a persistent session log in `.agent/LAST_SESSION.md`;
- a lightweight index in `.agent/LAST_SESSION_INDEX.md`;
- templates for tickets, bugs, checks and handoffs;
- rules for Git scope, tests, deploy, database work, UI work, security and UTF-8 safety.

## Why Persistent Project Memory Matters

LLM agents do not have perfect memory.
Even with a large context window, important details can get buried.

This template creates a permanent project memory.

The agent can start a new session and read:

- project rules;
- prior decisions;
- open tickets;
- previous bugs;
- known gotchas;
- important files;
- commands to run;
- verification rules;
- session history.

That means the project can continue across long sessions, new chats, new agents and large amounts of context.

## What Problems It Solves

This workflow helps reduce:

- repeated instructions;
- forgotten project rules;
- lost decisions;
- large and messy chat context;
- unrelated file edits;
- broad commits;
- missing tests;
- missing deploy checks;
- broken handoffs;
- forgotten tickets;
- UTF-8 and character issues;
- broken accents, symbols and dollar signs;
- agents starting work without reading the right context.

## Compared To Just Using Prompts

Without this workflow:

- every new session can feel like starting over;
- important rules live only in the chat;
- the agent may not know what happened last week;
- project-specific behavior must be explained again;
- the agent may load too much context or the wrong context;
- commit scope can get messy.

With this workflow:

- the project has a memory;
- the rules are versioned with the repo;
- the agent knows where to start;
- history is searchable;
- tickets and decisions stay visible;
- checks are documented;
- scope is easier to control.

## Not Only For Code

This template was designed for Codex and software engineering, but the same structure can work for many types of projects.

Examples:

- software projects;
- documentation;
- SOPs and business procedures;
- customer support workflows;
- sales and CRM processes;
- content operations;
- research projects;
- project management;
- automation systems;
- training material;
- multi-file business projects.

For non-code projects, the same files can be adapted:

- `AGENTS.md` becomes the main project rulebook;
- `.agent/workflows` becomes the procedure library;
- `.agent/skills` becomes the specialist method library;
- `.agent/LAST_SESSION.md` becomes the decision history;
- `.agent/LAST_SESSION_INDEX.md` becomes the search index;
- `.agent/tickets` becomes the task/request backlog;
- `.agent/templates` becomes the template library.

## Folder Structure

```text
AGENTS.md
CUSTOM_INSTRUCTIONS.md
.agent/
  workflows/
    before-starting.md
    commit-ready.md
    deploy-verify.md
  skills/
    api-production/
    bug-tracking/
    code-review/
    database-schema/
    data-flow-checklist/
    encoding-utf8/
    frontend-ui/
    git-scope/
    i18n-translations/
    security-check/
    session-log/
    testing-workflow/
    version-control/
  templates/
  tickets/
  LAST_SESSION.md
  LAST_SESSION_INDEX.md
```

## How The Agent Starts Work

For every meaningful task, the agent should:

1. Run `git status --short`.
2. Read `AGENTS.md`.
3. Read `.agent/workflows/before-starting.md`.
4. Read `.agent/LAST_SESSION_INDEX.md`.
5. Search prior context with `rg`.
6. Read the matching ticket if one is mentioned.
7. Load only the skills needed for the task.
8. Make the smallest safe change.
9. Run the most relevant verification.
10. Summarize before commit or push.

## How To Install

1. Copy the template into your project.
2. Replace placeholders like:
   - `[PROJECT_NAME]`
   - `[PROJECT_TYPE]`
   - `[CHECK_COMMAND]`
   - `[BUILD_COMMAND]`
   - `[DEPLOY_TARGET]`
   - `[DATABASE_PROVIDER]`
3. Open `CUSTOM_INSTRUCTIONS.md`.
4. Copy the main block into Codex Custom Instructions.
5. Ask Codex to audit the setup.

Suggested first prompt:

```text
Read AGENTS.md, .agent/workflows/before-starting.md, .agent/PROJECT_CONTEXT.md and .agent/COMMANDS.md. Then audit the remaining placeholders and tell me what project-specific details are missing before we start coding.
```

## Why This Is Useful For Real Engineering

Real engineering work is not just writing code.

It requires:

- knowing the current state;
- respecting previous decisions;
- understanding risky files;
- checking production paths;
- running the right tests;
- keeping commits narrow;
- preserving user changes;
- documenting what changed;
- handing work off clearly.

This template gives the agent a system for doing that.

## Important Note

This is not magic.

The agent still needs to follow the workflow.
The user still needs to review important changes.
The project still needs real checks and real source-of-truth documentation.

But this gives the agent a much better operating system than prompts alone.

## Tagline

Built for real LLM engineering work, not just prompts.

