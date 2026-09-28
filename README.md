# cowork-tym

Plugin pro **Claude Cowork**, který dělá dvě věci:

- **A. Základní uspořádání Coworku** pro kohokoli - pracovní složka, profil „O-MNE", pravidla pro agenta, styl psaní bez AI frází, globální a projektové instrukce, šablony, handoffy mezi okny.
- **B. Řízení podřízených** (zaměstnanců nebo externistů) přes sdílenou složku - vedoucí definuje pravidla na jednom místě, hooky hlídají, že každé okno člena pracuje podle aktuální verze, člen má průvodce nástupem.

Vše česky. Průvodci vždy říkají, co udělá **člověk** (nastavení aplikace, sdílení disku, účty) a co **agent**.

## Dvě cesty - vyber si

| | Plugin | Bez pluginu |
|---|---|---|
| Co dostaneš | soubor `cowork-tym.plugin` | obyčejné soubory v [`bez-pluginu/`](bez-pluginu/) |
| Nastavení | průvodce tě provede větou („Nastav mi Cowork“) | vyplníš sám nebo požádáš agenta (návod v [`bez-pluginu/README.md`](bez-pluginu/README.md)) |
| Hlídač pravidel (týmy) | instaluje se s pluginem | ruční instalace jedním příkazem |
| Pro koho | kdo chce hotovo | kdo chce vidět a upravit každý řádek, nebo používá jiný nástroj |

Obsah je v obou případech stejný - `bez-pluginu/` se generuje ze zdrojů pluginu.

> **Návod pro uživatele (PDF):** [docs/cowork-tym-navod.pdf](docs/cowork-tym-navod.pdf)

## Instalace

### Z marketplace (doporučeno - aktualizace přijdou samy)

- **Cowork:** v části pro pluginy přidej marketplace `marekstancl/cowork-tym` (nebo `https://github.com/marekstancl/cowork-tym`) a nainstaluj plugin **cowork-tym**. Názvy tlačítek se mezi verzemi liší.
- **Claude Code:** `/plugin marketplace add marekstancl/cowork-tym` a pak `/plugin install cowork-tym@cowork-tym`.

### Ze souboru

1. Stáhni soubor `cowork-tym.plugin` (sekce Releases).
2. Otevři ho dvojklikem, nebo ho v aplikaci Claude nahraj v části pro pluginy (Cowork → Pluginy / Customize - název se může lišit podle verze). Potvrď instalaci.
3. Aplikaci **úplně ukonči** (Mac: Cmd+Q; Windows: i ikonu Claude u hodin → Ukončit) a spusť znovu.
4. **Windows + týmová část:** nainstaluj [Git for Windows](https://git-scm.com) (výchozí volby). Hlídač pravidel je bash skript. [Neověřeno] Pokud se hlídač neozve, příčinou může být, že `bash` není v PATH (Git dává do PATH jen `Git\cmd`) nebo se spustí `bash` z WSL - pak použij ruční instalaci níže v Git Bash.

Pro vývojáře: plugin je obyčejný zip tohoto repozitáře (`zip -r cowork-tym.plugin . -x '.git/*'`).

## Skilly - napiš jednu z vět

| Skill | Kdo | Začni větou |
|---|---|---|
| `zakladni-nastaveni` | kdokoli | „Nastav mi Cowork" |
| `tym-vedouci` | vedoucí týmu | „Chci řídit externisty v Coworku" / „Přidej člena týmu" / „Změnil jsem pravidla" / „Odchod člena" |
| `tym-clen` | člen týmu | „Jsem nový člen týmu, proveď mě nastavením" |

## Jak funguje týmový prostor (B)

```
CLOUDOVÝ DISK (vlastní vedoucí, sdílí s členy)
└── sdílená složka/
    ├── PRAVIDLA-VERZE.txt   1. řádek = verze pravidel (čtou hooky)
    ├── PRAVIDLA.md          jediný zdroj pravidel
    ├── instrukce/           onboarding, projektové instrukce člena
    ├── sablony/  kb/  lide/  vedouci/
    └── clen-<jméno>/        celá práce člena (po odchodu zůstává týmu)
```

- **Project Instructions** člena obsahují jen „na začátku sezení přečti PRAVIDLA.md". Změna pravidel se tak nepřeposílá - další okno ji má.
- **Hooky** (součást pluginu):
  - *SessionStart* - otiskne verzi pravidel sezení a připomene agentovi, co načíst.
  - *PreToolUse* (zápis souborů a zapisující akce konektorů) - když se verze od startu sezení změnila, **jednou** zápis odmítne a vypíše, co se změnilo. Druhý pokus projde.
  - **Fail-open**: když cokoli chybí nebo selže, hook mlčí a nic neblokuje.
  - Soubor s verzí najdou samy (`PRAVIDLA-VERZE.txt` se značkou `COWORK-TYM` ve složce okna, v cloudových discích, na Windows i na písmenech disků). Pevná cesta: ruční instalátor s cestou jako parametrem, nebo proměnná `COWORK_TYM_VERZE_FILE`.
  - Zastaví zápis souborů, příkazy shellu i zapisující akce konektorů. Změnu, kterou udělalo samo okno vedoucího, nezastaví.
- Citlivé věci (smlouvy, ceny, osobní údaje, hesla, konfigurace infrastruktury) zůstávají lokálně u vedoucího.

### Kritické podmínky

- Sdílená složka musí být na disku **offline/zrcadlená**, ne stream - jinak ji Cowork vidí prázdnou.
- Sdílenou složku připoj do Coworku **samostatně** (symlinky nefungují).
- Jeden soubor upravuje v jednu chvíli jeden člověk (jinak vznikají duplikáty `soubor (1)`).

### Když hooky neběží

Ověření: v novém okně „Jakou máš verzi pravidel?". Když agent neví, prostředí hooky pluginu nespustilo. Záložní ruční instalace do `~/.claude`:

```bash
bash "<cesta k pluginu>/skills/tym-vedouci/assets/rucni-instalace-hooku/install-hooks.sh" "<cesta k PRAVIDLA-VERZE.txt>"
```

(Mac: Terminál, Windows: Git Bash. Cesty stačí do okna přetáhnout myší.) Skript zazálohuje `settings.json`, sloučí jen klíč `hooks`, ověří JSON. Pak restartuj Cowork. Vypnutí: smazat klíč `hooks` ze `~/.claude/settings.json`.

## Obsah

```
.claude-plugin/plugin.json
hooks/                      hooks.json, session-start.sh, pre-write.sh, common.sh
skills/zakladni-nastaveni/  SKILL.md, assets/workspace (kostra), references/navod-pro-cloveka.md
skills/tym-vedouci/         SKILL.md, assets/sablona-slozky, PROJECT-INSTRUCTIONS-vedouci.md,
                            rucni-instalace-hooku/, references/{architektura,udrzba}.md
skills/tym-clen/            SKILL.md
bez-pluginu/                stejný obsah jako soubory (generuje tools/build-bez-pluginu.sh)
docs/                       PDF návod pro uživatele
```

## Požadavky

- Claude desktop s Cowork (placený plán), macOS nebo Windows.
- Týmová část: synchronizovaný cloudový disk (Google Drive pro počítač, OneDrive/SharePoint, Dropbox) se složkou dostupnou **offline**.
- Hlídač pravidel: bash (macOS má, Windows = Git for Windows).

### Stav ověření

| | macOS | Windows |
|---|---|---|
| Skilly (průvodci) | simulováno | simulováno |
| Hooky - logika (BOM, CRLF, diakritika, mezery, `G:`) | testováno | testováno v emulaci Git Bash |
| Spouštění hooků z pluginu v Cowork | **neověřeno** | **neověřeno** |
| Více týmových složek na 1 počítači | hlídač bere složku okna, jinak zapamatovanou / první nalezenou | stejně |

Ověření na vlastním počítači: po instalaci v novém okně napiš „Jakou máš verzi pravidel?" - agent musí citovat hlášku „TÝMOVÝ PROSTOR … hook cowork-tym běží".

## Licence

MIT - viz `LICENSE`. Vzniklo z praxe Marka Štancla, sdíleno volně.
