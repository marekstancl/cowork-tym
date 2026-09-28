# Základní nastavení Coworku - návod pro člověka

Tenhle průvodce je kostra pracovního prostoru pro Claude Cowork ověřená z praxe. Díky ní Claude ví, kdo jsi, píše tvým hlasem, ukládá věci tam, kde je čekáš, a mezi okny si předává rozpracovanou práci. První nastavení zabere 30-45 minut.

## Co potřebuješ

- Claude desktop (Mac/Windows) s placeným plánem (Pro nebo vyšší), režim Cowork.
- 1-3 vlastní texty (e-mail, příspěvek, report), podle kterých se doladí styl psaní.
- 30-45 minut bez vyrušení.

## Krok 1 - složka

1. Vytvoř prázdnou složku `CLAUDE COWORK` ve své domovské složce (Mac: složka s domečkem ve Finderu; Windows: `C:\Users\<tvoje jméno>\`, **ne** v OneDrive / Dokumentech / na Ploše).
2. Připoj ji v Coworku. Strukturu uvnitř vytvoří agent.
3. Nemaž prázdné složky ani soubory `.gitkeep` - drží strukturu. Mapa je v `STRUKTURA.md`.

## Krok 2 - soubory o tobě (`O-MNE/`)

Tohle je „ústava", Claude ji čte před každým úkolem.

| Soubor | Co s ním |
|---|---|
| `agent-protocol.md` | Závazná pravidla pro agenta. Pravidla pro agenta. Agent s tebou projde, které volitelné body chceš. |
| `about-me.md` | Tvůj profil. Agent ti položí pár otázek a vyplní ho. |
| `anti-ai-writing-style.md` | Jak nepsat. Použitelný rovnou. Příklad „ANO" v sekci 6 nahraď svým textem. |
| `my-goals.md` | Kvartální cíle. Vyplň aspoň 3 cíle. |
| `tools/` | Sem časem přidáš návody k připojeným nástrojům (Gmail, kalendář, úkolovník...). Zatím prázdné. |

Rada: nesnaž se napoprvé o dokonalost. Pět odstavců v `about-me.md` stačí, doplňuje se za pochodu.

## Krok 3 - globální instrukce

V nastavení aplikace Claude najdi část pro Cowork a pole pro globální instrukce (názvy se mezi verzemi mění; agent ti pomůže podle toho, co vidíš). Vlož text, který ti agent ukáže (už s tvým jménem).

## Krok 4 - Cowork projekty

Doporučený model: pro každou oblast (práce, podnikání, domácnost...) vlastní Cowork projekt. Každý projekt = podsložka `projects/<nazev>/` s vlastními instrukcemi. V balíčku je připravený první projekt `general` (catch-all + správce workspace).

1. V Coworku vytvoř nový projekt „General".
2. Jako pracovní složku vyber `CLAUDE COWORK` (celý workspace, ať Claude vidí i `O-MNE/`).
3. Do **Project Instructions** vlož obsah `projects/general/PROJECT-INSTRUCTIONS.md`.
4. Otestuj v novém chatu: *„Znáš pravidla a víš, jakému projektu patříš?"* Musí odpovědět konkrétně.

Další projekty zakládej podle `SABLONY/cowork-project-instructions.md` (návod je uvnitř).

## Krok 5 - návyky, které dělají rozdíl

- **Šablony.** Když se výstup povede: *„Ulož to jako šablonu do SABLONY/. Strukturu zachovej, obsah smaž."* Příště: *„Použij šablonu X."*
- **Handoffy.** Před koncem dlouhé práce: *„Udělej handoff."* Claude napíše stav do `workshop/handoffs/active/`, další okno na něj naváže.
- **Anti-AI seznam.** Kdykoli Claude napíše frázi, která zní jako AI, přidej ji do `anti-ai-writing-style.md`.
- **Paměť.** Zapni v nastavení Claude paměť (nastavení aplikace (paměť)). Trvalé preference (jak chceš dostávat výstupy, v jakém tónu) Claudovi prostě řekni, zapamatuje si je napříč chaty.
- **Konektory.** nastavení aplikace (část pro připojené aplikace / konektory): připoj, co používáš (Gmail, Google Calendar, Google Drive...). Pro každý nástroj, se kterým pracuješ často, si nech napsat playbook do `O-MNE/tools/`.
- **Kvartální revize.** Jednou za kvartál projdi `O-MNE/` a aktualizuj cíle.

## Rozšíření

Chceš řídit zaměstnance nebo externisty přes sdílenou složku? Použij skill `tym-vedouci` z tohoto pluginu.
