# Varianta bez pluginu

Stejný obsah jako plugin, jen jako obyčejné soubory. Hodí se, když:
- nechceš nebo nemůžeš instalovat plugin,
- chceš si instrukce nejdřív přečíst a upravit po svém,
- používáš jiný nástroj než Cowork (Claude Code, jiný agent).

Rozdíl proti pluginu: **nikdo tě neprovede.** Soubory vyplníš sám, nebo je dáš agentovi a řekneš mu, ať tě provede (viz „Zkratka“ u každé části). Hlídač pravidel se instaluje ručně.

| Složka | K čemu |
|---|---|
| `A-osobni-prostor/` | vlastní pracovní prostor (kostra `CLAUDE COWORK` + `NAVOD.md`) |
| `B-tym/` | řízení zaměstnanců a externistů (sdílená složka, instrukce, hlídač) |
| `C-dalsi-postupy/` | průvodce a organizace práce, nový projekt a převzetí dat, více počítačů (cloud nebo server), nový počítač - postupy jako text, dej je agentovi přečíst |

Vygenerováno ze stejných zdrojů jako plugin (`tools/build-bez-pluginu.sh`), takže je vždy aktuální.

---

## A. Vlastní pracovní prostor

1. Zkopíruj složku `A-osobni-prostor/CLAUDE COWORK` do domovské složky.
   Mac: Finder → Cmd+Shift+H. Windows: `C:\Users\<jméno>\` (ne do OneDrive, Dokumentů, na Plochu).
2. V Coworku ji připoj jako pracovní složku.
3. Ve všech souborech nahraď `{JMÉNO}` svým jménem a `{SLOZKA}` názvem složky.
4. Vyplň `O-MNE/about-me.md` a `O-MNE/my-goals.md`. Projdi body *(volitelné)* v `O-MNE/agent-protocol.md` a `O-MNE/anti-ai-writing-style.md`, nechtěné smaž.
5. Text z `GLOBAL-INSTRUCTIONS.txt` vlož do nastavení aplikace Claude (globální instrukce pro Cowork).
6. Založ v Coworku projekt „General“, pracovní složka = celá `CLAUDE COWORK`, do instrukcí projektu vlož obsah `projects/general/PROJECT-INSTRUCTIONS.md`.
7. Ověř: v novém okně projektu napiš „Znáš pravidla a víš, jakému projektu patříš?“

**Zkratka:** zkopíruj složku, připoj ji a napiš agentovi: *„Ve složce je kostra pracovního prostoru. Přečti NAVOD.md a STRUKTURA.md a proveď mě nastavením krok po kroku - co mám udělat já a co uděláš ty.“* (NAVOD.md přilož do složky.)

Podrobnosti a „proč“: `A-osobni-prostor/NAVOD.md`.

---

## B. Tým

### Vedoucí

1. Na cloudovém disku vytvoř prázdnou složku (např. `_TYM-SERVIS`), nastav ji **offline** a připoj v Coworku samostatně.
2. Zkopíruj do ní obsah `B-tym/sdilena-slozka/` **kromě** `clen-VZOR`.
3. Pro každého člena zkopíruj `clen-VZOR` jako `clen-jmeno-prijmeni` a z `instrukce/PROJECT-INSTRUCTIONS-clen.md` udělej `instrukce/PROJECT-INSTRUCTIONS-jmeno-prijmeni.md` s jeho jménem.
4. Vyplň všechny `{…}` (tým, vedoucí, datum `RRRR-MM-DD`, prefix, kanál práce, počet úkolů, účet, povinnost, nástroje). Nic ve složených závorkách nesmí zůstat, kromě obecného vzoru instrukcí člena.
5. Sepiš pravidla do `PRAVIDLA.md`.
6. **Hlídač pravidel:** v Terminálu (Mac) / Git Bash (Windows, nejdřív nainstaluj Git for Windows) spusť:
   ```
   bash "<cesta>/B-tym/hlidac/install-hooks.sh" "<cesta ke sdílené složce>/PRAVIDLA-VERZE.txt"
   ```
   (Cesty stačí přetáhnout myší do okna.) Pak aplikaci úplně ukonči a spusť znovu.
7. Tým si ve svém osobním prostoru založ jako projekt `projects/<tym>/` podle `SABLONY/tymovy-projekt.md` (smlouvy a ceny do `outputs/_interni/`). V Coworku k projektu připoj osobní prostor i sdílenou složku a vlož `B-tym/PROJECT-INSTRUCTIONS-vedouci.md` (blok mezi `---8<---`, `{LOKALNI_CESTA}` = `projects/<tym>/outputs/_interni/`). Bez osobního prostoru stačí samostatná lokální složka mimo sdílený disk.
8. Ověř: v novém okně „Jakou máš verzi pravidel?“ - agent musí citovat „TÝMOVÝ PROSTOR … hook cowork-tym běží“.
9. Nasdílej složku členům (právo úprav) a pošli jim odkaz na `ZACNI-TADY.md` + složku `B-tym/hlidac/`.

**Změna pravidel:** uprav `PRAVIDLA.md`, zvedni první řádek `PRAVIDLA-VERZE.txt` (např. `2026-10-02-a`) a pod HISTORIE připiš, co se změnilo. Ne v Poznámkovém bloku / TextEditu - radši přes agenta.

**Zkratka:** připoj prázdnou sdílenou složku i tuto složku `B-tym` a napiš agentovi: *„Přečti B-tym/architektura.md a udrzba.md a proveď mě založením týmového prostoru podle sdilena-slozka/. Co mám udělat já, co uděláš ty.“*

### Člen

Postup je v `sdilena-slozka/instrukce/ONBOARDING-clen.md`. Místo instalace pluginu (A5) spusť ruční instalaci hlídače jako vedoucí v bodě 6.

---

Chování hlídače, omezení a řešení problémů: `B-tym/architektura.md` a PDF návod v `docs/`.

## C. Další postupy

Připoj složku `C-dalsi-postupy` a napiš agentovi např.: *„Přečti C-dalsi-postupy/novy-projekt.md a proveď mě podle něj.“* Totéž s `pruvodce.md` (organizace práce), `stred-workspace.md` (více počítačů, záloha) a `nove-pc.md`.
