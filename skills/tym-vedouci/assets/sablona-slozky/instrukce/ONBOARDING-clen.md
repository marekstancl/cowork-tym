# Onboarding člena týmu {TYM}

Počítej zhruba s hodinou. **Kroky A1-A5 děláš ty** (agent je udělat nemůže). Pak napíšeš agentovi a zbytek (A6-A8 a testy) projdete spolu.

Názvy tlačítek se mezi verzemi aplikací mění. Když něco nevidíš přesně takhle, napiš vedoucímu nebo (od kroku A5) agentovi, co vidíš.

## A. Nastavení

**A1. Claude.** Stáhni aplikaci Claude pro Mac nebo Windows z claude.ai/download a přihlas se {UCET}.

**A2. Soukromí.** V nastavení aplikace (obvykle Nastavení → Soukromí) vypni používání konverzací ke zlepšování modelů. {POVINNE}. Udělej to před prvním pracovním textem.

**A3. Sdílená složka.** Otevři pozvánku z e-mailu.

*Google Drive:*
1. Na drive.google.com najdi složku v **Sdíleno se mnou**, klikni pravým → **Uspořádat → Přidat zástupce** (nebo „Přidat zkratku na Disk“) → **Můj disk**. Bez toho se sdílená složka do počítače nestáhne.
2. Nainstaluj **Google Drive pro počítač** a přihlas se stejným účtem.
3. V nastavení Google Drive pro počítač (ikona Drive v horní liště na Macu / u hodin na Windows → ozubené kolo → Předvolby) u „Můj disk“ zvol **Zrcadlit soubory**. (Alternativa: nech „Streamovat“ a na složce klikni pravým → **Dostupné offline**.)

*OneDrive / SharePoint* (když jsi z jiné firmy, může to správce zakázat - pokud tlačítko Synchronizovat / Přidat zástupce nevidíš, napiš vedoucímu):
1. V pozvánce klikni na **Přidat zástupce do Mého OneDrivu** (nebo v knihovně SharePoint **Synchronizovat**).
2. V Průzkumníku / Finderu na složce klikni pravým → **Vždy ponechat na tomto zařízení**.

**A4. Kontrola - nejčastější chyba.** Otevři složku v Průzkumníku / Finderu. U souborů **nesmí být ikona mráčku** (jen zelená fajfka / plný kruh). Zkus otevřít `ZACNI-TADY.md` s vypnutým internetem - musí jít. Když nejde, složka je jen v cloudu a Cowork ji uvidí prázdnou.

**A5. Plugin.** Soubor `cowork-tym.plugin` od vedoucího otevři dvojklikem, nebo ho v aplikaci Claude nahraj v části pro pluginy (Cowork → Pluginy / Customize). Potvrď instalaci. Pak aplikaci **úplně ukonči** (Mac: Cmd+Q; Windows: i ikonu Claude u hodin → Ukončit) a spusť znovu.
*Windows:* hlídání pravidel potřebuje **Git for Windows** (git-scm.com, instalace s výchozími volbami). Bez něj vše funguje, jen se o změnách pravidel dozvíš až v novém okně.

➡ **Teď napiš v Coworku: „Jsem nový člen týmu, proveď mě nastavením.“**

**A6. Projekt (s agentem).** V Coworku založ projekt `{TYM}` a připoj do něj sdílenou složku (celou, ne podsložku). Veškerou práci pro tým dělej v tomto projektu.

**A7. Instrukce projektu (s agentem).** Agent ti ukáže text z `instrukce/PROJECT-INSTRUCTIONS-<tvoje-jmeno>.md`. Zkopíruj ho do pole instrukcí projektu a ulož.

**A8. Nástroje (volitelné).** {NASTROJE}

## B. Ověřovací testy (vede agent)

| # | Test | Má vyjít | Když ne |
|---|---|---|---|
| 1 | „Přečti mi PRAVIDLA.md“ | obsah, ne prázdno | A3/A4 |
| 2 | „Vytvoř testovací soubor v mém adresáři“ | vedoucí ho do pár minut vidí (lze potvrdit později) | A3, práva k úpravám |
| 3+4 | v **novém** okně projektu: „Jakou máš verzi pravidel a co pro tebe platí za pravidla?“ | cituje hlášku hlídače a odpovídá ze složky | hláška chybí: A5 (restart, Git); obecná odpověď: A6/A7 |

## C. Co agent dělá a co ne

Dělá: načte pravidla, najde postup nebo článek ve znalostní bázi, připraví podklady a texty, po dokončení si vyžádá jednu větu o řešení a doplní znalostní bázi.
Nedělá: neposílá nic ven, nemaže, nerozhoduje za tebe, nedělá fyzickou práci.
