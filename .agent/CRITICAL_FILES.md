# Critical Files

Document files that are risky, central, or often misunderstood.

| File | Why it matters | Rules |
| --- | --- | --- |
| `[path/to/auth]` | Auth/session behavior | Do not change without auth verification. |
| `[path/to/billing]` | Money/subscription logic | Verify provider behavior before changing. |
| `[path/to/db/schema]` | Database shape | Keep code and live schema aligned. |
| `[path/to/realtime]` | Live updates | Avoid broad refactors. |
| `[path/to/deploy/config]` | Production deploy | Verify target before changing. |

## Add Project-Specific Notes

- `[critical file]`: `[risk and rule]`
- `[critical file]`: `[risk and rule]`

