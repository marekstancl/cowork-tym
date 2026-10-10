# Zadání: Cowork workspace na serveru jako středobod

Zadal: {JMÉNO}, {DATUM}. Výsledek zdokumentuj.

## Cíl
Workspace `{CESTA_NA_MACU}` má na serveru stále běžící kopii, obousměrně synchronizovanou s počítači, šifrovaně zálohovanou s historií a jednou za hodinu jednosměrně zrcadlenou do {CLOUD} (`{NAZEV_ZRCADLA}`).

## Fakta k ověření (nespoléhej na ně, zjisti)
- Existuje už kopie workspace na serveru? Čím se synchronizuje?
- Velikost, počet souborů, diakritika (macOS NFD vs. Linux NFC).

## Kroky
1. **Bezpečnost (nejdřív, bez schválení dál nepokračuj):** kdo má přístup (účty, SSH klíče, kontejnery s mounty, agenti), co z workspace jde na web, zálohy, šifrování. Výstup: report v lidské řeči + rozhodnutí ve tvaru A/B + doporučení.
2. **Volba nástroje** (Syncthing doporučen) → rozhodnutí uživatele.
3. **Přechod:** starý sync zastavit, porovnat obě strany, zapnout nový. Ignorovat `.DS_Store`, `~$*`, `.git/index.lock`, `node_modules`, `/_tmp`, `.claude`, `.venv`. Verze smazaných ≥ 30 dní, relaye a globální vyhledávání vypnuté.
4. **Záloha** workspace do šifrované zálohy s historií (restic apod.).
5. **Zrcadlo** server → {CLOUD} každou hodinu (rclone); přihlášení ke cloudu udělá uživatel, připrav příkaz.
6. **Hlídání:** výpadek syncu/zálohy/zrcadla hlásit existujícím alertingem.
7. **Test:** změna oběma směry do minuty, diakritika, konflikt (vznikne kopie), smazání (verze).
8. **Dokumentace** + krátká **předávka** pro Cowork agenta (co platí na Macu, co se nesynchronizuje, konflikty, obnova, zrcadlo, další PC).

## Hranice
Nic na počítači uživatele nemaž. Při prvním převodu je zdrojem pravdy počítač uživatele. Příkazy se sudo připrav ke zkopírování. Při každé volbě A/B + doporučení.
