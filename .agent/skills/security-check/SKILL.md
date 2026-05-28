---
name: security-check
description: Use for auth, permissions, tenant isolation, secrets, RLS, billing, webhooks, file uploads, SSRF, XSS, SQL, command execution, dependency risk, or security-sensitive review.
---

# Security Check

## High-Risk Areas

- Auth/session handling
- Tenant/company/user scoping
- Billing/payment/provider webhooks
- Database RLS and policies
- File uploads and downloads
- Admin/superadmin routes
- Secrets and env vars
- Dynamic SQL, command execution, URL fetches

## Rules

- Verify deny paths, not only happy paths.
- Never log or print secrets.
- Keep provider secrets server-side.
- Validate webhook signatures before trusting payloads.
- Sanitize or encode user-provided content before rendering HTML.
- Do not broaden permissions to make a bug disappear.

## Output

For security-sensitive changes, include:

- what access is allowed;
- what access is denied;
- how it was verified;
- remaining risk.

