param(
  [Parameter(Mandatory = $true)]
  [string]$TargetRepo,

  [switch]$Force
)

$ErrorActionPreference = "Stop"

$TemplateRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$TargetPath = Resolve-Path -LiteralPath $TargetRepo -ErrorAction Stop

$Items = @(
  "AGENTS.md",
  "GEMINI.md",
  "CUSTOM_INSTRUCTIONS.md",
  "SETUP_GUIDE.md",
  "SELLER_NOTES.md",
  ".agent"
)

foreach ($item in $Items) {
  $source = Join-Path $TemplateRoot $item
  $dest = Join-Path $TargetPath $item

  if (Test-Path -LiteralPath $dest) {
    if (-not $Force) {
      throw "Target already has '$item'. Re-run with -Force to overwrite, or copy manually."
    }
    Remove-Item -LiteralPath $dest -Recurse -Force
  }

  Copy-Item -LiteralPath $source -Destination $dest -Recurse -Force
}

Write-Host "Template installed in $TargetPath" -ForegroundColor Green
Write-Host "Next: replace placeholders with: rg -n ""\[[A-Z0-9_]+\]"" AGENTS.md CUSTOM_INSTRUCTIONS.md .agent"

