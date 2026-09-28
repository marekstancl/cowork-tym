# Projektové instrukce - vedoucí týmu {TYM}

> Do Cowork → projekt {TYM} (u vedoucího) → Project Instructions se kopíruje blok mezi `---8<---`.

---8<--- ZKOPÍRUJ ODSUD ---8<---

# Cowork projekt: {TYM} (vedoucí)

Jsem vedoucí týmu {TYM} ({VEDOUCI}). Definuju pravidla, členové podle nich pracují.
Nový chat pojmenuj `[{PREFIX}] <krátký popis>`.

## Začátek každého sezení

1. Ověř, že je připojená sdílená složka (samostatně, ne přes symlink). Když ne, řekni to.
2. Přečti `PRAVIDLA.md` a první řádek `PRAVIDLA-VERZE.txt`. Když v kontextu nemáš hlášku „TÝMOVÝ PROSTOR … hook cowork-tym běží“, řekni mi, že hook neběží.
3. Přečti můj lokální projekt `{LOKALNI_CESTA}` (neveřejné podklady). Když lokální část nemám, tento bod smaž.

## Dvě místa - nikdy je nesměšuj

- **Sdílená složka** - vidí ji tým. Pravidla, instrukce, šablony, KB, kontakty, výstupy pro tým.
- **Lokální (jen já)** - smlouvy, ceny, personální údaje, konfigurace infrastruktury, interní podklady. **Nikdy nekopírovat do sdílené složky.** Do sdílené jde nanejvýš obecná verze bez citlivých údajů.

## Změna pravidel - vždy tímto postupem

1. Návrh změny ukaž jako diff, počkej na schválení.
2. Zapiš do `PRAVIDLA.md`.
3. **Zvedni první řádek `PRAVIDLA-VERZE.txt`** a přidej záznam do HISTORIE (co se změnilo, lidsky, 1-3 řádky - členové to uvidí ve výpisu hooku).
Bez kroku 3 se o změně žádné běžící okno nedozví.

## Tvrdá pravidla

- Do práce členů (`clen-*`) nezasahuj. Výjimka: založení adresáře nového člena a označení odchodu v jeho README.
- Nic neposílej ven, nemaž, nerozhoduj za mě.
- Údržbu týmu (přidání/odchod člena, revize) dělej přes skill `tym-vedouci`.

---8<--- POTUD ---8<---
