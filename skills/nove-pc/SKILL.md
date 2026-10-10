---
name: nove-pc
description: Připojí další počítač (Windows nebo Mac) k Cowork pracovnímu prostoru - vysvětlí, co se přenese samo přes účet Claude a co ne, nastaví synchronizaci složky (přes cloud nebo server se Syncthingem), znovu připojí projekty s instrukcemi a ověří; pro člověka bez IT znalostí. Use when the user says "nový počítač", "druhé PC", "připoj notebook k coworku", "workspace na dalším počítači", "přecházím na nový počítač", or "add another computer to my workspace".
---

# Další (nebo nový) počítač

> **Na začátku řekni uživateli (svými slovy, max. 4 věty):** Co udělám: připojím další nebo nový počítač. Vysvětlím, co se přenese samo s účtem Claude a co nastavíme. Zabere to 30 minut. Na konci budeš mít: na novém počítači pracuješ stejně jako na starém. Kdykoli můžeš přestat a pokračovat jindy - napiš „pokračuj".

Mluv bez žargonu, „**Děláš ty:**“ / „**Udělám já:**“, po každém kroku počkej.

## 1. Vysvětli, co se přenese samo a co ne

Názvy a chování aplikace se mění - formuluj to jako „obvykle“ a když si nejsi jistý, ověř v nápovědě Claude (support.claude.com).

| Přenese se samo (je v účtu Claude) | Nepřenese se (je na počítači) |
|---|---|
| historie chatů a úloh Cowork | **složka `CLAUDE COWORK` a všechny soubory** |
| projekty založené v aplikaci (od nuly / importem) | **projekty založené ze složky na počítači** |
| instrukce v Nastavení (globální instrukce) | paměť úloh, které běžely jen na tomto počítači |
| nainstalované pluginy | oprávnění aplikace (složky, prohlížeč, ovládání počítače) |
| naplánované úlohy běžící v cloudu | lokální nástroje (Syncthing, git, …) |

Proto si v pracovním prostoru drží instrukce každého projektu **jako soubor** (`projects/<x>/PROJECT-INSTRUCTIONS.md`) - na novém počítači je jen vložíš. Historie chatů se nekopíruje: stáhne se s účtem. **Nikdy** nekopíruj interní složky aplikace Claude ze starého počítače.

## 2. Příprava
- Windows nebo Mac, kdo bude u počítače pracovat. Jak je zařízen středobod (skill `stred-workspace`): **cloud** nebo **server**? Když žádný, nejdřív `stred-workspace`.
- Na novém počítači nesmí být jiná složka `CLAUDE COWORK` s jiným obsahem.

## 3a. Středobod = cloud (OneDrive / Google Drive / Dropbox)
- **Děláš ty:** nainstaluj klienta cloudu, přihlas se stejným účtem, počkej, až se objeví `CLAUDE COWORK`.
- **Děláš ty:** u složky zapni „Vždy ponechat na tomto zařízení“ (offline) a počkej, až se vše stáhne.

## 3b. Středobod = server (Syncthing)
- **Windows - Děláš ty:** stáhni ze syncthing.net instalátor pro Windows (verze s ikonou v liště), nainstaluj, spouštět po startu. Ovládání: http://127.0.0.1:8384.
- **Mac - Děláš ty:** aplikace Syncthing (nebo `brew install syncthing` + `brew services start syncthing`); v Nastavení systému → Soukromí a zabezpečení → **Místní síť** ji povol.
- Vypni Globální vyhledávání a Relaye.
- **Děláš ty:** Akce → Zobrazit ID, pošli mi ho. **Udělám já:** připravím pro Claude Code na serveru zadání „přidej zařízení <ID> jménem <PC> a nasdílej mu složku workspace“.
- **Děláš ty:** přijmi sdílenou složku, cesta `C:\Users\<jméno>\CLAUDE COWORK` (ne Dokumenty/Plocha/OneDrive) nebo `~/CLAUDE COWORK`. Do „Ignorovat vzory“ vlož seznam, který ti dám. Počkej na „Aktuální“.

## 4. Cowork na novém počítači
1. **Děláš ty:** nainstaluj aplikaci Claude, přihlas se **stejným účtem**. Zkontroluj, že vidíš historii a pluginy (měly by se objevit samy).
2. **Děláš ty:** připoj složku `CLAUDE COWORK`. Projekty, které chybí (byly založené ze složky), založ znovu se stejným názvem a připojenou celou složkou; instrukce ti ukážu ze souborů `PROJECT-INSTRUCTIONS.md`.
3. Zkontroluj globální instrukce v Nastavení; když chybí, vlož `GLOBAL-INSTRUCTIONS.txt`.
4. Oprávnění (složky, prohlížeč, ovládání počítače) povol znovu, až o ně aplikace požádá.

## 5. Ověření
- **Udělám já:** vytvořím `_test-<PC>.txt`; potvrdíš, že je vidět na druhém počítači; smažu ho.
- Nový chat v projektu: „Znáš pravidla a víš, jakému projektu patříš?“

## Pravidla pro více počítačů
- Stejný soubor needitovat současně na dvou PC. Konfliktní kopii sloučit do původního a smazat.
- Po zapnutí počítače, který byl dlouho vypnutý, počkej na dosynchronizování.
- Odcházíš ze starého počítače: odhlas se z Claude a odeber ho ze synchronizace (Syncthing: odebrat zařízení na serveru).
