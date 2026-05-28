---
name: encoding-utf8
description: Use before creating or editing files that contain accents, non-English text, currency symbols, dollar signs, smart quotes, copied text, Markdown docs, JSON/YAML config, PowerShell scripts, SQL, translations, or templates. Prevents broken characters by preserving UTF-8 encoding and avoiding shell interpolation mistakes.
---

# UTF-8 And Character Safety

## Goal

Prevent broken characters, corrupted accents, bad symbols, and accidental `$` interpolation.

Use this skill when editing:

- docs and README files;
- translations and user-facing text;
- emails and templates;
- PowerShell scripts;
- JSON, YAML, SQL and Markdown;
- files with accents, currency symbols, apostrophes, quotes, or dollar signs.

## Rules

- Preserve the existing file encoding when editing.
- Prefer UTF-8 for new text files.
- Prefer ASCII when accents are not needed.
- For French or multilingual text, use UTF-8.
- Do not paste text from Word, Gmail, Google Docs or web pages without checking characters.
- Watch for mojibake such as broken accents, replacement symbols, or strange quote/dash characters.
- Be careful with `$` in PowerShell, shell scripts, template literals, Markdown examples and regex.
- Do not let PowerShell expand `$variable` inside text that should stay literal.
- Do not change line endings unless the file or project requires it.

## Safe Editing

- Use `apply_patch` for manual edits when available.
- Avoid shell write tricks for files with accents, `$`, quotes, or backticks.
- If a script must write a file in PowerShell, specify UTF-8 explicitly.
- For literal PowerShell text, use single-quoted strings or single-quoted here-strings.

Example:

```powershell
$text = @'
This keeps $VARIABLE literal.
French text must stay UTF-8.
'@
[System.IO.File]::WriteAllText($path, $text, [System.Text.UTF8Encoding]::new($false))
```

## Before Finishing

For files likely to contain encoding problems, run a targeted scan.
This command avoids placing broken characters directly in the instruction file:

```powershell
$badChars = @([char]0xFFFD, [char]0x00C3, [char]0x00C2, [char]0x00E2)
Get-ChildItem -Recurse -File path/to/files | Select-String -Pattern $badChars
```

If the scan finds unexpected characters:

1. stop;
2. inspect the original file;
3. fix the encoding issue directly;
4. re-run the scan.

## Dollar Sign Safety

Before editing files that contain `$`:

- check whether `$` is code syntax, shell syntax, regex, currency, or literal documentation;
- avoid double-quoted PowerShell strings when the text must keep `$`;
- verify that examples like `${name}`, `$PATH`, `$1`, `$2`, `$$`, and currency amounts stay unchanged.
