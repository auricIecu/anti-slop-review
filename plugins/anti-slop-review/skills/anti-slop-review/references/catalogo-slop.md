# Catálogo de AI slop — referencia de auditoría

Cada patrón: cómo detectarlo en código, cómo se ve, por qué es slop, cómo arreglarlo,
y cuándo NO es slop (excepción legítima). La severidad por defecto es un punto de
partida; el contexto del brief puede subirla o bajarla.

**Regla de oro:** una elección intencional del brief (dark mode pedido, morado de marca,
secuencia real numerada) NO es slop. Marca, no fuerces.

## Tipografía

### [TIPO-01] Inter / system font para todo
Severidad: media
Tell (código): `font-family: Inter` (o `system-ui`/`-apple-system`) como única familia.
Tell (visual): todo el texto con el mismo sans neutro sin fuente de display.
Por qué es slop: es el default estadístico de la IA; no aporta personalidad.
Fix: elegir un par display+body deliberado (ej. una display con carácter + body legible).
Excepción: apps internas/utilitarias donde la neutralidad es un requisito.

### [TIPO-02] Headline centrado en sans genérica
Severidad: baja
Tell (código): `.hero h1 { text-align:center }` con la misma sans del body.
Tell (visual): título grande centrado sin tratamiento tipográfico.
Por qué es slop: composición por defecto del hero generado por IA.
Fix: considerar alineación deliberada (izquierda/asimétrica) y una display distinta.
Excepción: marcas que usan centrado simétrico como lenguaje propio.

### [TIPO-03] Palabra suelta en serif itálica como "acento"
Severidad: media
Tell (código): `h1 em { font-family: <serif>; font-style: italic }` dentro de un H1 sans.
Tell (visual): una sola palabra en cursiva serif en medio de un titular sans.
Por qué es slop: cliché tipográfico de IA muy reconocible.
Fix: comprometerse con un sistema (serif o sans) en vez del acento decorativo.
Excepción: si el contraste serif/sans es parte deliberada del sistema tipográfico.

### [TIPO-04] Pares de fuentes delatores repetidos
Severidad: baja
Tell (código): combos como Space Grotesk + Instrument Serif, o Geist por defecto.
Tell (visual): la misma "vibra" tipográfica vista en mil landings de IA.
Por qué es slop: pares que la IA reutiliza sin relación con el subject.
Fix: derivar la tipografía del mundo del producto, no del default de moda.
Excepción: ninguna si fue elegido sin justificación; válido si encaja con la marca.

## Color / Contraste

### [COLOR-01] "VibeCode purple" / lavanda-morado por defecto
Severidad: media
Tell (código): morados tipo `#7c3aed`, `#8b5cf6`, lavanda como color principal sin razón.
Tell (visual): UI dominada por morado/lavanda.
Por qué es slop: color por defecto de generadores de IA.
Fix: paleta derivada del subject (tierra, alto contraste, etc.), no el morado default.
Excepción: morado es el color de marca real.

### [COLOR-02] Gradientes morado-cian por todas partes
Severidad: media
Tell (código): múltiples `linear-gradient(...)` con morado→cian/azul en fondos, botones, texto.
Tell (visual): degradados de neón repetidos en toda la página.
Por qué es slop: firma visual de IA; satura sin jerarquía.
Fix: máximo un gradiente principal; el resto, colores sólidos.
Excepción: un único gradiente intencional como acento de marca.

### [COLOR-03] Dark mode permanente por defecto
Severidad: baja
Tell (código): fondo casi negro fijo sin toggle ni media query de preferencia.
Tell (visual): tema oscuro como única opción sin justificación.
Por qué es slop: estética por defecto, no decisión.
Fix: ofrecer modo claro o justificar el oscuro por el subject.
Excepción: el brief pidió dark mode, o el contexto (cine, código, foto) lo exige.

### [COLOR-04] Texto de bajo contraste (falla WCAG AA)
Severidad: ALTA
Tell (código): texto gris medio (`#888`, `#999`) sobre fondo oscuro o claro similar.
Tell (visual): cuerpo de texto difícil de leer.
Por qué es slop: la IA prioriza estética sobre legibilidad; además es un fallo de accesibilidad.
Fix: subir contraste a ≥4.5:1 (texto normal) / ≥3:1 (grande). Validar con un checker.
Excepción: ninguna — el contraste mínimo no se negocia.

## Layout

### [LAYOUT-01] Badge/píldora flotando encima del H1
Severidad: media
Tell (código): `.badge`/`.pill` como primer hijo del hero, encima del `h1`.
Tell (visual): etiqueta pequeña ("NUEVO", "v2.0") flotando sobre el titular.
Por qué es slop: patrón de hero por defecto de IA.
Fix: integrar la info en el titular o eliminarla.
Excepción: si comunica algo necesario (estado beta real, versión relevante).

### [LAYOUT-02] Borde izquierdo de color en cards
Severidad: ALTA
Tell (código): `border-left: 3-4px solid <color/gradiente>` en `.card`.
Tell (visual): franja vertical de color al borde izquierdo de las tarjetas.
Por qué es slop: firma casi tan delatora como el em-dash; decora sin codificar info.
Fix: quitar el borde; reforzar jerarquía con peso del título o espaciado.
Excepción: si el color codifica un estado real (tipo de alerta, categoría).

### [LAYOUT-03] Cards idénticas con icono-arriba en grid
Severidad: baja
Tell (código): grid de N `.card` iguales, cada una con `.icon` centrado sobre el texto.
Tell (visual): 3-4 tarjetas clónicas icono→título→texto.
Por qué es slop: composición de "features" por defecto.
Fix: variar layout (icono a la izquierda, texto-solo, tamaños distintos) o reducir.
Excepción: una grilla uniforme intencional con una primitiva repetida a propósito.

### [LAYOUT-04] Secuencia numerada 01/02/03 forzada
Severidad: baja
Tell (código): markers `01`,`02`,`03` o lista numerada en secciones que no son secuencia.
Tell (visual): números grandes decorando bloques sin orden real.
Por qué es slop: numeración que no codifica información.
Fix: quitar la numeración salvo que el contenido SEA una secuencia (proceso, timeline).
Excepción: proceso o cronología real donde el orden importa.

### [LAYOUT-05] Fila de "stats" decorativa
Severidad: baja
Tell (código): fila de números grandes con etiqueta pequeña (`99% ·  10k+ · 24/7`).
Tell (visual): banner de métricas sin fuente ni contexto.
Por qué es slop: relleno de credibilidad por defecto.
Fix: máximo una fila de stats con cifras reales; si no hay datos, eliminar.
Excepción: métricas reales y verificables que aportan.

### [LAYOUT-06] Emojis como iconos de navegación/UI
Severidad: media
Tell (código): `content:"🏠"` o emojis en nav/botones en vez de iconos SVG.
Tell (visual): emojis del sistema como iconografía.
Por qué es slop: tratamiento poco serio por defecto.
Fix: usar un set de iconos SVG coherente.
Excepción: producto cuyo tono justifica emojis como lenguaje.

### [LAYOUT-07] Headings/labels en MAYÚSCULAS por defecto
Severidad: baja
Tell (código): `text-transform:uppercase` en headings o labels de sección.
Tell (visual): títulos/etiquetas en mayúsculas sostenidas.
Por qué es slop: recurso por defecto para "verse premium".
Fix: sentence/title case; reservar mayúsculas para énfasis puntual.
Excepción: sistema tipográfico donde las mayúsculas son intencionales y legibles.

### [LAYOUT-08] Spacing fuera de escala o monótono
Severidad: media
Tell (código): márgenes/paddings/gaps sin escala coherente (8px, 13px, 17px, 22px…) o, lo opuesto, el mismo valor para todo sin jerarquía.
Tell (visual): ritmo vertical irregular, o uniformidad plana sin agrupación visible.
Por qué es slop: la IA pone números "a ojo"; falta un sistema de espaciado (escala de 4/8px).
Fix: tokenizar el espaciado en una escala (4/8/12/16/24/32…) y aplicarla por jerarquía.
Excepción: desviaciones puntuales justificadas por ajuste óptico.

### [LAYOUT-09] Ancho de línea excesivo (>~75ch)
Severidad: baja
Tell (código): bloques de prosa sin `max-width`/measure (~60-75ch).
Tell (visual): párrafos que cruzan todo el ancho de pantalla en desktop.
Por qué es slop: default sin pensar en legibilidad.
Fix: limitar el cuerpo a ~60-75ch (ej. `max-width: 65ch`).
Excepción: tablas, código u otro contenido no prosaico.

### [LAYOUT-10] Cards anidadas
Severidad: baja
Tell (código): `.card` dentro de `.card` (contenedor con borde/sombra dentro de otro).
Tell (visual): cajas dentro de cajas con bordes/sombras redundantes.
Por qué es slop: relleno estructural sin jerarquía real.
Fix: aplanar a un solo nivel; jerarquía por espaciado y tipografía.
Excepción: anidación que comunica relación real (card con sub-items accionables).

### [LAYOUT-11] Recetas de sombra inconsistentes
Severidad: media
Tell (código): muchos `box-shadow` distintos; más de 3 recetas de sombra en superficies core.
Tell (visual): cada componente con una profundidad distinta; jerarquía de elevación rota.
Por qué es slop: sombras decorativas sin sistema de elevación.
Fix: definir ≤3 niveles de elevación tokenizados y reutilizarlos.
Excepción: sistema de elevación intencional con niveles bien definidos.

### [LAYOUT-12] Texto diminuto o line-height apretado
Severidad: media
Tell (código): `font-size` <14px en body; `line-height` <1.4 en párrafos.
Tell (visual): cuerpo de texto pequeño y/o líneas apelmazadas.
Por qué es slop: prioriza estética sobre legibilidad.
Fix: body ≥16px y `line-height` ~1.5-1.6 en prosa.
Excepción: captions/metadatos donde el tamaño menor es intencional pero legible.

## Efectos

### [FX-01] Glows y box-shadows de color
Severidad: media
Tell (código): `box-shadow: 0 0 Npx rgba(<color>,...)` con blur grande de color.
Tell (visual): resplandores de colores alrededor de cards/botones. Variante clásica: el combo glow morado+azul (estética de demo genérica).
Por qué es slop: efecto por defecto que aporta ruido.
Fix: sombras sutiles y neutras; eliminar glows de color.
Excepción: estética neón intencional y coherente con el subject.

### [FX-02] Glassmorphism por defecto
Severidad: media
Tell (código): `backdrop-filter: blur(...)` + fondo semitransparente en cards.
Tell (visual): tarjetas de "cristal esmerilado".
Por qué es slop: default de 2022 reutilizado por IA sin razón.
Fix: fondos sólidos o tratamientos derivados del brief.
Excepción: cuando el efecto cristal sirve al concepto visual elegido.

### [FX-03] Defaults de shadcn/ui sin tokenizar
Severidad: baja
Tell (código): border-radius, sombras y spacing idénticos a los defaults de la librería.
Tell (visual): la UI "se ve como shadcn de fábrica".
Por qué es slop: ausencia de decisiones; identidad de librería, no del producto.
Fix: tokenizar color, radius, sombra y spacing con valores propios.
Excepción: prototipo desechable donde la velocidad prima sobre la identidad.

## Animación

### [ANIM-01] Movimiento sin sentido
Severidad: media
Tell (código): `animation: bounce/wiggle/float ... infinite`, texto con gradiente animado.
Tell (visual): botones que rebotan, iconos que se menean, badges flotando.
Por qué es slop: movimiento que no comunica nada y distrae.
Fix: reservar animación para reforzar una acción o jerarquía; respetar `prefers-reduced-motion`.
Excepción: una animación orquestada y deliberada que sirve al subject.

## Accesibilidad

### [A11Y-01] Niveles de heading saltados
Severidad: media
Tell (código): salto de `<h1>` a `<h3>` sin `<h2>`, o headings elegidos por tamaño y no por estructura.
Tell (visual): no visible; se detecta en el DOM o con lector de pantalla.
Por qué es slop: la IA elige headings por estética; rompe la navegación por encabezados.
Fix: jerarquía secuencial (h1→h2→h3) y estilar con CSS, sin saltar niveles.
Excepción: ninguna; el orden de headings es estructura, no estilo.

### [A11Y-02] Estado indicado solo por color
Severidad: ALTA
Tell (código): estados (éxito/error/activo) diferenciados únicamente por color, sin icono ni texto.
Tell (visual): badges/puntos que solo cambian de color.
Por qué es slop: falla para daltónicos y lectores de pantalla (WCAG 1.4.1).
Fix: añadir icono, texto o patrón además del color.
Excepción: ninguna cuando el color porta información.

### [A11Y-03] Sin foco visible / navegación por teclado
Severidad: ALTA
Tell (código): `outline:none` sin reemplazo, ausencia de `:focus-visible`, o `div` clicable sin rol/tabindex.
Tell (visual): al tabular no se ve dónde está el foco.
Por qué es slop: la IA quita el outline "feo" sin reemplazarlo.
Fix: estilo claro de `:focus-visible`; usar elementos nativos enfocables.
Excepción: ninguna; el foco visible es obligatorio.

### [A11Y-04] Placeholder en vez de label
Severidad: media
Tell (código): inputs con `placeholder` y sin `<label>`/`aria-label` asociado.
Tell (visual): formularios cuyo "rótulo" desaparece al escribir.
Por qué es slop: patrón por defecto que rompe accesibilidad y usabilidad.
Fix: `<label>` asociado por `for`/`id` (o `aria-label`); el placeholder es ejemplo, no etiqueta.
Excepción: campo de búsqueda único con label visualmente oculto pero presente en el DOM.

## Copy / Texto

### [COPY-01] Em-dashes en exceso
Severidad: baja
Tell (texto): uso frecuente de "—" como muletilla.
Por qué es slop: tell clásico de texto generado por IA.
Fix: variar puntuación; usar el em-dash con moderación.
Excepción: estilo editorial humano que ya usaba em-dashes.

### [COPY-02] Fórmula "no es solo X, es Y" / paralelismo negativo
Severidad: media
Tell (texto): "no es solo una herramienta, es tu superpoder"; "not just X, but Y".
Por qué es slop: estructura formulaica sobre-representada en output de IA.
Fix: reescribir con una afirmación concreta y específica.
Excepción: uso puntual y justificado, no como patrón repetido.

### [COPY-03] Clichés de marketing
Severidad: media
Tell (texto): "desbloquea tu potencial", "en el mundo acelerado de hoy", "game-changer", "sin límites".
Por qué es slop: relleno genérico que no dice nada del producto.
Fix: copy específico que nombre el beneficio real en términos del usuario.
Excepción: ninguna; siempre hay una versión más concreta.

### [COPY-04] Ritmo uniforme / baja variedad léxica
Severidad: baja
Tell (texto): frases de longitud y estructura muy similares, vocabulario repetido.
Por qué es slop: prosa "plana" típica de IA.
Fix: variar longitud de frase y vocabulario; leer en voz alta.
Excepción: copy deliberadamente minimalista y uniforme.

### [COPY-05] Vocabulario "slop" sobre-representado
Severidad: baja
Tell (texto): palabras y trigramas que la IA sobreusa ("delve", "leverage", "elevate", "seamless", "robust", "unlock", "potenciar", "impulsa", "lo que realmente importa"); ver la métrica "Slop Score" (slop-words 60% + "no-X-sino-Y" 25% + trigramas 15%), derivada comparando texto de IA contra corpus humano.
Por qué es slop: vocabulario estadísticamente más frecuente en texto de IA que en humano; suena a relleno.
Fix: reemplazar por términos concretos del producto; leer en voz alta para cazar la muletilla.
Excepción: término técnico correcto sin alternativa natural.