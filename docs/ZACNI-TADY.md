# Začni tady

Tohle je návod pro lidi, ne pro programátory. Za 5 minut víš, co plugin dělá a jak začít.

## Co to je

**Claude Cowork** je část aplikace Claude, kde Claude pracuje s tvými soubory: čte je, píše, třídí, připravuje dokumenty. Bez pořádku se ale rychle ztratíš - chaty se množí, soubory leží všude a Claude pokaždé začíná od nuly.

Plugin **cowork-tym** tě provede nastavením, po kterém:
- máš **jednu složku** na veškerou práci a v ní jasný pořádek,
- Claude **ví, kdo jsi** a jak pracuješ, a nemusíš to opakovat,
- každá oblast (firma, klient, domácnost) má **vlastní projekt** s pravidly,
- volitelně: **tým** (zadáváš práci lidem), **více počítačů**, **záloha**.

## Jak začít (3 kroky)

1. **Nainstaluj plugin** - v aplikaci Claude v části Pluginy přidej `marekstancl/cowork-tym` a nainstaluj. Pak aplikaci úplně zavři a otevři znovu.
2. **Otevři nový chat v Coworku** a napiš: **„Jak začít?“**
3. Průvodce se zeptá na 2-3 věci a provede tě krok za krokem. U každého kroku uvidíš, co děláš **ty** a co udělá **Claude**.

## Co můžeš napsat

| Chci… | Napiš |
|---|---|
| vědět, co plugin umí | „Jak začít?“ |
| mít v Coworku pořádek | „Nastav mi Cowork“ |
| nový projekt nebo uklidit soubory z OneDrivu | „Založ projekt Dům“ / „Převezmi moje soubory z OneDrivu“ |
| pracovat z více počítačů, zálohu | „Chci Cowork na dvou počítačích“ |
| připojit nový počítač | „Přecházím na nový počítač“ |
| zadávat práci lidem | „Chci řídit externisty v Coworku“ |
| připojit se k týmu, kam mě pozvali | „Jsem nový člen týmu“ |

## Jak si to zorganizovat

**Vlevo (projekty a chaty):**
- Projekt = oblast: „Firma“, „Klient Novák“, „Dům“, „Osobní“.
- Chat = dlouhodobé téma, do kterého se vracíš. Pojmenuj ho `(ZKRATKA) - Téma`, třeba `(DŮM) - Stavební povolení`. Víc chatů očísluj: `NOVÁK - 0. Obecné`, `NOVÁK - 1. Úkoly`.
- Nejpoužívanější chaty připni. Opakované věci (ranní přehled) nech běžet jako naplánované úlohy.
- Chat přejmenuješ ty (pravé tlačítko nebo tři tečky → Přejmenovat). Claude ti jméno rád navrhne.

**Vpravo (soubory ve složce `CLAUDE COWORK`):**
```
O-MNE/       kdo jsem, jak píšu
projects/    jedna podsložka na projekt
inbox/       co přišlo a není zařazené
archiv/      hotové a staré
```
Soubory pojmenovávej `RRRR-MM-DD_kdo_co.pdf`, např. `2026-10-05_dodavatel-energie_smlouva.pdf`.

**Tři návyky:**
1. Pracuj vždy v chatu **ve správném projektu**.
2. Povedený výsledek: „Ulož to jako šablonu.“
3. Konec delší práce: „Udělej předávku.“

## Časté otázky

**Přenese se to na nový počítač?** Historie chatů, pluginy a instrukce v Nastavení jsou v účtu Claude a přenesou se samy. Složku se soubory je potřeba synchronizovat - napiš „Přecházím na nový počítač“.

**Vidí Claude všechny moje soubory?** Jen ve složkách, které mu v aplikaci připojíš.

**Je to zdarma?** Plugin ano (licence v `LICENSE`). Cowork je součástí placených plánů Claude.

**Něco nefunguje.** Napiš Claudovi, co vidíš na obrazovce, nebo pošli snímek. Průvodci nevymýšlejí, když něco nenajdou - zeptají se.

Podrobný návod: [cowork-tym-navod.pdf](cowork-tym-navod.pdf).
