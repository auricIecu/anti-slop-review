---
name: anti-slop-review
description: Use when a web page or UI has just been built or generated and you want to clean it up before calling it done — reviewing it for "AI slop", the generic templated AI look and AI-sounding copy. Covers typography, color, contrast, layout, effects, animation, shadcn defaults, and copy tells. Triggers — "revisa el slop", "limpia la interfaz", "anti-slop", "does this look AI-generated".
---

# Anti-Slop Review

## Overview

Auditas una interfaz recién construida para detectar **AI slop**: los patrones genéricos
y templados que la IA produce por defecto (mismo look para cualquier producto) y el copy
que "suena a IA". Presentas hallazgos priorizados con evidencia y **propones arreglos que
solo aplicas con el OK del usuario**. No reescribes la identidad visual; señalas slop y
corriges puntualmente.

Complementa a `frontend-design` (lado construir). Este skill es el lado limpiar/auditar.

## Principio rector

**Una elección intencional NO es slop.** Si el brief pidió dark mode, o el morado es color
de marca, o una secuencia numerada refleja un proceso real, se marca como observación pero
no se fuerza el cambio. Distingue *default sin pensar* de *patrón usado con intención*.
Cada hallazgo necesita evidencia concreta (archivo:línea o región de captura); nunca "esto
parece IA" sin señalar qué y dónde.

## Flujo de trabajo

1. **Orientarse.** Identifica qué se construyó: archivos de UI tocados recientemente,
   framework, y cómo se levanta la app. Si no puedes inferir el comando para levantarla,
   pregúntalo.
2. **Renderizar y capturar.** Levanta la app, abre las vistas clave y toma capturas en
   desktop y móvil. Si no es posible, continúa en modo solo-código y avísalo explícitamente
   (perderás tells visuales: contraste real, glassmorphism, glows, animación).
3. **Auditar contra el catálogo.** Lee `references/catalogo-slop.md` y recórrelo entero.
   Por cada patrón, busca su *tell* en el código y/o la captura. Registra hallazgos con
   evidencia y severidad (alta/media/baja), aplicando el principio rector para descartar
   falsos positivos.
4. **Reportar.** Presenta los hallazgos agrupados por categoría (Tipografía, Color/Contraste,
   Layout, Accesibilidad, Efectos, Animación, Copy), ordenados por severidad, con el nivel
   y veredicto corto (ver "Puntuación"). NO toques código en este paso.
5. **Proponer y aplicar con OK.** Propón los arreglos por lotes (empezando por severidad
   alta). El usuario aprueba cuáles aplicar; aplica solo los aprobados. Tras aplicar,
   re-captura para mostrar el antes/después de lo que tocaste.

## Formato de hallazgo

```
[ALTA] LAYOUT-02 · Borde izquierdo de color en cards
  Evidencia: src/components/Card.css:12  (border-left: 4px solid #7c3aed)
            también visible en home-desktop.png (3 tarjetas)
  Fix propuesto: eliminar border-left; reforzar jerarquía con peso del título
  ¿Aplicar? [s/n]
```

## Puntuación (slop score)

Tras auditar, calcula un nivel objetivo contando los hallazgos de severidad **media/alta**
(los bajos se listan pero no cuentan para el bucket):

- **Limpio** — 0-1 hallazgos
- **Leve** — 2-3 hallazgos
- **Pesado** — 4 o más

Inclúyelo en el veredicto (ej. "Pesado: 6 medio/alto, 3 bajos"). Los fallos de accesibilidad
y contraste (severidad ALTA) pesan siempre: si hay ≥1, señálalo aparte aunque el bucket sea
bajo. El nivel orienta la prioridad; no sustituye el juicio de intención del principio rector.

## Antes de declararlo limpio

- ¿Cada hallazgo tiene evidencia concreta (no "parece IA")?
- ¿Descartaste como falso positivo lo que fue elección intencional del brief?
- ¿Respetaste el piso de calidad existente (contraste correcto, focus visible,
  reduced-motion)? No lo reportes como slop si ya está bien.
- ¿Aplicaste SOLO los fixes aprobados por el usuario?

## Integración con linters (opcional)

Para lo determinista, apóyate en herramientas y reserva tu juicio para lo que requiere
criterio (slop vs intención). Si el proyecto las tiene o el usuario lo aprueba:

- **axe-core (vía Playwright)** — contraste WCAG, foco, roles y labels reales. Cubre COLOR-04
  y la categoría Accesibilidad (A11Y-01..04) con medición, no inferencia.
- **stylelint-plugin-defensive-css** — exige `prefers-reduced-motion` y `:focus-visible`
  (ANIM-01, A11Y-03).
- **stylelint-plugin-carbon-tokens** — detecta valores "mágicos" hardcodeados (hex, px, ms)
  → FX-03 (shadcn sin tokenizar) y LAYOUT-08/11 (spacing y sombras sin sistema).

Corre estas primero si están disponibles, incorpora sus hallazgos al reporte, y dedica la
auditoría manual a los patrones de criterio (tipografía genérica, copy, intención del brief).

## Score de copy (opcional, inglés)

Para copy en **inglés**, puedes medir el slop textual de forma objetiva con la herramienta
Slop Score (de sam-paech): pega el texto en `https://eqbench.com/slop-score.html` (se computa
100% en el navegador, no sube nada; o autohospédala clonando el repo y `python -m http.server`).
Devuelve un score ponderado: **slop-words 60% + "not-X-but-Y" 25% + trigramas 15%**. Usa ese
número como evidencia objetiva para los hallazgos COPY-02 y COPY-05.

- **Limitación:** las listas son de corpus en **inglés**; no es fiable para copy en español
  (para español, aplica el juicio de COPY-01..05 del catálogo).
- Las listas salen del toolkit `slop-forensics`, que extrae los n-gramas sobre-representados
  en salidas de LLM frente a texto humano — útil si algún día quieres generar listas propias
  (p. ej. en español).

## Modo exhaustivo (opcional)

Para revisiones grandes, puedes despachar subagentes en paralelo por categoría
(Tipografía, Color/Contraste, Layout, Copy) que auditen por separado y luego sintetizar.
No es el comportamiento por defecto; úsalo solo si el usuario lo pide o la superficie es muy
grande.