# Údržba týmového prostoru

## Změna pravidel

1. Zjisti od vedoucího, co se mění. Ukaž diff `PRAVIDLA.md`, počkej na schválení.
2. Zapiš změnu.
3. Zvedni 1. řádek `PRAVIDLA-VERZE.txt`: dnešní datum `RRRR-MM-DD` + další písmeno (`-a`, `-b`...; po `-z` pokračuj `-z2`). Zapisuj jako UTF-8 bez BOM. Tvoje vlastní okno kvůli této změně hlídač nezastaví.
4. Pod `HISTORIE` přidej nahoru záznam: verze + 1-3 řádky lidsky, co se změnilo. Tohle uvidí agenti členů při odmítnutí.
5. Když se mění i struktura nebo instrukce, uprav `instrukce/` a řekni vedoucímu, zda je nutné, aby členové znovu vložili Project Instructions (jen když se změnil blok v `PROJECT-INSTRUCTIONS-clen.md`).

## Přidání člena

1. Údaje: jméno, slug, zaměstnanec/externista, nástroje.
2. **Udělám já:** zkopíruj vzor z pluginu `${CLAUDE_PLUGIN_ROOT}/skills/tym-vedouci/assets/sablona-slozky/clen-VZOR/` jako `clen-<slug>/` (ve sdílené složce vzor není) a vyplň jméno. Přidej do `lide/kontakty.md`. Z obecného `instrukce/PROJECT-INSTRUCTIONS-clen.md` vytvoř `instrukce/PROJECT-INSTRUCTIONS-<slug>.md`. Zkontroluj, že nezůstalo `{`.
3. **Děláš ty:** nasdílej složku (úpravy), pozvi do nástrojů, zřiď přístupy (externista časově omezeně), pošli plugin a předávací zprávu (připravím).
4. Zvedni verzi pravidel jen pokud se měnila pravidla.

## Odchod člena

**Děláš ty:** odeber sdílení složky, odeber z nástrojů, zruš účty, vyžádej potvrzení o smazání lokálních kopií.
**Udělám já:** adresář `clen-<slug>/` **nemaž** - je to jeho práce pro nástupce. Označ ho v README jako ukončený (datum), odeber z `lide/kontakty.md` nebo označ „odešel".

## Revize (měsíčně/kvartálně)

Projdi a nahlas (nic neopravuj potichu):
- duplikáty `(1)`, soubory mimo strukturu, prázdné/zapomenuté `_tmp/`,
- `NEDOKONCENE-ZAPISY.md` s visícím `ČEKÁ`,
- `VYJIMKY.md` - které výjimky by měly být pravidlem,
- citlivé údaje ve sdílené složce (hesla, IP, ceny) - zastav a flagni,
- rozpor mezi `PRAVIDLA.md` a `instrukce/`.
