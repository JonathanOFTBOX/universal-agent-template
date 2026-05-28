# Universal Agent Template

A reusable workflow system for working with Codex and other LLM agents on real projects.

This is not only for code.

It was built first for software projects, but the method can be used for any long project where an AI agent needs to remember rules, decisions, context, tasks, workflows and previous work.

## Try It In 5 Minutes

Clone this repo or download it as a zip.

```powershell
git clone https://github.com/JonathanOFTBOX/universal-agent-template.git
```

Copy these files into the root of your project:

```text
AGENTS.md
GEMINI.md
CUSTOM_INSTRUCTIONS.md
.agent/
```

Then open `CUSTOM_INSTRUCTIONS.md` and paste the main block into Codex Custom Instructions.

After that, ask Codex:

```text
Read AGENTS.md, .agent/workflows/before-starting.md, .agent/PROJECT_CONTEXT.md and .agent/COMMANDS.md. Then audit the remaining placeholders and tell me what project-specific details are missing before we start.
```

That first audit is important.
It turns the generic template into rules for your real project.

## What You Should See After Setup

After setup, your project should have:

```text
your-project/
  AGENTS.md
  CUSTOM_INSTRUCTIONS.md
  .agent/
    workflows/
    skills/
    templates/
    LAST_SESSION.md
    LAST_SESSION_INDEX.md
```

Codex should start new work by reading `AGENTS.md`, checking `.agent/workflows/before-starting.md`, searching the session index, and loading only the skills needed for the task.

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

### Option A: Manual Copy

1. Download or clone this repository.
2. Copy these into your target project:
   - `AGENTS.md`
   - `GEMINI.md`
   - `CUSTOM_INSTRUCTIONS.md`
   - `.agent/`
3. Replace placeholders like:
   - `[PROJECT_NAME]`
   - `[PROJECT_TYPE]`
   - `[CHECK_COMMAND]`
   - `[BUILD_COMMAND]`
   - `[DEPLOY_TARGET]`
   - `[DATABASE_PROVIDER]`
4. Open `CUSTOM_INSTRUCTIONS.md`.
5. Copy the main block into Codex Custom Instructions.
6. Ask Codex to audit the setup.

### Option B: PowerShell Install

From this template folder:

```powershell
.\install-template.ps1 -TargetRepo "C:\path\to\your\project"
```

Then go to the target project and run:

```powershell
.agent/scripts/agent-doctor.ps1
```

The doctor script checks that the required files exist and reports remaining placeholders.

Suggested first prompt:

```text
Read AGENTS.md, .agent/workflows/before-starting.md, .agent/PROJECT_CONTEXT.md and .agent/COMMANDS.md. Then audit the remaining placeholders and tell me what project-specific details are missing before we start coding.
```

## What To Customize

Edit these files first:

- `.agent/PROJECT_CONTEXT.md`: product, users, stack and architecture.
- `.agent/COMMANDS.md`: install, dev, test, build and deploy commands.
- `.agent/CRITICAL_FILES.md`: files that are risky or central.
- `.agent/CODE_PATTERNS.md`: local coding and workflow patterns.
- `.agent/KNOWN_GOTCHAS.md`: short list of high-risk project facts.
- `CUSTOM_INSTRUCTIONS.md`: instructions to paste into Codex.

Keep these files short and useful.
The point is to help the agent find the right context fast.

## Recommended Codex Custom Instruction

Use the full version in `CUSTOM_INSTRUCTIONS.md`.

Short version:

```text
Read AGENTS.md at the repo root and follow it. Before edits: run git status --short, read .agent/workflows/before-starting.md, read .agent/LAST_SESSION_INDEX.md, search context with rg, then load only relevant .agent skills. Do not modify unrelated files. Do not revert user changes without permission. Verify with real commands. Summarize before commit or push.
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
