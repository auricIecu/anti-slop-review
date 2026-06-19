# anti-slop-review

Skill de Claude Code para **auditar interfaces web recién construidas en busca de "AI slop"**
—la estética y el copy genéricos que la IA produce por defecto— y proponer arreglos que solo
se aplican con tu aprobación.

Complementa a [`frontend-design`](https://github.com/anthropics/claude-code) (el lado
*construir*). Este es el lado *limpiar / auditar*.

## Qué hace

1. **Se orienta** sobre qué se construyó y cómo levantar la app.
2. **Renderiza y captura** (desktop + móvil) o cae a modo solo-código avisándolo.
3. **Audita** contra un catálogo de ~33 patrones en 7 categorías (ver abajo).
4. **Reporta** hallazgos por categoría y severidad, con evidencia (`archivo:línea`) y un
   **slop score** por niveles: Limpio (0-1) / Leve (2-3) / Pesado (4+).
5. **Propone fixes** por lotes y **solo aplica los que apruebas**.

**Principio rector:** una elección intencional del brief (dark mode pedido, morado de marca,
secuencia real numerada) **no es slop**. El skill marca, no fuerza.

## Categorías del catálogo

| Categoría | Ejemplos de patrones |
|-----------|----------------------|
| Tipografía | Inter para todo, headline centrado genérico, palabra serif itálica de acento |
| Color / Contraste | "VibeCode purple", gradientes morado-cian, dark mode default, bajo contraste WCAG |
| Layout | badge sobre H1, border-left de color en cards, spacing fuera de escala, line-length >75ch, cards anidadas, recetas de sombra inconsistentes |
| Accesibilidad | heading saltado, estado solo-por-color, sin foco visible, placeholder en vez de label |
| Efectos | glows de color, glassmorphism, defaults de shadcn sin tokenizar |
| Animación | movimiento sin sentido |
| Copy | em-dashes, "no es solo X sino Y", clichés, vocabulario "slop" |

Cada patrón documenta: *tell* de código, *tell* visual, por qué es slop, fix, y la
excepción legítima.

## Uso

Cuando termines (o termine un agente) una interfaz:

```
/anti-slop-review
```

o pídelo en lenguaje natural: *"revisa el slop"*, *"limpia la interfaz"*,
*"does this look AI-generated"*.

## Integraciones opcionales

Para lo determinista, el skill puede apoyarse en herramientas externas (si están disponibles):

- **axe-core (vía Playwright)** — contraste WCAG, foco, roles y labels.
- **stylelint-plugin-defensive-css** — `prefers-reduced-motion`, `:focus-visible`.
- **stylelint-plugin-carbon-tokens** — valores "mágicos" hardcodeados (hex/px/ms).
- **Slop Score** (`eqbench.com/slop-score.html`, solo inglés) — score objetivo de copy.

## Fixtures de prueba

`skills/anti-slop-review/fixtures/` contiene dos HTML con slop plantado para verificar la
detección (`sloppy-sample.html`, `sloppy-sample-2.html`).

## Licencia

MIT — ver [LICENSE](../../LICENSE).
