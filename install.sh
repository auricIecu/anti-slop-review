#!/usr/bin/env bash
#
# install.sh — instala el skill anti-slop-review en Codex (y opcionalmente Claude Code).
# Copia skills/anti-slop-review/ a los directorios de skills del agente.
#
# Uso:
#   ./install.sh            # instala en Codex (~/.codex/skills) y ~/.agents/skills
#   ./install.sh --claude   # además, en Claude Code (~/.claude/skills)
#
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)/skills/anti-slop-review"
[ -f "$SRC/SKILL.md" ] || { echo "ERROR: no encuentro $SRC/SKILL.md"; exit 1; }

install_to() {
  local dest="$1/anti-slop-review"
  mkdir -p "$1"
  rm -rf "$dest"
  cp -R "$SRC" "$dest"
  echo "  ✓ $dest"
}

echo "Instalando anti-slop-review…"
install_to "$HOME/.codex/skills"     # Codex CLI (global)
install_to "$HOME/.agents/skills"    # Codex / agentes spec-compliant (global)

if [ "${1:-}" = "--claude" ]; then
  install_to "$HOME/.claude/skills"  # Claude Code (skill personal)
fi

echo "Listo. Abre una sesión nueva en tu agente y pide: \"revisa el AI slop\"."
