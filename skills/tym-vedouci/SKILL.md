---
name: tym-vedouci
description: Guides a team leader (Mac or Windows, little IT experience assumed) through setting up and running a shared Cowork workspace for subordinates - employees or external contractors - with a shared cloud folder (Google Drive, OneDrive/SharePoint, Dropbox), a single rules file whose version hooks enforce, per-member project instructions, onboarding, rule changes, adding and offboarding members. Use when the user says "chci řídit externisty/zaměstnance v coworku", "nastav týmový prostor", "sdílená složka s podřízeným", "přidej člena týmu", "změnil jsem pravidla", "odchod člena", or "set up a team workspace".
---

# Týmový prostor - strana vedoucího

Proveď vedoucího nastavením a provozem týmového prostoru. Počítej s tím, že **nemá IT znalosti**: česky, krátce, bez žargonu (hook = „hlídač pravidel", placeholder nepoužívej vůbec). U každého kroku napiš **„Děláš ty:"** / **„Udělám já:"** a po krocích člověka čekej na potvrzení. Názvy menu uváděj jako pravděpodobné; když je uživatel nevidí, nech ho popsat obrazovku a nevymýšlej.

Proč je to postavené takhle: `references/architektura.md`. Údržba: `references/udrzba.md`. Vzory: `assets/`.

## 0. Co chce udělat

Zeptej se (AskUserQuestion), pokud to není jasné: založit prostor (§1-7) / přidat člena / změnit pravidla / odchod člena / kontrola stavu (vše `references/udrzba.md`). Zjisti Mac nebo Windows.

## 1. Rozhovor

Po skupinách, max 4 otázky najednou, nabízej možnosti:
- Název týmu a zkratka pro názvy chatů (navrhni ji sám), jméno vedoucího.
- Členové: jméno, zaměstnanec/externista, Mac/Windows, vlastní nebo firemní účet Claude.
- Kde bude sdílená složka: Google Drive / OneDrive-SharePoint / Dropbox. Doporuč to, co firma už používá. **Pro externisty z jiné firmy doporuč Google Drive nebo Dropbox** - synchronizace firemního OneDrive/SharePointu cizím účtem často nejde nebo ji zakazuje správce.
- Kudy chodí práce (úkolovník, e-mail, jen soubory), nástroje, které člen potřebuje.
- Co je citlivé (výchozí: smlouvy, ceny, personální a zdravotní údaje, hesla, konfigurace sítí).
- Pravidla, která už má v hlavě (kolik úkolů najednou, jak se úkol uzavírá, co schvaluje).
Co uživatel neví, vyplň rozumným výchozím návrhem a řekni mu ho - neponechávej prázdná místa.

## 2. Sdílená složka

- **Děláš ty:** na disku vytvoř prázdnou složku (navrhni `_TYM-<nazev>`). Nastav ji jako dostupnou offline (Google Drive: v nastavení Drive pro počítač „Zrcadlit soubory", nebo na složce „Dostupné offline"; OneDrive: pravým na složku → „Vždy ponechat na tomto zařízení"). V Coworku ji **připoj jako samostatnou složku** (zkratky/aliasy na složky Cowork nenásleduje).
- **Udělám já:** ověř, že složku vidím a je zapisovatelná. Zkopíruj do ní `assets/sablona-slozky/` **kromě** složky `clen-VZOR`. Nic nepřepisuj bez souhlasu.
- **Udělám já:** pro každého člena zkopíruj `assets/sablona-slozky/clen-VZOR/` jako `clen-<slug>/` (slug = jméno malými písmeny bez diakritiky s pomlčkou, např. `petr-svoboda`) a vytvoř `instrukce/PROJECT-INSTRUCTIONS-<slug>.md` z obecného vzoru s jeho jménem. Obecný vzor `PROJECT-INSTRUCTIONS-clen.md` nech s `{CLEN}`/`{CLEN_SLUG}` - je to šablona pro další členy.
- Vyplň: `{TYM}`, `{VEDOUCI}`, `{DATUM}` (dnes, RRRR-MM-DD), `{PREFIX}`, `{KANAL_PRACE}`, `{N}`, `{DALSI_ZDROJE}` (PRAVIDLA.md), `{UCET}`, `{POVINNE}`, `{NASTROJE}` (ONBOARDING-clen.md); v `clen-<slug>/README.md` `{CLEN}` a `{CLEN_SLUG}`; `{LOKALNI_CESTA}` řeší §4. Některé značky mají v sobě popis (`{KANAL_PRACE - např. …}`) - nahraď celou značku včetně popisu. V obecném vzoru `PROJECT-INSTRUCTIONS-clen.md` vyplň vše kromě `{CLEN}` a `{CLEN_SLUG}`. U externistů doporuč `{POVINNE}` = „Je to povinné.".
- `PRAVIDLA.md`: sepiš z rozhovoru, ukaž, po schválení ulož. `lide/kontakty.md`: členové (jméno, role, pracovní e-mail).
- Když pravidla povedou jinde (např. poznámka v úkolovníku), uprav `ZDROJ-PRAVIDEL:` v `PRAVIDLA-VERZE.txt`.
- **Kontrola:** vyhledej ve sdílené složce `{` mimo `instrukce/PROJECT-INSTRUCTIONS-clen.md`. Nic nesmí zůstat. Vypiš uživateli, co jsi vyplnil výchozí hodnotou.

## 3. Hlídač pravidel (hooky)

Plugin obsahuje dva malé skripty: při startu okna si zapamatují verzi pravidel, před zápisem ji porovnají a při změně **jednou** zápis zastaví s výpisem, co se změnilo. Při jakékoli chybě mlčí a nic neblokují. Sdílenou složku najdou samy (cloudové disky, Windows písmena disků, připojená složka okna).

- **Děláš ty:** po instalaci pluginu aplikaci úplně ukonči a spusť znovu (Mac Cmd+Q; Windows i ikonu u hodin). Windows: nainstaluj Git for Windows (git-scm.com, výchozí volby) - bez něj hlídač neběží.
- **Ověření:** v novém okně „Jakou máš verzi pravidel?" → musím citovat hlášku „TÝMOVÝ PROSTOR … hook cowork-tym běží". **Nečti verzi ze souboru** - tím bys zakryl, že hlídač neběží.
- **Když neběží:**
  1. Restart opravdu úplný? Windows: je Git for Windows?
  2. Záložní ruční instalace: řekni uživateli přesně (Mac): „Otevři Terminál (Cmd+mezerník, napiš Terminál, Enter). Napiš `bash ` (s mezerou), přetáhni do okna soubor `install-hooks.sh`, napiš mezeru, přetáhni soubor `PRAVIDLA-VERZE.txt` ze sdílené složky, Enter." Windows totéž v aplikaci **Git Bash**. Cestu k `install-hooks.sh` najdi v `${CLAUDE_PLUGIN_ROOT}/skills/tym-vedouci/assets/rucni-instalace-hooku/` a řekni ji. Skript zálohuje nastavení a zapíše i cestu ke sdílené složce. Pak znovu úplný restart.
- Test změny: řekni „Teď v jiném okně napiš: ‚Změnil jsem pravidla, zvedni verzi s poznámkou test.' Pak se vrať sem a řekni mi, ať něco uložím." První zápis se musí jednou odmítnout.

## 4. Projekt vedoucího

- **Udělám já:** vyplň `assets/PROJECT-INSTRUCTIONS-vedouci.md` (bez lokální části smaž bod 3). Když má vedoucí osobní prostor (skill `zakladni-nastaveni`), ulož do `projects/<tym>/PROJECT-INSTRUCTIONS.md`, jinak jen ukaž v bloku kódu.
- **Děláš ty:** založ v Coworku projekt, připoj sdílenou složku (a svou lokální složku, pokud ji máš) a vlož text do instrukcí projektu.

## 5. Onboarding člena

**Udělám já:** pro každého člena připrav a ukaž (neukládej do sdílené složky - obsahuje přístupy):
1. **Checklist vedoucího** (před odesláním zprávy): nasdílet složku s právem úprav; pozvat do nástrojů jen do nutných projektů; externistovi časově omezené účty; přiložit `cowork-tym.plugin` (nebo odkaz na veřejné vydání).
2. **Předávací zprávu** (e-mail, krátce): co je Cowork; ať otevře `ZACNI-TADY.md` ve sdílené složce (jde i v prohlížeči); kroky A1-A5 udělá sám; pak v Coworku napíše „Jsem nový člen týmu, proveď mě nastavením"; Windows: Git for Windows.

## 6. Ověření s členem

Až člen skončí, zeptej se, jestli prošly testy (`instrukce/ONBOARDING-clen.md` část B) - hlavně 3+4 (nové okno: hlídač + pravidla ze složky). Potvrď test 2: podívej se do `clen-<slug>/_tmp/` na testovací soubor. Doporuč projít s členem jeden vzorový úkol.

## 7. Předání

Shrň vedoucímu v 5 bodech: kde co je, jak mění pravidla („Změnil jsem pravidla" → agent zvedne verzi), jak přidá/odebere člena, co nikdy nedávat do sdílené složky, a že soubory pravidel nemá upravovat v Poznámkovém bloku/TextEditu.

## Pravidla pro tebe

- Citlivé údaje nikdy do sdílené složky - navrhni obecnou verzi.
- Změna pravidel vždy se zvednutím verze (postup v `references/udrzba.md`).
- Do práce členů v `clen-*` nezasahuj; smíš jen založit adresář nového člena a označit odchod.
- Netvrď, že jsi něco nastavil v aplikaci nebo na disku - to dělá člověk.
