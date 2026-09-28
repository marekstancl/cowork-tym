# Šablona - týmový projekt (vedoucí)

Když řídíš lidi přes sdílenou složku (plugin `cowork-tym`, skill `tym-vedouci`), je tým jedním z tvých projektů. Založí ho agent vedoucího; tady je jen vzor, ať víš, co kde je.

```
CLAUDE COWORK/                        (osobní prostor - jen ty)
├── O-MNE/ …                          tvůj profil a pravidla pro agenta
└── projects/
    └── <tym>/
        ├── README.md                 co je tým, kdo v něm je, kde je sdílená složka
        ├── PROJECT-INSTRUCTIONS.md   text do instrukcí Cowork projektu (vedoucí)
        ├── outputs/
        │   └── _interni/             smlouvy, ceny, personální věci - NIKDY do sdílené složky
        └── workshop/handoffs/{active,archive}/

<cloudový disk>/_TYM-<nazev>/         (sdílená složka - ty + členové)
├── PRAVIDLA.md, PRAVIDLA-VERZE.txt
├── instrukce/, sablony/, kb/, lide/, vedouci/
└── clen-<jmeno>/                     práce člena
```

V Coworku má projekt `<tym>` připojené **dvě složky**: osobní prostor (celý) a sdílenou složku (samostatně, ne přes zkratku).

Pravidlo: co vidí tým, je ve sdílené složce. Co nesmí vidět, je v `projects/<tym>/outputs/_interni/`. Nic se mezi nimi nekopíruje, maximálně obecná verze bez citlivých údajů.
