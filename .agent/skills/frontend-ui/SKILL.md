---
name: frontend-ui
description: Use for frontend UI, mobile layout, desktop layout, components, forms, modals, navigation, visible text, accessibility, and browser verification. Protects responsive behavior and project UI patterns.
---

# Frontend UI

## Read First

- `.agent/PROJECT_CONTEXT.md`
- `.agent/CODE_PATTERNS.md`
- relevant component files
- i18n files if visible text changes

## Rules

- Preserve both mobile and desktop unless the user narrows scope.
- Minimum practical mobile touch target: 44x44 px.
- Avoid hardcoded text if the project has i18n.
- Use existing components and design tokens first.
- Do not nest cards inside cards unless the design system already does it.
- Avoid layout shifts caused by hover, loading text, or long labels.
- Keep text inside its container at mobile widths.

## Verification

For layout changes, verify the affected viewport:

- mobile target: 360px width unless project says otherwise;
- desktop target: a common desktop width;
- check text overflow, button wrapping, modal overflow and scroll behavior.

Report if browser verification was not practical.

