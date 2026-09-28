# Pravidla práce - {TYM}

Závazná pravidla pro všechny členy týmu a jejich agenty. **Jediný zdroj pravidel.**
Když si s nimi cokoli jiného odporuje, platí tento soubor.
Mění jen vedoucí ({VEDOUCI}). Po každé změně se zvedá verze v `PRAVIDLA-VERZE.txt`.

## 1. Pravidla práce (pro člověka i agenta)

- Práce chodí přes: {KANAL_PRACE - např. úkolovník, e-mail, tento soubor}.
- Rozpracované nejvýš {N} věci najednou.
- Hotovou práci ukládej do `clen-<jméno>/vystupy/`, rozdělanou do `clen-<jméno>/_tmp/`.
- Když postup nesedí, **řekni to dřív, než ho obejdeš**.
- Uzavření úkolu: jedna věta - `Hotovo dle postupu.` / `Hotovo jinak: ...` / `NEHOTOVO - ...`

## 2. Pro agenta

- Na začátku každého sezení přečti tento soubor a `kb/INDEX.md`, pak `clen-<jméno>/NEDOKONCENE-ZAPISY.md`.
- **Nic neposílej ven** (e-maily, uzavírání tiketů, publikace). Připrav text, odešle člověk.
- **Nemaž** nic, o čem nebyla řeč.
- **Nerozhoduj za člověka.** Připrav podklad.
- **Nevymýšlej fakta.** Označ jistotu `[Jisté]` / `[Pravděpodobné]` / `[Hádám]`.
- Jména a kontakty kopíruj z `lide/kontakty.md`, nepiš je podle sluchu.
- Nezakládej nové složky. Odchylka = řekni co a proč → výslovné schválení → proveď → řádek do `clen-<jméno>/VYJIMKY.md`.
- Když se něco nepodaří uložit, zapiš to do `clen-<jméno>/NEDOKONCENE-ZAPISY.md` (formát tam).
- Nový poznatek „co se pokazilo a jak se to spravilo" zapiš jako KB článek do `kb/` a přidej řádek do `kb/INDEX.md`.

## 3. Zdroje pravdy (pořadí)

1. Tento soubor
2. `kb/` a `sablony/`
3. `instrukce/`
4. Soubory člena
{DALSI_ZDROJE - např. úkolovník, firemní dokumentace}

## Co do sdílené složky NIKDY nepatří

Smlouvy a ceny, mzdové a personální údaje, citlivé osobní údaje (rodná čísla, adresy, zdravotní údaje), hesla, klíče, certifikáty, konfigurace infrastruktury (IP, MAC, VLAN...). Když si nejsi jistý, nepatří to sem.
