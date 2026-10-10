# Changelog

## 0.5.0 - 2026-10-10
- Mapa složek: `MAPA.md` v kostře workspace, pravidlo v `CLAUDE.md`, hlídač `hooks/mapa-check.sh` při startu okna hlásí složky chybějící v mapě (fail-open, potřebuje perl - na Macu i v Git Bash je).
- Sdílené skilly v týmu: `skilly/` ve sdílené složce (verze, přehled, postup „aktualizuj skilly“), hlídač při startu upozorní na novou verzi, instalaci potvrzuje člověk; vedoucí se při tvorbě skillu ptá „osobní, nebo pro tým?“.
- `skills/tym-vedouci/references/hooky-kdy-a-proc.md`: kdy hook ano, kdy ne a zásady psaní.
- Skill `pruvodce` (rozcestník): co plugin umí, kde začít, jak organizovat projekty, chaty a soubory a jak je pojmenovávat.
- Každý skill na začátku řekne, co udělá, jak dlouho to trvá a co bude výsledek.
- `docs/ZACNI-TADY.md`: návod pro běžné uživatele, odkaz z README.
- PDF návod 0.5: kapitoly D Organizace, E Nový projekt a převzetí dat, F Více počítačů, G Nový počítač.
- `bez-pluginu/C-dalsi-postupy/`: nové postupy i bez pluginu.
- Skill `novy-projekt`: založení projektu (pracovní / soukromý) a převzetí existujících dat po dávkách (inventura, revize jako artefakt, pravidla, duplicity, nestažené soubory, přesun s kontrolou). Poznatky z ostrého úklidu OneDrivu.
- Skill `stred-workspace`: středobod pro více počítačů - A) cloud (OneDrive/Drive/Dropbox), B) vlastní server (Syncthing, šifrovaná záloha, zrcadlo, hlídání); lidské vysvětlení, srovnání, šablona zadání pro Claude Code na serveru, schéma.
- Skill `nove-pc`: další/nový počítač - co se přenese přes účet Claude a co ne, synchronizace přes cloud nebo server, znovupřipojení projektů z `PROJECT-INSTRUCTIONS.md`.

## 0.4.0 - 2026-09-28
- Dvě vrstvy: tým je u vedoucího projekt v osobním prostoru (`projects/<tym>/` s `outputs/_interni/` pro neveřejné věci). Průvodce vedoucího nabídne nejdřív osobní prostor, průvodce člena ho nabídne volitelně.
- Šablona `SABLONY/tymovy-projekt.md`.
- README: schéma vrstev, kdo co vidí, co je v souborech, jak s tím pracovat.

## 0.3.0 - 2026-09-28
- Varianta bez pluginu (`bez-pluginu/`): stejné instrukce jako obyčejné soubory + ruční návod.
- Ruční instalátor hlídače funguje i mimo plugin.
- PDF návod pro uživatele (`docs/`), návod pro lidi `docs/ZACNI-TADY.md`.

## 0.2.1 - 2026-09-28
- Hlídač: výjimka pro vlastní změnu verze jen při zápisu přímo do PRAVIDLA-VERZE.txt (zmínka v příkazu už hlídání nevypne).
- Hlídač: paměť „nic nenalezeno“ na 10 minut, mělké prohledávání písmen disků.
- Test hlídače u člena v novém okně projektu, návod pro externisty s OneDrive.

## 0.2.0 - 2026-09-28
- Windows: Google Drive G:, OneDrive, BOM a CRLF, Git Bash/WSL cesty, přenositelné pro BSD sed (macOS).
- Hlídač hlídá i shell, nezastaví vlastní změnu vedoucího, výpadek je vidět v každém okně.
- Vzor člena z pluginu, instrukce pro každého člena zvlášť, kontrola nevyplněných hodnot.
- Návody „klikni sem“ pro Mac a Windows, složky bez diakritiky, volitelné osobní preference.

## 0.1.0 - 2026-09-27
- První verze: skilly zakladni-nastaveni, tym-vedouci, tym-clen, hooky.
