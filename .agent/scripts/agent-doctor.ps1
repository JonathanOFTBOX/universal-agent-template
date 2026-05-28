param(
  [switch]$CommitReady,
  [switch]$StagedOnly
)

$ErrorActionPreference = "Stop"

function Write-Ok($Message) {
  Write-Host "[OK] $Message" -ForegroundColor Green
}

function Write-Warn($Message) {
  Write-Host "[WARN] $Message" -ForegroundColor Yellow
}

function Write-Fail($Message) {
  Write-Host "[FAIL] $Message" -ForegroundColor Red
  $script:Failed = $true
}

function Test-File($Path) {
  if (Test-Path -LiteralPath $Path) {
    Write-Ok "Found $Path"
  } else {
    Write-Fail "Missing $Path"
  }
}

function Get-GitRoot {
  try {
    $root = git rev-parse --show-toplevel 2>$null
    if ($LASTEXITCODE -eq 0 -and $root) {
      return $root.Trim()
    }
  } catch {
    return $null
  }
  return $null
}

$script:Failed = $false
$RepoRoot = Get-GitRoot

if (-not $RepoRoot) {
  if ($CommitReady -or $StagedOnly) {
    Write-Fail "Not inside a git repository. Commit checks require git."
  } else {
    Write-Warn "Not inside a git repository. Skipping git status checks."
  }
} else {
  Set-Location $RepoRoot
  Write-Ok "Repo root: $RepoRoot"
}

$RequiredFiles = @(
  "AGENTS.md",
  ".agent/workflows/before-starting.md",
  ".agent/LAST_SESSION_INDEX.md",
  ".agent/LAST_SESSION.md",
  ".agent/KNOWN_GOTCHAS.md",
  ".agent/PROJECT_CONTEXT.md",
  ".agent/COMMANDS.md",
  ".agent/skills/encoding-utf8/SKILL.md",
  ".agent/skills/session-log/SKILL.md",
  ".agent/skills/testing-workflow/SKILL.md",
  ".agent/templates/last-session-entry-template.md"
)

foreach ($file in $RequiredFiles) {
  Test-File $file
}

if (Get-Command rg -ErrorAction SilentlyContinue) {
  $placeholderHits = rg -n "\[[A-Z0-9_]+\]" AGENTS.md CUSTOM_INSTRUCTIONS.md .agent 2>$null
  if ($placeholderHits) {
    Write-Warn "Template placeholders still exist. Replace them before selling/using as a final project config."
    $placeholderHits | Select-Object -First 30 | ForEach-Object { Write-Host "  $_" }
  } else {
    Write-Ok "No obvious placeholders found in core files."
  }
} else {
  Write-Warn "rg not found; skipping placeholder scan."
}

if ($RepoRoot) {
  $status = git status --short
  if ($status) {
    Write-Warn "Git worktree has changes:"
    $status | ForEach-Object { Write-Host "  $_" }
  } else {
    Write-Ok "Git worktree clean."
  }
}

if ($CommitReady) {
  if (-not (Test-Path ".agent/workflows/commit-ready.md")) {
    Write-Fail "Missing .agent/workflows/commit-ready.md"
  }

  if ($StagedOnly) {
    $staged = git diff --cached --name-only
    if (-not $staged) {
      Write-Fail "No staged files. Stage exact task files before using -StagedOnly."
    } else {
      Write-Ok "Staged files:"
      $staged | ForEach-Object { Write-Host "  $_" }
    }
  }

  git diff --check
  if ($LASTEXITCODE -ne 0) {
    Write-Fail "git diff --check failed."
  } else {
    Write-Ok "git diff --check passed."
  }
}

if ($script:Failed) {
  Write-Host ""
  Write-Fail "Agent doctor found issues."
  exit 1
}

Write-Host ""
Write-Ok "Agent doctor passed."
