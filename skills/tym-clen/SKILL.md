---
name: tym-clen
description: Onboards a team member (employee or external contractor, Mac or Windows, no IT experience assumed) into a leader's shared Cowork workspace - finds the shared folder, fixes cloud-only sync, sets up the project and its instructions, checks the rules hook runs, and walks through verification tests. Use when the user says "jsem nový člen týmu", "proveď mě nastavením", "onboarding", "pozvali mě do sdílené složky", "externista nastavení coworku", or "I was invited to a team workspace".
---

# Týmový prostor - strana člena

Proveď nového člena nastavením. Počítej s tím, že Cowork nikdy neviděl a nemá IT znalosti: česky, krátce, trpělivě, bez žargonu. U každého kroku **„Děláš ty:"** / **„Udělám já:"**, po krocích člověka čekej na potvrzení. Názvy menu uváděj jako pravděpodobné; když je nevidí, nech ho popsat obrazovku a nevymýšlej.

## 0. Kde jsme

Člen často píše poprvé mimo projekt a bez připojené složky - to je v pořádku. Řekni mu jednou větou plán: „Najdeme sdílenou složku, založíme projekt, vložíme instrukce a uděláme 4 krátké testy." Zjisti jméno a Mac/Windows. Zeptej se, jestli udělal kroky A1-A5 z `ZACNI-TADY.md` (účet, soukromí, disk, plugin + restart). Co chybí, projdi s ním podle níže.

## 1. Sdílená složka

Podívej se do připojených složek po `PRAVIDLA-VERZE.txt` se značkou `COWORK-TYM`.
- **Nic připojeného:** **Děláš ty:** v Coworku připoj sdílenou složku (obvykle tlačítko pro přidání složky u okna). Najdeš ji: Google Drive - Mac ve Finderu v bočním panelu „Google Drive → Můj disk", Windows v Průzkumníku disk `G:` nebo `Google Drive` → Můj disk; OneDrive - v Průzkumníku / Finderu složka OneDrive.
- **Složka ve výběru chybí:** projdi `instrukce/ONBOARDING-clen.md` A3 (hlavně „Přidat zástupce na Můj disk" u Google Drive).
- **Připojená, ale prázdná nebo soubory nejdou číst:** soubory jsou jen v cloudu. Projdi A3 bod 3 a A4 (ikona mráčku, Zrcadlit / Vždy ponechat na zařízení). Dál nepokračuj, dokud `PRAVIDLA.md` nejde přečíst.

Pak přečti `ZACNI-TADY.md`, `instrukce/ONBOARDING-clen.md` a `PRAVIDLA.md`. Konkrétní kroky vedoucího (účty, nástroje) mají přednost před tímto skillem.

## 2. Kdo jsi v týmu

Najdi `clen-<slug>/` a `instrukce/PROJECT-INSTRUCTIONS-<slug>.md`. Když chybí, **nic nezakládej** - řekni, ať vedoucí napíše svému agentovi „Přidej člena <jméno>". Mezitím můžeš pokračovat kroky 3-4, test 2 se odloží.

## 3. Projekt a instrukce

- **Děláš ty:** v Coworku založ projekt `<název týmu>` a připoj do něj sdílenou složku (celou).
- **Udělám já:** ukaž v bloku kódu text mezi `---8<---` z `PROJECT-INSTRUCTIONS-<slug>.md` (když neexistuje, z obecného vzoru s doplněným jménem a slugem).
- **Děláš ty:** v nastavení projektu najdi pole pro instrukce, vlož (tlačítko Kopírovat u bloku; vložit Mac Cmd+V / Windows Ctrl+V) a ulož.
- Nástroje z A8, pokud je vedoucí uvedl.

## 4. Hlídač pravidel

Ověřuje se až v testu 3+4 v novém okně projektu. **Nikdy nečti verzi ze souboru místo hlášky** - zakryl bys problém. Když v novém okně hláška chybí:
- **Kontrola:** (1) Plugin nainstalovaný? (2) Aplikace úplně ukončená a znovu spuštěná (Mac Cmd+Q; Windows i ikona u hodin)? (3) Windows: je nainstalovaný Git for Windows (git-scm.com)? Po opravě musí otevřít nové okno. Když ani pak nejde, řekni mu, ať to předá vedoucímu - vedoucí má záložní ruční instalaci ve skillu `tym-vedouci`. Práce může pokračovat; jen se o změnách pravidel dozví až v novém okně.

## 5. Testy (po jednom, čekej na potvrzení)

1. Přečti `PRAVIDLA.md` → obsah.
2. Vytvoř `clen-<slug>/_tmp/TEST-propojeni.md` s datem a jménem → ať vedoucímu napíše, že tam je. Potvrzení **může přijít později**, nečekej na něj; řekni mu: „Až vedoucí potvrdí, napiš mi ‚test 2 prošel‘.“ Když adresář chyběl (krok 2), test udělej, až ho vedoucí založí: „Dokonči test 2.“
3+4. Ať otevře **nové okno uvnitř projektu** (se sdílenou složkou) a napíše: „Jakou máš verzi pravidel a co pro tebe platí za pravidla?“ → agent v novém okně musí (a) citovat hlášku hlídače a (b) odpovídat z `PRAVIDLA.md`. Když chybí (a): krok 4. Když (b) zní obecně: chat není v projektu, nebo instrukce nejsou uložené. **Hlášku hlídače nehodnoť v okně, kde onboarding začal** - to často běží mimo projekt a bez složky, takže by chyběla i při fungujícím hlídači.

Testovací soubor nech v `_tmp/`.

## 6. Shrnutí

5-8 vět z `PRAVIDLA.md`: odkud chodí práce, pořadí, kam ukládat, jak uzavřít úkol, co agent nedělá. A: „Když ti agent jednou odmítne uložit s tím, že se změnila pravidla, je to v pořádku - načte je a uloží napodruhé."

## Pravidla pro tebe

- Odmítnutí hlídače nikdy neobcházej.
- Zapisuj jen do `clen-<slug>/` (a `kb/`, když to pravidla povolují).
- Needituj `PRAVIDLA.md`, `PRAVIDLA-VERZE.txt` ani `instrukce/` - změny navrhuj vedoucímu.
- Hesla a přístupové údaje nikdy do chatu ani do souborů.
