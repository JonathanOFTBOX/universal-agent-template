# Known Gotchas

Keep this file short. It is for high-risk facts the agent must see quickly.

## Fill These In

- Production deploy target: `[DEPLOY_TARGET]`
- Production host: `[PRODUCTION_HOST]`
- Database provider: `[DATABASE_PROVIDER]`
- Auth provider: `[AUTH_PROVIDER]`
- Payment provider: `[PAYMENT_PROVIDER]`
- Critical env vars: document names only, never values.

## Default Gotchas

- Do not print secrets, tokens, private keys, cookies, or raw credentials.
- Do not change production API behavior without verifying the production route.
- Do not change DB schema or RLS without inspecting the live schema first.
- Do not refactor realtime, auth, billing, permissions, or deploy logic unless asked.
- Do not stage unrelated dirty files.
- Do not mark work complete without verification evidence.

