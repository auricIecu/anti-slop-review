# AGENTS.md

Este repositorio distribuye el **skill `anti-slop-review`** (formato `SKILL.md`,
cross-compatible con Claude Code, Codex, Cursor y otros agentes spec-compliant de
agentskills.io).

- **Skill (fuente única):** [`skills/anti-slop-review/`](skills/anti-slop-review/)
- **Manifiesto Claude Code:** [`.claude-plugin/`](.claude-plugin/) (plugin + marketplace)
- **Manifiesto Codex:** [`.codex-plugin/plugin.json`](.codex-plugin/plugin.json)

## Qué hace el skill

Audita una interfaz web recién construida en busca de "AI slop" (estética y copy genéricos
de IA), reporta hallazgos priorizados con evidencia y un slop score por niveles, y propone
fixes que solo aplica con la aprobación del usuario. Se invoca cuando el usuario pide
*"revisa el slop"*, *"limpia la interfaz"* o *"does this look AI-generated"*.

Ver [`skills/anti-slop-review/SKILL.md`](skills/anti-slop-review/SKILL.md) para el flujo
completo y [`skills/anti-slop-review/references/catalogo-slop.md`](skills/anti-slop-review/references/catalogo-slop.md)
para el catálogo de patrones.

## Instalación

Ver [README.md](README.md) — soporta Claude Code (plugin/marketplace), Codex
(`npx skills`, copia manual o `install.sh`/`install.ps1`) y cualquier agente compatible.
