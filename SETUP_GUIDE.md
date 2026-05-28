# Setup Guide

Use this guide when installing the template in a new project.

## 1. Copy Files

Copy these files/folders to the root of the target repo:

```text
AGENTS.md
GEMINI.md
CUSTOM_INSTRUCTIONS.md
.agent/
```

Or use:

```powershell
.\install-template.ps1 -TargetRepo "C:\path\to\your\project"
```

## 2. Replace Placeholders

Search:

```powershell
rg -n "\[[A-Z0-9_]+\]" AGENTS.md CUSTOM_INSTRUCTIONS.md .agent
```

Replace every placeholder with project-specific values.

Common placeholders:

- `[PROJECT_NAME]`
- `[PROJECT_TYPE]`
- `[PRODUCTION_HOST]`
- `[DEPLOY_TARGET]`
- `[DATABASE_PROVIDER]`
- `[PACKAGE_MANAGER]`
- `[CHECK_COMMAND]`
- `[BUILD_COMMAND]`

## 3. Configure Project Facts

Edit:

- `.agent/PROJECT_CONTEXT.md`
- `.agent/CRITICAL_FILES.md`
- `.agent/CODE_PATTERNS.md`
- `.agent/COMMANDS.md`
- `.agent/KNOWN_GOTCHAS.md`

These files are where the template becomes specific and valuable.

## 4. Configure Codex Custom Instructions

Open `CUSTOM_INSTRUCTIONS.md`.
Copy the main block into Codex > Custom instructions.

For a client, keep the wording generic and include:

- read `AGENTS.md`;
- run `git status --short`;
- do not touch unrelated files;
- read `.agent/workflows/before-starting.md`;
- read tickets before code;
- summarize before commit/push.

## 5. Verify Install

From the project root:

```powershell
.agent/scripts/agent-doctor.ps1
```

Expected:

- required files found;
- placeholders reported if still present;
- git status shown;
- no missing core files.

## 6. Expected Target Project Shape

After setup, the target project should look like this:

```text
your-project/
  AGENTS.md
  CUSTOM_INSTRUCTIONS.md
  GEMINI.md
  .agent/
    workflows/
    skills/
    templates/
    LAST_SESSION.md
    LAST_SESSION_INDEX.md
```

## 7. First Agent Prompt

Use this after installing:

```text
Lis AGENTS.md, .agent/workflows/before-starting.md et .agent/PROJECT_CONTEXT.md. Dis-moi les placeholders restants et ce que tu dois savoir avant de coder dans ce projet.
```

## 8. Suggested Product Packaging

If selling this as a template, include:

- the template folder;
- a short video or PDF showing installation;
- one customized example project;
- a disclaimer that users must fill in project-specific production, DB and deploy details.
