# cowork-tym

> **Nejsi programátor? Začni tady: [docs/ZACNI-TADY.md](docs/ZACNI-TADY.md)** - za 5 minut víš, co to umí a jak začít. Po instalaci stačí v Coworku napsat **„Jak začít?“**

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
| `pruvodce` | kdokoli, hned po instalaci | „Jak začít?" |
| `zakladni-nastaveni` | kdokoli | „Nastav mi Cowork" |
| `tym-vedouci` | vedoucí týmu | „Chci řídit externisty v Coworku" / „Přidej člena týmu" / „Změnil jsem pravidla" / „Odchod člena" |
| `tym-clen` | člen týmu | „Jsem nový člen týmu, proveď mě nastavením" |
| `novy-projekt` | kdokoli | „Založ projekt X" / „Převezmi moje soubory z OneDrivu do Coworku" |
| `stred-workspace` | kdo chce workspace na více PC nebo zálohu | „Chci Cowork na dvou počítačích" / „Napoj workspace na server" |
| `nove-pc` | nový nebo další počítač | „Připoj další počítač" / „Přecházím na nový počítač" |

## Jak to funguje

### Dvě vrstvy

```
┌─────────────────────────────────────────────────────────────┐
│  TÝMY  (volitelné)   projects/<tym>/  +  sdílená složka     │  ← skill tym-vedouci / tym-clen
├─────────────────────────────────────────────────────────────┤
│  OSOBNÍ PROSTOR      CLAUDE COWORK/ : O-MNE/, projects/,    │  ← skill zakladni-nastaveni
│                      SABLONY/, globální instrukce           │
└─────────────────────────────────────────────────────────────┘
```

Osobní prostor je základ: Claude zná tebe, tvůj styl a tvoje projekty. Tým je u vedoucího **jeden z jeho projektů**, ke kterému je navíc připojená sdílená složka. Člen může mít osobní prostor taky (volitelně), jinak mu stačí projekt se sdílenou složkou.

### Kdo co vidí

```
VEDOUCÍ - počítač                        ČLEN - počítač
┌──────────────────────────────┐        ┌──────────────────────────────┐
│ Cowork projekt „Tým“         │        │ Cowork projekt „Tým“         │
│  připojeno:                  │        │  připojeno:                  │
│   • osobní prostor           │        │   • sdílená složka           │
│     (projects/<tym>/_interni)│        │   (• osobní prostor - volit.)│
│   • sdílená složka           │        │                              │
│  hlídač pravidel (plugin)    │        │  hlídač pravidel (plugin)    │
└──────────────┬───────────────┘        └───────────────┬──────────────┘
               └──────── cloudový disk (Drive, OneDrive…) ┘
```

**Sdílená složka** (vidí vedoucí i členové):

| Cesta | Obsah po založení | Vedoucí | Člen |
|---|---|---|---|
| `ZACNI-TADY.md`, `README.md` | hotový úvod a mapa složky | píše | čte |
| `PRAVIDLA.md` | kostra + tvoje pravidla z rozhovoru, **jediný zdroj pravidel** | píše | čte |
| `PRAVIDLA-VERZE.txt` | verze + historie změn | zvedá verzi | čte (hlídač) |
| `instrukce/` | onboarding, instrukce projektu pro každého člena | píše | čte |
| `sablony/` | prázdné | šablony dokumentů | používá |
| `kb/INDEX.md` | prázdný rejstřík | schvaluje | agent přidává články |
| `lide/kontakty.md` | jména, role, pracovní e-maily | píše | čte |
| `vedouci/` | prázdné | výstupy pro tým | čte |
| `clen-<jmeno>/` | `vystupy/`, `_tmp/`, `VYJIMKY.md`, `NEDOKONCENE-ZAPISY.md` | čte | **jeho pracovní adresář** |

**Jen u vedoucího** (`projects/<tym>/outputs/_interni/`): smlouvy, ceny, personální údaje, konfigurace sítí. Nikdy do sdílené složky.

### Jak s tím pracovat - stačí napsat

| Kdo | Věta | Co se stane |
|---|---|---|
| vedoucí | „Změnil jsem pravidla: …“ | agent ukáže změnu, po schválení zapíše do `PRAVIDLA.md`, zvedne verzi a do historie napíše, co se změnilo |
| vedoucí | „Přidej člena Petr Svoboda“ | založí `clen-petr-svoboda/`, jeho instrukce, kontakt; připraví checklist a předávací e-mail |
| vedoucí | „Odchod člena Petr Svoboda“ | řekne, jaké přístupy odebrat; jeho adresář zůstane týmu |
| vedoucí | „Zkontroluj týmovou složku“ | najde duplikáty, visící zápisy, citlivé údaje, výjimky, které by měly být pravidlem |
| člen | „Jsem nový člen týmu, proveď mě nastavením“ | najde složku, pomůže s projektem, projde testy |
| člen | běžná práce | agent si na začátku přečte pravidla, ukládá do `clen-<jmeno>/`, nic neposílá ven, nemaže, nerozhoduje sám |

**Když vedoucí změní pravidla během práce člena:** hlídač při prvním zápisu jednou zastaví agenta člena a vypíše novinky. Agent si pravidla přečte znovu, zkontroluje rozdělaný úkol a zapíše napodruhé.

### Technicky: hlídač pravidel (hooky)

- *SessionStart* otiskne verzi pravidel sezení a připomene agentovi, co načíst (hláška „TÝMOVÝ PROSTOR … hook cowork-tym běží“).
- *PreToolUse* (zápis souborů, shell, zapisující akce konektorů): když se verze od startu změnila, **jednou** odmítne a vypíše novinky z historie. Druhý pokus projde. Vlastní změnu verze vedoucím nezastaví.
- **Fail-open**: když cokoli chybí nebo selže, mlčí a nic neblokuje. Pojistka proti přehlédnutí, ne zámek.
- Soubor s verzí najde sám (`PRAVIDLA-VERZE.txt` se značkou `COWORK-TYM` ve složce okna, v cloudových discích, na Windows i na písmenech disků). Pevná cesta: ruční instalátor s parametrem, nebo `COWORK_TYM_VERZE_FILE`.
- Instrukce projektu člena obsahují jen „na začátku sezení přečti PRAVIDLA.md“, takže změny pravidel se nikomu nepřeposílají.

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
skills/pruvodce/            SKILL.md (rozcestník)
skills/zakladni-nastaveni/  SKILL.md, assets/workspace (kostra), references/navod-pro-cloveka.md
skills/tym-vedouci/         SKILL.md, assets/sablona-slozky, PROJECT-INSTRUCTIONS-vedouci.md,
                            rucni-instalace-hooku/, references/{architektura,udrzba,hooky-kdy-a-proc}.md
skills/tym-clen/            SKILL.md
skills/novy-projekt/        SKILL.md, references/prevzeti-dat-poznatky.md
skills/stred-workspace/     SKILL.md, references/{zadani-sablona.md,schema.svg}
skills/nove-pc/             SKILL.md
bez-pluginu/                stejný obsah jako soubory: A osobní prostor, B tým, C další postupy (generuje tools/build-bez-pluginu.sh)
docs/                       ZACNI-TADY.md (pro lidi), navod.html → cowork-tym-navod.pdf
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
