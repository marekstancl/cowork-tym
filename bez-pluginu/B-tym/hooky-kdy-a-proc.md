# Hooky: kdy dávají smysl a proč

Hook (v návodech „hlídač“) je malý skript, který spouští aplikace sama v určitou chvíli - při startu okna nebo před zápisem. Agent ho nemůže přehlédnout ani „zapomenout“. Proto se hodí jen na věci, které **musí platit vždy**.

## Co dělá hlídač v cowork-tym
| Kdy | Co | Proč |
|---|---|---|
| Start okna | zjistí verzi pravidel, otiskne si ji pro sezení, řekne agentovi, co přečíst | okno může běžet dny; agent musí začít s platnými pravidly |
| Start okna | porovná verzi sdílených skillů s tím, co je na počítači, a případně vyzve „aktualizuj skilly“ | skilly se instalují do účtu člověka, sám se o změně nedozví |
| Před zápisem (soubor, příkaz, zápis do nástroje) | když se mezitím změnila verze pravidel, zápis jednou zastaví a pošle agenta přečíst pravidla | změna pravidel musí platit hned, ne až v novém okně |
| Kdykoli selže | nic neblokuje, jen ohlásí, že neběží | hlídač nesmí zastavit práci kvůli vlastní chybě |
| Mimo týmovou složku | mlčí (zapne se jen u složky se značkou `COWORK-TYM`) | nesmí rušit jiné projekty |

## Kdy hook ano
- Kontrola, kterou agent nesmí vynechat: verze pravidel, zápis jen do povolené složky, upozornění na novou verzi skillů nebo šablon.
- Odpověď je ano/ne a dá se zjistit ze souborů za zlomek sekundy.

## Kdy hook ne
- Rozhodnutí a dialog („je tenhle skill osobní, nebo pro tým?“) - to patří do instrukcí projektu, agent se zeptá.
- Věci, které stačí jednou říct v instrukcích (styl psaní, pojmenování).
- Cokoli pomalého, síťového nebo s riziky (stahování, instalace, mazání).

## Zásady pro psaní hooku
1. **Fail-open:** při jakékoli chybě skončit tiše (`trap 'exit 0' EXIT`).
2. **Blokovat jen jednou** - po zastavení si posunout otisk, ať nevznikne smyčka.
3. **Lidská věta**, ne technický výpis: co se stalo a co má agent / člověk udělat.
4. **Jeden zdroj pravdy** (soubor ve sdílené složce), hook jen porovnává.
5. **Rychlost:** žádná síť, hledání souborů s omezenou hloubkou, paměť nalezené cesty.
6. **Přenositelnost:** Mac i Windows (Git Bash), BOM a konce řádků z cloudových disků.
