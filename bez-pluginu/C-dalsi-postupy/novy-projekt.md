---
name: novy-projekt
description: Založí nový projekt v Cowork pracovním prostoru (pracovní, soukromý nebo týmový) se složkami, instrukcemi a předávkami, a když má uživatel existující data (OneDrive, Google Drive, Dokumenty), provede jejich revizi, úklid a převzetí do projektu po dávkách. Use when the user says "založ projekt", "nový projekt", "chci projekt na …", "převezmi moje soubory/OneDrive do coworku", "uklidit OneDrive/Disk", or "set up a new project".
---

# Nový projekt

> **Na začátku řekni uživateli (svými slovy, max. 4 věty):** Co udělám: založím nový projekt (klient, zakázka, domácnost…) se složkami a instrukcemi. Když už k tomu máš soubory (OneDrive, Disk), pomůžu je uklidit a převzít. Zabere to 10 minut; s převzetím dat hodiny až dny po dávkách. Na konci budeš mít: projekt v Coworku + složka, kde má každý dokument jasné místo. Kdykoli můžeš přestat a pokračovat jindy - napiš „pokračuj".

Mluv jazykem uživatele, krátce, bez IT žargonu. U každého kroku „**Děláš ty:**“ / „**Udělám já:**“. Rozhodnutí předkládej vždy ve tvaru: téma lidsky + možnosti + doporučení + proč.

## 0. Co za projekt to je

Zeptej se (AskUserQuestion):
- **Pracovní** (klient, zakázka, produkt) → `projects/<nazev>/` podle kostry General.
- **Soukromý** (domácnost, nemovitosti, finance, úřady) → `projects/osobni/` nebo jiný název. Pozor na hranici: *vystavil bych na to fakturu, nebo mi ji někdo vystavil?* Když ano, je to pracovní.
- **Týmový** (pracuje v něm i někdo další) → skill `tym-vedouci`.

A druhá otázka: **Má už k tomu někde soubory?** Když ano, po založení pokračuj sekcí B.

## A. Založení

**Udělám já:** vytvoř (nic nepřepisuj):
```
projects/<nazev>/
├── README.md                 co projekt je, hranice, kde co je
├── PROJECT-INSTRUCTIONS.md   text pro pole instrukcí v Cowork projektu
├── outputs/_navrhy/          rozpracované
└── workshop/
    ├── handoffs/active/  handoffs/archive/
    ├── plany-presunu/        (jen když se přebírají data)
    └── log.md                co se kdy změnilo
```
`PROJECT-INSTRUCTIONS.md` obsahuje: co projekt je a co do něj nepatří, kde jsou data, pravidla ukládání a pojmenování (`RRRR-MM-DD_protistrana_typ.pdf`), bezpečnost. U soukromého projektu navíc: *z projektu nic neposílej ven (e-mail, chat, web) bez výslovného pokynu; hesla a čísla účtů nikdy v názvech souborů ani v chatu.*

**Udělám já:** zapiš projekt do `MAPA.md` v kořeni workspace (k čemu, co patří, co ne, citlivost); u projektu s vlastní strukturou dat přidej řádek `<!-- HLOUBKA projects/<nazev>: 2 -->` a jeho podsložky.

**Děláš ty:** v Coworku založ projekt, připoj **celou** pracovní složku a vlož instrukce (ukážu je v bloku kódu). **Ověření:** v novém chatu projektu se zeptej „k čemu je tenhle projekt a kam ukládáš soubory?“ - odpověď musí citovat instrukce.

## B. Převzetí existujících dat

Přečti `references/prevzeti-dat-poznatky.md` (14 poznatků z ostrého provozu). Postup:

1. **Přístup.** Řekni přesně, které složky vidíš a které ne. Nic nenavrhuj, dokud data nevidíš. Chybějící složku si vyžádej (připojení složky).
2. **Inventura (jen čtení).** Počty a objemy po složkách do 3. úrovně, soubory jen v cloudu (nestažené), duplicity podle obsahu (hash), shoda s tím, co už je ve workspace, velké soubory, balast (.url, .bak, .DS_Store, zámky `~$`), **citlivé věci v názvech** (hesla, čísla účtů), export hesel nebo přístupové údaje ležící volně.
3. **Revize jako artefakt.** Dlaždice s čísly, tabulka po oblastech (nechat / přesunout / archiv / smazat), strom dnes → návrh, tabulka „kde jsou dnes dokumenty k X“. Otázky na **vztahy** („čí je ta nemovitost?“), ne na složky.
4. **Pravidla.** `PRAVIDLA.md`: hlavní složky, rozhodovací otázka, archiv v každé oblasti, duplicity do `Archiv/_duplicity-<rok>-<měsíc>/` a smazat po měsíci, pojmenování. U majitele nemovitostí pravidlo **nemovitost × osoba**: co patří jednomu domu → `Domov/<nemovitost>/`, co osobě nebo se podává za vše dohromady (daně, banky) → `Finance/`.
5. **Dávky.** Po oblastech (např. jeden projekt, Finance, Domov, Dokumenty). Před každou dávkou plán do `workshop/plany-presunu/`, po schválení provést **`mv -n`** (nikdy nepřepisovat), mazat jen se souhlasem a jen ověřené duplicity, zapsat do `log.md`, krátce shrnout. Duplicitu „potvrzení k přiznání 2018 a 2019“ nesmaž: stejný soubor může patřit do dvou let.
6. **Nestažené soubory.** Před přesunem musí být všechno stažené. Když „Vždy ponechat na zařízení“ nezabere, stáhni je po dávkách sám (načtení souboru přes nástroj ho stáhne) - předem řekni kolik a jak velké.
7. **Přejmenování až na konec** (např. bez podtržítek), pak `INDEX.md` („hledáš X → je v Y“).
8. **Přesun do projektu** (když to uživatel chce): kopie po složkách s kontrolou velikosti každého souboru, teprve pak smazat zdroj. Velká videa a podobné zvaž nechat v cloudu. Do původního místa dej `PRESUNUTO-DO-COWORKU.md`.
9. **Závěrečný report jako artefakt.** Struktura, rozhodnutí, bezpečnost, co zbývá (s daty).

## Na co si dát pozor
- Netvrď nic o obsahu dokumentu, který jsi nepřečetl (sken bez textu) - řekni, že vycházíš z názvu.
- Cloudové aplikace někdy smazané soubory obnoví; ověř po synchronizaci.
- Synchronizační nástroj (OneDrive, Syncthing) potřebuje čas; po větší změně počkej a zkontroluj.
