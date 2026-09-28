# STRUKTURA workspace

Mapa a invarianty. Změna struktury = aktualizuj i tenhle soubor.

```
CLAUDE COWORK/
├── CLAUDE.md                 # vstupní bod pro agenta
├── STRUKTURA.md              # tento soubor
├── O-MNE/                    # ústava - čte se před každým úkolem
│   ├── agent-protocol.md
│   ├── about-me.md
│   ├── anti-ai-writing-style.md
│   ├── my-goals.md
│   └── tools/                # playbooky konektorů
├── projects/
│   └── general/              # catch-all + správce workspace (další projekty přidávej sem)
├── _tmp/                     # dočasné soubory (po 7 dnech do archiv/_tmp/)
├── archiv/                   # dumpy bez vlastníka
└── SABLONY/                  # globální šablony
```

## Struktura projektu

```
projects/<projekt>/
├── README.md                 # POVINNÉ - orientace pro mě
├── PROJECT-INSTRUCTIONS.md   # POVINNÉ - text do Cowork Project Instructions
├── outputs/                  # výstupy ven: _navrhy/, _interni/, <typ>/
├── clients/<slug>/           # card.md, working/, outputs/
└── workshop/                 # vše agentní
    ├── knowledge/            # fakta o firmě, formátovací pravidla, ceník, brand
    ├── templates/<kategorie>/
    ├── build/
    ├── internal/
    └── handoffs/(active, archive)/   # POVINNÉ
```

## Invarianty

1. Root projektu = jen 2 md + složky `outputs/`, `clients/`, `workshop/`.
2. Finální docx/pdf jen v `outputs/`, nikdy ve `working/`. V kořeni `outputs/` žádné volné soubory.
3. Každý projekt má `README.md`, `PROJECT-INSTRUCTIONS.md`, `workshop/handoffs/(active, archive)/`.
4. Složky lowercase-dash, bez mezer a diakritiky. Výjimka: kořen workspace (např. `CLAUDE COWORK`) a systémové složky `O-MNE/`, `SABLONY/`.
5. Žádný junk (`.~lock.*#`, `~$*`, prázdné složky mimo scaffold).
6. `_tmp_*` starší 7 dní patří do `archiv/_tmp/`.
