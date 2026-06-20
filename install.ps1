<#
  install.ps1 — instala el skill anti-slop-review en Codex (y opcionalmente Claude Code) en Windows.
  Copia skills\anti-slop-review\ a los directorios de skills del agente.

  Uso:
    ./install.ps1            # instala en Codex (~/.codex/skills) y ~/.agents/skills
    ./install.ps1 -Claude    # además, en Claude Code (~/.claude/skills)
#>
param([switch]$Claude)

$ErrorActionPreference = "Stop"
$src = Join-Path $PSScriptRoot "skills\anti-slop-review"
if (-not (Test-Path (Join-Path $src "SKILL.md"))) { throw "No encuentro $src\SKILL.md" }

function Install-To($base) {
  $dest = Join-Path $base "anti-slop-review"
  New-Item -ItemType Directory -Force -Path $base | Out-Null
  if (Test-Path $dest) { Remove-Item -Recurse -Force $dest }
  Copy-Item -Recurse -Force $src $dest
  Write-Host "  OK $dest"
}

Write-Host "Instalando anti-slop-review..."
Install-To (Join-Path $HOME ".codex\skills")    # Codex CLI (global)
Install-To (Join-Path $HOME ".agents\skills")   # Codex / agentes spec-compliant (global)
if ($Claude) { Install-To (Join-Path $HOME ".claude\skills") }  # Claude Code

Write-Host "Listo. Abre una sesion nueva en tu agente y pide: 'revisa el AI slop'."
