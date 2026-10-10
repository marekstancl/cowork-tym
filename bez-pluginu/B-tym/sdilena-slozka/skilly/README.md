# Sdílené skilly

Skill = návod, který si Claude otevře sám, když na danou věc přijde řeč. Zdroj pravdy je tahle složka: `skilly/<nazev>/SKILL.md`, verze celé sady je na prvním řádku `VERZE.txt` (zvyšuje vedoucí).

Hlídač při startu okna porovná verzi se značkou na tvém počítači a když se liší, napíše: *„napiš: aktualizuj skilly“*. Instalaci vždy potvrzuje člověk.

## Aktualizuj skilly (postup pro agenta)
1. Přečti `VERZE.txt` a `INDEX.md`.
2. Pro nové nebo změněné skilly nabídni uživateli uložení skillu (karta „Uložit skill“ / návrh skillu) s obsahem `skilly/<nazev>/SKILL.md` beze změn.
3. Když potvrdí všechny, zapiš číslo verze do souboru značky, který uvedl hlídač. Když něco odmítne, verzi nezapisuj.
4. Když karta pro uložení skillu není k dispozici: nabídni ruční nahrání v Nastavení aplikace Claude → Skilly (název se může lišit).
5. Skill na svém počítači needituj, změnu navrhni vedoucímu.

Vedoucí: u sebe zapiš do značky slovo `vlastnik`, ať upozornění nechodí. Ve skillech nikdy hesla, přístupy ani osobní údaje.
