# anti-slop-review

Skill multi-agente para **auditar interfaces web recién construidas en busca de "AI slop"**
—la estética y el copy genéricos que la IA produce por defecto— y proponer arreglos que solo
se aplican con tu aprobación.

Funciona en **Claude Code**, **Codex** y cualquier agente compatible con el estándar
[`SKILL.md` de agentskills.io](https://agentskills.io). El skill es una **fuente única** en
[`skills/anti-slop-review/`](skills/anti-slop-review/); los manifiestos por harness
(`.claude-plugin/`, `.codex-plugin/`) apuntan a esa misma carpeta.

## Qué hace

1. Se orienta sobre qué se construyó y cómo levantar la app.
2. Renderiza y captura (desktop + móvil) o cae a modo solo-código avisándolo.
3. Audita contra un catálogo de **~33 patrones en 7 categorías** (tipografía, color/contraste,
   layout, accesibilidad, efectos, animación, copy).
4. Reporta hallazgos por categoría y severidad, con evidencia (`archivo:línea`) y un **slop
   score**: Limpio (0-1) / Leve (2-3) / Pesado (4+).
5. Propone fixes por lotes y **solo aplica los que apruebas**.

**Principio rector:** una elección intencional del brief (dark mode pedido, morado de marca)
**no es slop**. El skill marca, no fuerza.

---

## Instalación

### Claude Code (plugin + marketplace)

```
/plugin marketplace add auricIecu/anti-slop-review
/plugin install anti-slop-review@anti-slop-marketplace
```

### Codex

**Opción A — `npx skills` (recomendada, cross-agente):**

```
npx skills add auricIecu/anti-slop-review
```

Instala en el directorio de skills de Codex (`~/.agents/skills/`, user-level; verificado). El
skill vive en `skills/anti-slop-review/`, la ruta estándar que `npx skills` descubre. También
puedes apuntar al subdirectorio:
`npx skills add https://github.com/auricIecu/anti-slop-review/tree/main/skills/anti-slop-review`.

**Opción B — script de instalación (sin Node):**

```bash
git clone https://github.com/auricIecu/anti-slop-review
cd anti-slop-review
./install.sh            # Linux/macOS  → ~/.codex/skills + ~/.agents/skills
```

```powershell
./install.ps1           # Windows
```

**Opción C — copia manual:** copia la carpeta `skills/anti-slop-review/` a
`~/.agents/skills/` (o `~/.codex/skills/`) para uso global, o a `.agents/skills/` dentro de
un proyecto.

Tras instalar, abre una **sesión nueva** y pide: *"revisa el AI slop"*.

### Otros agentes (Cursor, OpenCode, etc.)

```
npx skills add auricIecu/anti-slop-review
```

`npx skills` detecta el agente instalado y copia el skill a su ubicación.

---

## Uso

```
/anti-slop-review        # Claude Code
```

o en lenguaje natural en cualquier agente: *"revisa el slop"*, *"limpia la interfaz"*,
*"does this look AI-generated"*.

## Estructura del repo

```
.
├── .claude-plugin/
│   ├── marketplace.json       # marketplace de Claude Code (plugin source ".")
│   └── plugin.json            # manifiesto del plugin de Claude Code
├── .codex-plugin/
│   └── plugin.json            # manifiesto para Codex (App marketplace / metadata)
├── skills/
│   └── anti-slop-review/      # ← fuente única del skill
│       ├── SKILL.md
│       ├── references/catalogo-slop.md
│       └── fixtures/
├── install.sh / install.ps1   # instalación en Codex sin Node
├── AGENTS.md
├── README.md
└── LICENSE
```

## Catálogo (7 categorías)

Tipografía · Color/Contraste · Layout · Accesibilidad · Efectos · Animación · Copy.
Cada patrón documenta *tell* de código, *tell* visual, por qué es slop, fix, y la excepción
legítima. Ver [`catalogo-slop.md`](skills/anti-slop-review/references/catalogo-slop.md).

## Integraciones opcionales

`axe-core/Playwright` (contraste + a11y), `stylelint-plugin-defensive-css`,
`stylelint-plugin-carbon-tokens`, y `Slop Score` (eqbench.com/slop-score.html, copy en inglés).

## Licencia

MIT — ver [LICENSE](LICENSE).
