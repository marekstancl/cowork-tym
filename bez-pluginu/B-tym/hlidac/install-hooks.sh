#!/bin/bash
# Záložní ruční instalace hooků cowork-tym do ~/.claude - jen když prostředí
# nespouští hooky z pluginu. macOS: Terminál. Windows: Git Bash.
# Zazálohuje settings.json, sloučí jen klíč "hooks", ověří JSON.
# Volitelně: bash install-hooks.sh "<cesta k PRAVIDLA-VERZE.txt>"  -> zapíše ruční cestu.
set -u
RUCNI_CESTA="${1:-}"
HERE="$(cd "$(dirname "$0")" && pwd)"
if [ -f "$HERE/pre-write.sh" ]; then SRC="$HERE"            # varianta bez pluginu: skripty vedle
else SRC="$(cd "$HERE/../../../../hooks" 2>/dev/null && pwd)"; fi  # uvnitř pluginu
[ -n "$SRC" ] && [ -f "$SRC/pre-write.sh" ] || { echo "CHYBA: nenašel jsem složku hooks pluginu."; exit 1; }
DST="$HOME/.claude/hooks/cowork-tym"
S="$HOME/.claude/settings.json"

# Interpret pro sloučení JSON: node, python3, python, py -3 (každý ověřený spuštěním;
# na Windows "python3" bývá jen zástupce Microsoft Store, který nic neudělá).
RUN=""
for c in "node" "python3" "python" "py -3"; do
  set -- $c; command -v "$1" >/dev/null 2>&1 || continue
  if [ "$1" = node ]; then node -e 'process.exit(0)' >/dev/null 2>&1 && { RUN="node"; break; }
  else $c -c 'print(1)' >/dev/null 2>&1 && { RUN="$c"; break; }; fi
done
[ -n "$RUN" ] || { echo "CHYBA: chybí node i python. Nainstaluj Python z python.org (Windows: zaškrtni 'Add to PATH') a spusť znovu."; exit 1; }

mkdir -p "$DST" && cp "$SRC"/common.sh "$SRC"/session-start.sh "$SRC"/pre-write.sh "$SRC"/mapa-check.sh "$DST/" && chmod +x "$DST"/*.sh || exit 1
echo "Hooky zkopírovány do $DST"
if [ -f "$S" ]; then B="$S.zaloha-$(date +%Y%m%d-%H%M%S)"; cp "$S" "$B" && echo "Záloha: $B"; else mkdir -p "$HOME/.claude"; printf '{}\n' > "$S"; fi

CMDDST="$DST"; command -v cygpath >/dev/null 2>&1 && CMDDST="$(cygpath -m "$DST")"
if [ "$RUN" = node ]; then
node - "$S" "$CMDDST" "$SRC/hooks.json" <<'JS'
const fs=require('fs');const [,,t,dst,hj]=process.argv;let cur;
try{cur=JSON.parse(fs.readFileSync(t,'utf8').replace(/^﻿/,'')||'{}')}catch(e){console.log('CHYBA: settings.json není validní JSON, nic neměním.');process.exit(1)}
const snip=JSON.parse(fs.readFileSync(hj,'utf8')).hooks;cur.hooks=cur.hooks||{};
for(const [e,a] of Object.entries(snip)){const arr=JSON.parse(JSON.stringify(a).split('${CLAUDE_PLUGIN_ROOT}/hooks').join(dst));
 const ex=cur.hooks[e]||[];if(JSON.stringify(ex).includes('cowork-tym')){console.log('Přeskakuju '+e+' - už tam je.');continue}
 cur.hooks[e]=ex.concat(arr);console.log('Přidáno: '+e)}
const out=JSON.stringify(cur,null,2);JSON.parse(out);fs.writeFileSync(t,out+'\n','utf8');
JS
else
$RUN - "$S" "$CMDDST" "$SRC/hooks.json" <<'PY'
import json,sys,io
t,dst,hj=sys.argv[1:4]
try: cur=json.loads(io.open(t,encoding='utf-8-sig').read() or '{}')
except Exception as e: print('CHYBA: settings.json není validní JSON, nic neměním.'); sys.exit(1)
snip=json.load(io.open(hj,encoding='utf-8'))['hooks']; cur.setdefault('hooks',{})
for e,a in snip.items():
    a=json.loads(json.dumps(a).replace('${CLAUDE_PLUGIN_ROOT}/hooks',dst)); ex=cur['hooks'].get(e,[])
    if 'cowork-tym' in json.dumps(ex): print('Přeskakuju',e,'- už tam je.'); continue
    cur['hooks'][e]=ex+a; print('Přidáno:',e)
out=json.dumps(cur,ensure_ascii=False,indent=2); json.loads(out); io.open(t,'w',encoding='utf-8').write(out+'\n')
PY
fi
RC=$?
[ $RC -eq 0 ] || { echo "Nic se nezměnilo."; exit $RC; }
if [ -n "$RUCNI_CESTA" ]; then
  if [ -f "$RUCNI_CESTA" ]; then mkdir -p "$HOME/.claude/cowork-tym"; printf '%s\n' "$RUCNI_CESTA" > "$HOME/.claude/cowork-tym/verze-path-rucne"; echo "Cesta k PRAVIDLA-VERZE.txt uložena."
  else echo "POZOR: soubor $RUCNI_CESTA neexistuje, ruční cestu jsem neuložil."; fi
fi
echo
echo "HOTOVO. Teď úplně ukonči Claude (Mac: Cmd+Q, Windows: i ikonu u hodin) a spusť znovu."
