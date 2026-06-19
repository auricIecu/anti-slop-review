# anti-slop-marketplace

Marketplace de Claude Code que distribuye **anti-slop-review**, un skill para auditar el
"AI slop" (estética y copy genéricos de IA) en interfaces web recién construidas y proponer
arreglos con tu aprobación.

## Instalación

En Claude Code:

```
/plugin marketplace add auricIecu/anti-slop-review
/plugin install anti-slop-review@anti-slop-marketplace
```

(`/plugin marketplace add` también acepta una URL `https://...git` o una ruta local.)

Luego, en cualquier proyecto:

```
/anti-slop-review
```

## Contenido

| Plugin | Descripción |
|--------|-------------|
| [`anti-slop-review`](plugins/anti-slop-review/) | Auditoría post-desarrollo de AI slop: ~33 patrones en 7 categorías, slop score por niveles, fixes propuestos con tu OK. |

## Estructura del repo

```
.
├── .claude-plugin/
│   └── marketplace.json          # catálogo del marketplace
└── plugins/
    └── anti-slop-review/
        ├── .claude-plugin/
        │   └── plugin.json        # manifiesto del plugin
        ├── README.md
        └── skills/
            └── anti-slop-review/
                ├── SKILL.md
                ├── references/catalogo-slop.md
                └── fixtures/
```

## Distribuir solo el skill

Si un market acepta skills sueltos (no plugins), publica únicamente la carpeta
`plugins/anti-slop-review/skills/anti-slop-review/` (contiene `SKILL.md` + `references/` +
`fixtures/`), que es autocontenida.

## Licencia

MIT — ver [LICENSE](LICENSE).
