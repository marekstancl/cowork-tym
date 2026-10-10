---
name: stred-workspace
description: Nastaví "středobod" Cowork pracovního prostoru, aby byl stejný na více počítačích a zálohovaný - buď přes cloud (OneDrive, Google Drive, Dropbox), nebo přes vlastní stále běžící server (Syncthing, šifrovaná záloha, zrcadlo do cloudu). Uživateli nejdřív lidsky vysvětlí obě cesty a pomůže vybrat. Use when the user says "chci cowork na více počítačích", "kde má být workspace", "napoj workspace na server", "dej workspace do OneDrive", "zálohuj workspace", or "sync my cowork workspace".
---

# Středobod pracovního prostoru

> **Na začátku řekni uživateli (svými slovy, max. 4 věty):** Co udělám: zařídím, aby tvůj pracovní prostor byl stejný na více počítačích a zálohovaný - přes OneDrive/Google Drive, nebo přes vlastní server. Zabere to cloud 15 minut, server půl dne. Na konci budeš mít: složka se sama srovnává mezi počítači a nic se neztratí. Kdykoli můžeš přestat a pokračovat jindy - napiš „pokračuj".

Mluv bez IT žargonu, krátce. U kroků „**Děláš ty:**“ / „**Udělám já:**“. Rozhodnutí: téma lidsky + možnosti + doporučení + proč.

## 1. Vysvětli, o co jde (vlastními slovy, max. 6 vět)

> Tvůj pracovní prostor je obyčejná složka s soubory (`CLAUDE COWORK`). Dokud ji máš jen na jednom počítači, stačí. Když chceš pracovat i z druhého počítače, nebo mít jistotu, že o nic nepřijdeš, potřebuje složka **středobod**: místo, se kterým se všechny počítače srovnávají. Účet Claude sám složky mezi počítači nepřenáší. Přenáší chaty, projekty založené v aplikaci, pluginy a instrukce v Nastavení, ale ne tvoje soubory. Středobod můžou být dvě věci: **cloudové úložiště**, které už máš (OneDrive, Google Drive, Dropbox), nebo **vlastní server**, který běží pořád.

Ukaž schéma `references/schema.svg` (jako obrázek v artefaktu nebo ho popiš).

## 2. Pomoz vybrat

Zeptej se: Kolik počítačů? Má vlastní server (domácí server, NAS, VPS), který běží pořád? Používá OneDrive/Drive už teď? Jsou ve složce osobní dokumenty? Pracuje na dvou počítačích současně, nebo střídavě?

| | **A) Cloud jako středobod** | **B) Vlastní server** |
|---|---|---|
| Pro koho | většina lidí, 1-3 počítače, střídavá práce | kdo má server nebo NAS a chce plnou kontrolu |
| Co je potřeba | OneDrive / Google Drive / Dropbox, který už máš | server, VPN nebo místní síť, Claude Code na serveru |
| Práce na nastavení | 15 minut | půl dne (dělá Claude Code na serveru) |
| Konflikt (stejný soubor na dvou PC) | cloud vytvoří kopii s názvem počítače | vznikne kopie `.sync-conflict-…` |
| Smazaný soubor | koš cloudu (obvykle 30 dní) | verze na serveru + záloha s historií |
| Na mobilu | vidíš všechno v aplikaci cloudu | jen když se zapne zrcadlo do cloudu |
| Kde leží data | u poskytovatele cloudu | doma / na tvém serveru |
| Rizika | soubory „jen v cloudu“ (Cowork je nevidí), zpoždění synchronizace | údržba serveru je na tobě |

**Doporučení:** bez vlastního serveru **A**. S vlastním serverem, nebo když nechceš osobní dokumenty u cloudového poskytovatele, **B**.

## A) Cloud jako středobod

1. **Děláš ty:** přesuň složku `CLAUDE COWORK` do synchronizované složky cloudu (např. `OneDrive/CLAUDE COWORK`). Před tím zavři Cowork.
2. **Děláš ty (nejdůležitější):** u složky zapni **„Vždy ponechat na tomto zařízení“** (OneDrive) / „Dostupné offline“ (Google Drive) / „Zpřístupnit offline“ (Dropbox). Bez toho jsou soubory jen ikonky v cloudu a Cowork je nepřečte.
3. **Děláš ty:** v Coworku připoj složku z nového místa a u projektů změň připojenou složku.
4. **Udělám já:** ověřím, že čtu soubory (ne jen názvy), a do `CLAUDE.md` zapíšu pravidla níže.
5. Pravidla, která zapíšu:
   - Stejný soubor needitovat na dvou počítačích současně. Kopie s názvem počítače (např. `soubor-NOTEBOOK.md`) = konflikt: sloučit do původního, kopii smazat.
   - Po spuštění druhého počítače počkat, až cloud dosynchronizuje (ikonka), teprve pak pracovat.
   - Do cloudové složky nedávat git repozitáře a `node_modules` (cloud je rozbíjí) - ty patří mimo, např. do `~/projekty-kod`.
   - `_tmp/` se synchronizuje taky; co nemá jít do cloudu, dávej mimo pracovní složku.
6. **Ověření:** viz krok 4 v sekci B.

## B) Vlastní server

Technickou práci dělá **Claude Code na serveru**. Ty připravíš zadání, převedeš jeho otázky do lidské řeči a po dokončení upravíš instrukce.

1. **Zjisti:** OS serveru, kdo k němu má přístup, běží tam agenti nebo AI s e-mailem, dosah z PC (LAN/VPN), synchronizuje už něco workspace (Mutagen, rsync, cloud)? **Dva synchronizátory na jedné složce si přepisují soubory, nikdy současně.**
2. **Zadání:** vyplň `references/zadani-sablona.md`, ulož tam, kam server vidí. Uživatel na serveru napíše „proveď zadání <cesta>“.
3. **Rozhodnutí, která přijdou** (přelož a doporuč):
   | Téma | Typické doporučení | Proč |
   |---|---|---|
   | Kde složka na serveru bydlí | nechat, kde už je | bezpečnost dělají práva, ne název |
   | Přístup agentů / AI s e-mailem k osobním dokumentům | rozhoduje uživatel; minimum = pravidlo „nic z osobních ven bez výslovného pokynu“ v instrukcích serveru | agent na vlastním serveru už teď může skoro cokoli |
   | Záloha | šifrovaná, mimo dům, s historií (restic) | synchronizace smazání přenese, vrátit jde jen ze zálohy |
   | Zrcadlo do cloudu | jednosměrně server → cloud; s osobními dokumenty nebo bez (vědomě) | mobil × soukromí |
   | Šifrování disku | obvykle ne, chránit zálohy | po restartu by sync čekal na heslo |
   | Nástroj | **Syncthing** | aplikace s okénkem, konflikt = kopie, verze smazaných |
   Podmínky pro Syncthing: starý sync nejdřív zastavit; verze smazaných ≥ 30 dní; vypnout relaye a globální vyhledávání; ignorovat `.DS_Store`, `~$*`, `.git/index.lock`, `node_modules`, `/_tmp`, `.claude`, `.venv`.
4. **Po dokončení (Udělám já):** přečti předávku a přepiš instrukce workspace (`CLAUDE.md`, `STRUKTURA.md`, návody): čím se synchronizuje, co ne (`/_tmp` = jen tento počítač), konflikty `*.sync-conflict-*`, verze a záloha, zrcadlo jen ke čtení, kdo hlásí výpadek. Odstraň zmínky o starém nástroji.
5. **Ověření:** Syncthing (http://127.0.0.1:8384) ukazuje „Aktuální“ a server „Připojeno“; vytvořím `_test-sync.txt`, druhá strana ho potvrdí, smažu ho. Na macOS potřebuje Syncthing oprávnění **Místní síť** (Nastavení systému → Soukromí a zabezpečení).

Další počítač → skill `nove-pc`.
