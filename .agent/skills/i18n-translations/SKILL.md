---
name: i18n-translations
description: Use when adding or editing user-facing text, labels, buttons, errors, empty states, notifications, routes, or modal copy in a project with translations or localization.
---

# i18n Translations

## Rules

- Do not hardcode user-facing text when the project has i18n.
- Add keys to every required language file.
- Keep keys stable and descriptive.
- Preserve existing namespace style.
- Do not translate technical identifiers, env vars, route paths, or code symbols.

## Files

Fill in project files:

- English: `[I18N_EN_PATH]`
- French: `[I18N_FR_PATH]`
- Other: `[I18N_OTHER_PATHS]`

## Verification

Search for the new key and visible text:

```powershell
rg -n "translation.key|Visible text" [I18N_PATHS] [SOURCE_PATHS]
```

