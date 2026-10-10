# CLAUDE.md

Pracovní prostor pro Claude Cowork a další AI agenty. Cesty ber relativně k rootu workspace.

## Než začneš pracovat - povinná četba

1. `O-MNE/agent-protocol.md` - závazná pravidla (mantras, postoj poradce, konvence).
2. `O-MNE/about-me.md` - kdo jsem, jak pracuju.
3. `O-MNE/anti-ai-writing-style.md` - jak NEpsat.
4. `O-MNE/my-goals.md` - kvartální cíle.

## Nástroje / konektory

Návody k připojeným nástrojům žijí v `O-MNE/tools/`. Před prací s nástrojem si playbook přečti.

## Mapa složek (`MAPA.md`)

Než něco uložíš nebo založíš složku, najdi místo v `MAPA.md`. Když ho nenajdeš, zeptej se - nevymýšlej novou složku. Když složku založíš, přejmenuješ nebo zrušíš, uprav mapu ve stejném kroku (k čemu, co sem patří, co ne, citlivost). Když hlídač při startu okna hlásí složky chybějící v mapě, řekni to uživateli jednou větou a doplň je, až budeš ukládat.

## Konvence ukládání (dvoukýblový model)

Root projektu = **jen** `README.md` + `PROJECT-INSTRUCTIONS.md`. Vše ostatní do složek:

- **Výstupy ven (co konzumuju já)** → `projects/<projekt>/outputs/`, klientské `projects/<projekt>/clients/<slug>/outputs/`. Uvnitř `outputs/`: `_navrhy/` (rozpracované), `_interni/` (neveřejné) a hotové podle typu (`postupy/`, `nabidky/` ...). Do kořene `outputs/` nic.
- **Klient pohromadě** → `projects/<projekt>/clients/<slug>/` (`card.md`, `working/`, `outputs/`).
- **Vše agentní** → `projects/<projekt>/workshop/`: `knowledge/`, `templates/<kategorie>/`, `build/`, `internal/`, `handoffs/(active, archive)/`.
- **Jednorázové dumpy** → `archiv/`.
- **Dočasné soubory** → prefix `_tmp_` nebo `_tmp/`; po 7 dnech do `archiv/_tmp/`.
- **Globální šablony** → `SABLONY/`.

**Naming**: složky lowercase, pomlčky, bez mezer a diakritiky.
**Povinné minimum projektu**: `README.md`, `PROJECT-INSTRUCTIONS.md`, `workshop/handoffs/(active, archive)/`.
**Mapa + invarianty**: `STRUKTURA.md`.

## Komunikace

- Když nerozumíš zadání, ZEPTEJ SE. Žádné „aspoň něco" výstupy.
- Preciznost > rychlost.
- Zákaz AI slop frází (viz `anti-ai-writing-style.md`).
