---
description: Verify a change before deploy or before asking the user to test.
trigger: manual
---

# Deploy Verify Workflow

Use when a change is deployable, production-facing, or user-facing.

## Checklist

1. Confirm the deploy target in `.agent/PROJECT_CONTEXT.md`.
2. Confirm production code path:
   - frontend route/component;
   - production API route;
   - DB table/policy;
   - storage bucket;
   - external provider.
3. Run the most relevant check:

```powershell
[CHECK_COMMAND]
[BUILD_COMMAND]
```

4. For UI changes, verify the affected viewport.
5. For DB/schema changes, inspect before and after.
6. For auth/billing/permissions, verify tenant/company/user scope.
7. Update session history if this creates future context.
8. Summarize what is safe to test and what remains risky.

## Output Format

```markdown
Deploy verify:
- Scope: ...
- Production path checked: ...
- Verification: ...
- Version: ...
- Risks: ...
- Ready for user test: yes/no
```

