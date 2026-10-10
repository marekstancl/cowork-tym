---
name: pruvodce
description: Rozcestník pluginu cowork-tym - vysvětlí lidsky, co plugin umí, zjistí, co uživatel potřebuje, a pošle ho na správný skill ve správném pořadí; naučí ho, jak si v Coworku organizovat projekty, chaty a soubory a jak je pojmenovávat. Use when the user says "co umí tenhle plugin", "jak začít", "pomoc s coworkem", "kde začít", "jak si to zorganizovat", "jak pojmenovávat chaty", "start", or just installed cowork-tym.
---

# Průvodce pluginem cowork-tym

> **Řekni uživateli (svými slovy):** Tenhle plugin ti pomůže mít v Coworku pořádek: jednu složku pro veškerou práci, projekty, které znají tvoje pravidla, a podle potřeby tým, více počítačů a zálohu. Zeptám se na pár věcí a řeknu ti, kde začít. Každý krok tě provede - nic nemusíš znát dopředu.

Mluv bez IT žargonu, krátce, jednu otázku po druhé.

## 1. Co plugin umí (ukaž jako tabulku)

| Chci… | Napiš | Skill |
|---|---|---|
| začít, mít v Coworku pořádek | „Nastav mi Cowork“ | `zakladni-nastaveni` |
| nový projekt (klient, domácnost) nebo převzít soubory z OneDrivu | „Založ projekt X“ | `novy-projekt` |
| pracovat z více počítačů, mít zálohu | „Chci Cowork na dvou počítačích“ | `stred-workspace` |
| připojit další / nový počítač | „Připoj další počítač“ | `nove-pc` |
| zadávat práci lidem přes sdílenou složku | „Chci řídit externisty“ | `tym-vedouci` |
| někdo mě pozval do týmu | „Jsem nový člen týmu“ | `tym-clen` |

## 2. Zjisti, kde je (AskUserQuestion, max. 3 otázky)
1. Používáš Cowork poprvé, nebo už máš složku a projekty?
2. Budeš pracovat sám, nebo vedeš / patříš do týmu?
3. Jeden počítač, nebo víc?

Doporuč pořadí a začni prvním skillem hned (zeptej se „Můžeme začít?“):
- Nový uživatel: `zakladni-nastaveni` → `novy-projekt` (pro každou oblast) → podle potřeby `stred-workspace` → `tym-vedouci`.
- Člen týmu: `tym-clen` (osobní prostor nabídne sám).
- Má už prostor: zeptej se, co ho trápí, a vyber skill z tabulky.

## 3. Jak si práci zorganizovat (vysvětli, když se ptá nebo po základním nastavení)

Cowork má dvě úrovně: **vlevo** projekty a chaty (rozhovory), **vpravo / ve složce** soubory. Drž je ve stejné logice.

**Projekty (vlevo, skupiny):** jeden projekt = jedna oblast života nebo práce, ne jeden úkol. Např. „Firma“, „Klient Novák“, „Dům“, „Osobní“. Každý projekt má svou podsložku `projects/<nazev>/` a instrukce v souboru `PROJECT-INSTRUCTIONS.md`.

**Chaty uvnitř projektu:** jeden chat = jedno dlouhodobé téma, ne jedna otázka. Vrací se do něj. Doporučená jména:
- `(ZKRATKA) - Téma` - zkratka projektu v závorce, pak téma: `(FIRMA) - Daně`, `(DŮM) - Stavební povolení`. V seznamu se pak chaty řadí a poznáš je i ve výsledcích hledání.
- Číslo pro pořadí, když je chatů víc: `KLIENT - 0. Obecné`, `KLIENT - 1. Úkoly`, `KLIENT - 2. Dokumenty`.
- Opakované věci (ranní přehled, týdenní report) jako **naplánované úlohy** s jasným jménem: „Ranní přehled“, „Týdenní údržba“.
- Nejčastější 2-3 chaty **připni** nahoru.
- Krátký dotaz bez návaznosti klidně v novém chatu a pak ho smaž nebo nech zapadnout.

**Přejmenování chatu dělá člověk** v aplikaci (obvykle pravým tlačítkem / tři tečky u chatu → Přejmenovat). Claude chaty přejmenovat neumí, ale na požádání navrhne jméno podle konvence. Naplánovaným úlohám jméno Claude nastavit umí.

**Soubory (složka):**
```
CLAUDE COWORK/
├── O-MNE/            kdo jsem, jak píšu, cíle (čte Claude)
├── SABLONY/          osvědčené šablony
├── projects/<nazev>/ README, PROJECT-INSTRUCTIONS, outputs/, workshop/
├── inbox/            co přišlo a ještě není zařazené
├── _tmp/             dočasné, nemazat se nebojíme
└── archiv/           hotové a staré
```
Pojmenování souborů: `RRRR-MM-DD_protistrana_typ.pdf` (např. `2026-10-05_dodavatel-energie_smlouva.pdf`), podepsané `…-podepsany.pdf`. Bez hesel a čísel účtů v názvech. Bez mezer na konci, bez „final_final2“.

**Tři návyky:**
1. Než začneš, otevři chat ve **správném projektu** - pak Claude zná pravidla a ukládá na správné místo.
2. Když se něco povede: „Ulož to jako šablonu.“
3. Na konci delší práce: „Udělej předávku“ - příště se navazuje bez vysvětlování.

## 4. Kde najít víc
Dokumentace pro lidi: `docs/ZACNI-TADY.md` v repozitáři pluginu (GitHub) a PDF návod v `docs/`.
