# Architektura týmového prostoru

## Obrázek

```
CLOUDOVÝ DISK (vlastní vedoucí, sdílí s členy)
└── sdílená složka/
    ├── PRAVIDLA-VERZE.txt   1. řádek = verze, čtou ji hooky
    ├── PRAVIDLA.md          jediný zdroj pravidel
    ├── instrukce/  sablony/  kb/  lide/  vedouci/
    └── clen-<jméno>/        celý pracovní adresář člena

LOKÁLNĚ U VEDOUCÍHO (nesdílené)
└── smlouvy, ceny, interní podklady, konfigurace

KAŽDÝ POČÍTAČ
└── Cowork + plugin cowork-tym (hooky) + projekt s Project Instructions
```

## Proč takhle

- **Pravidla na jednom místě.** Project Instructions obsahují jen pokyn „na začátku sezení přečti PRAVIDLA.md". Když vedoucí změní pravidla, nikdo nic znovu nevkládá - další okno je má.
- **Verze hlídaná hookem, ne instrukcí.** Okno může běžet dny. Instrukci agent přehlédne, hook ne: při první zápisové akci po změně ji jednou odmítne a vypíše, co se změnilo. Otisk se hned zvedne, takže druhý pokus projde - žádná smyčka. Fail-open: když cokoli chybí, hook mlčí.
- **Práce člena ve sdílené složce, ne u něj.** Po odchodu zůstává kompletní práce týmu, odvolání přístupu je jedno kliknutí.
- **Citlivé věci jen lokálně u vedoucího.** Sdílená složka se synchronizuje na cizí počítače.
- **Výjimky se zapisují.** Odchylka bez zápisu se do půl roku stane nepsaným pravidlem.
- **Nedokončené zápisy.** Agent nemá paměť mezi sezeními - co se nepovedlo uložit, musí být v souboru, jinak se to ztratí.

## Známá omezení

- Disk musí být **offline/zrcadlený**. Ve streamu vidí Cowork složku prázdnou.
- **Symlink do Coworku nefunguje** - sdílenou složku připoj samostatně.
- **Konflikty:** současná úprava stejného souboru vyrobí duplikát `soubor (1)`. Jeden soubor = jeden člověk najednou.
- Když disk vlastní soukromý účet vedoucího, firma na data po jeho odchodu nedosáhne. Pro firmy doporuč firemní tenant.
- Hooky z pluginu: pokud prostředí hooky pluginu nespouští, je záložní ruční instalace (`assets/rucni-instalace-hooku/`).
- Windows: hooky jsou bash skripty - potřebují Git for Windows. Hledají sdílenou složku i na písmenech disků (Google Drive `G:`).
- Hlídač kontroluje zápisy souborů, příkazy v shellu a zapisující akce konektorů. Je to pojistka proti přehlédnutí, ne bezpečnostní zámek - člověka ani odhodlaného agenta nezastaví.
- Víc týmových složek na jednom počítači: hlídač bere tu z připojené složky okna, jinak první nalezenou. Pevnou cestu lze nastavit ručním instalátorem.
