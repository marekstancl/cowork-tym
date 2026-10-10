---
name: zakladni-nastaveni
description: Guided setup of a personal Claude Cowork workspace (folder structure, "O-MNE" profile files, agent protocol, anti-AI writing style, global and project instructions, templates, handoffs) for Mac and Windows users with little IT experience. Use when the user says "nastav mi cowork", "základní uspořádání coworku", "chci pracovní prostor v coworku", "set up my cowork workspace", or is new to Cowork and wants a working structure.
---

# Základní nastavení Cowork pracovního prostoru

> **Na začátku řekni uživateli (svými slovy, max. 4 věty):** Co udělám: postavím ti pracovní prostor: složku s pořádkem, soubory o tobě (aby Claude věděl, kdo jsi a jak pracuješ), instrukce a první projekt. Zabere to asi 30-45 minut. Na konci budeš mít: složka `CLAUDE COWORK` připojená v Coworku, projekt General, který zná tvoje pravidla. Kdykoli můžeš přestat a pokračovat jindy - napiš „pokračuj".

Proveď uživatele nastavením osobního pracovního prostoru. Počítej s tím, že uživatel **nemá IT znalosti**: mluv česky (nebo jeho jazykem), krátkými větami, bez slov jako workspace, placeholder, Markdown, konektor, hook - když musíš, vysvětli je v závorce jednou větou. U každého kroku napiš **„Děláš ty:"** a **„Udělám já:"** a po každém kroku, který dělá člověk, počkej na potvrzení.

Kostra je v `${CLAUDE_PLUGIN_ROOT}/skills/zakladni-nastaveni/assets/workspace/`. Vysvětlení „proč" pro člověka je v `references/navod-pro-cloveka.md`.

## Jak mluvit o aplikaci (platí pro všechny kroky)

Názvy menu v aplikaci Claude se mezi verzemi mění. Uváděj je jako **pravděpodobné** („obvykle najdeš v Nastavení → …"). Když uživatel nic takového nevidí, **nevymýšlej jiné cesty**: požádej ho, ať popíše, co na obrazovce vidí (nebo pošle snímek obrazovky), a veď ho podle toho. Kopírování textu vysvětli jednou: „U šedého bloku s textem je tlačítko Kopírovat. Pak klikni do pole a vlož: Mac Cmd+V, Windows Ctrl+V."

## 0. Zjisti cíl a počítač

Zeptej se (AskUserQuestion), co chce:
- Jen svůj pracovní prostor → tento skill.
- Svůj prostor a k tomu řídit lidi (zaměstnance, externisty) přes sdílenou složku → tento skill, pak skill `tym-vedouci`.
- Někdo mě pozval do svého týmu → skill `tym-clen`.

Zjisti: jméno (v 1. pádě), Mac nebo Windows.

## 1. Složka

- **Děláš ty:** vytvoř složku `CLAUDE COWORK`:
  - Mac: ve Finderu otevři domovskou složku (menu Otevřít → Domů, zkratka Cmd+Shift+H), pak Soubor → Nová složka (Cmd+Shift+N) a pojmenuj ji.
  - Windows: v `C:\Users\<tvoje jméno>\` (v Průzkumníku do adresního řádku napiš `%USERPROFILE%` a Enter, pak pravé tlačítko do prázdného místa → Nový → Složka). **Ne** do Dokumentů, na Plochu ani do OneDrive - ty se často synchronizují do cloudu a Cowork pak soubory nevidí. (Kdo chce pracovat z více počítačů, nastaví to později vědomě přes skill `stred-workspace`.)
  - Pak ji v Coworku **připoj jako pracovní složku** (obvykle tlačítkem pro přidání složky u okna chatu).
- **Udělám já:** ověř, že složku vidíš (vypiš její obsah). Když ji nevidíš, řekni to a vrať se k připojení - nepokračuj.
- **Udělám já:** zkopíruj celou kostru do připojené složky. **Nic nepřepisuj**; když soubor existuje, vypiš kolize a zeptej se. Nahraď `{JMÉNO}` jménem (1. pád) a `{SLOZKA}` jen názvem složky (např. `CLAUDE COWORK`, ne celou cestou). Nemaž `.gitkeep` a řekni uživateli, ať je nemaže taky (drží prázdné složky).

## 2. Soubory o uživateli (`O-MNE/`)

1. `about-me.md`: polož 8-12 otázek **po jedné** (kdo je, práce, jak pracuje, co je dobrý výsledek, co mu vadí, nástroje). Když spěchá, nabídni 5. Sestav soubor podle kostry, ukaž návrh, po schválení ulož a **smaž úvodní citaci s pokyny**.
2. `anti-ai-writing-style.md`: zeptej se, zda převzít typografická pravidla (krátká pomlčka místo dlouhé, české uvozovky). Když ne, smaž sekci „Typografický AI slop“ a řádky o pomlčce v tabulce sekce 5 a v checklistu; když ano, smaž jen značku *(volitelné, doporučeno)*. Požádej o 1-3 vlastní texty; podle nich přepiš sekci 6 „ANO" (jinak ji nahraď neutrální větou, že se doplní později). Smaž úvodní citaci.
3. `my-goals.md`: zeptej se na 3 cíle na toto čtvrtletí (když do jeho konce zbývá méně než měsíc, na příští). Vyplň čtvrtletí, rok a dnešní datum. Prázdné části smaž, ať tam nezůstanou závorky.
4. `agent-protocol.md`: shrň ve 3 větách, co vynucuje. Body *(volitelné)* projdi jednou otázkou s výběrem více možností, popsanou lidsky (např. „Má agent u každé věci říct, jak si je jistý?“, „Má ti oponovat, když vidí problém?“, „Mají se přehledy a zprávy ukládat jako sdílitelná stránka?“). Nechtěné smaž, u chtěných smaž značku. Totéž udělej s řádkem `[VOLITELNÉ]` v `GLOBAL-INSTRUCTIONS.txt`. Smaž úvodní citaci.

Na konci vyhledej mimo `SABLONY/` zbylé značky `{VELKÁ_PÍSMENA}` (např. `{JMÉNO}`, `{SLOZKA}`), `RRRR`, `(cíl)`, `*(volitelné)*` a `[VOLITELNÉ]`. Nic z toho nesmí zůstat. Zápisy jako `<kategorie>` nebo `<krátký popis>` jsou záměrné vzory - nech je.

## 3. Globální instrukce

- **Udělám já:** ukaž obsah `GLOBAL-INSTRUCTIONS.txt` v bloku kódu.
- **Děláš ty:** otevři Nastavení aplikace Claude (Mac: Cmd+, nebo menu Claude → Nastavení; Windows: obvykle přes ikonu profilu / menu) a najdi část pro Cowork s polem pro globální instrukce. Vlož text, ulož. Když pole nenajdeš, popiš mi, co vidíš.

## 4. První projekt

- **Děláš ty:** v Coworku založ projekt „General". Jako pracovní složku vyber **celou** složku `CLAUDE COWORK` (ne jen podsložku). Do pole instrukcí projektu vlož text, který ti ukážu.
- **Udělám já:** ukaž obsah `projects/general/PROJECT-INSTRUCTIONS.md` v bloku kódu. Vysvětli, že další projekty umíš založit na požádání („Založ projekt X").

## 5. Ověření

**Děláš ty:** otevři **nové okno** (nový chat) uvnitř projektu General a napiš: „Znáš pravidla a víš, jakému projektu patříš?"
Správně: odpověď zmíní jeho jméno a soubory z `O-MNE/`. Když odpověď zní obecně, projdi s ním: (1) je chat opravdu uvnitř projektu, (2) je u projektu připojená celá složka, (3) jsou instrukce vložené a uložené. Oprav a test zopakuj.

## 6. Na konec - jen tři návyky

1. „Ulož to jako šablonu" - když se výsledek povede.
2. „Udělej předávku" - před koncem delší práce; další okno naváže.
3. Jednou za čtvrtletí: „Projdeme moje cíle."
Ostatní (paměť, připojení dalších aplikací) nabídni jednou větou, podrobnosti jen na požádání.

## Pravidla

- Nikdy nepřepisuj existující soubory bez souhlasu.
- Hesla, čísla účtů ani zdravotní údaje do souborů neukládej.
- Když uživatel skončí v půlce, zapiš stav do `projects/general/workshop/handoffs/active/handoff-nastaveni.md` a řekni, jak navázat („Pokračujme v nastavení").
