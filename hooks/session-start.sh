#!/bin/bash
# cowork-tym - SessionStart: otiskne verzi pravidel pro sezení a připomene,
# co načíst. Fail-open.
trap 'exit 0' EXIT
set +e
. "$(dirname "$0")/common.sh" || exit 0
INPUT=$(cat)
SID=$(json_pole "$INPUT" session_id)
CWD=$(win2posix "$(json_pole "$INPUT" cwd)")
VERZE_FILE=$(najdi_verzi "$CWD")
[ -n "$VERZE_FILE" ] || exit 0
VERZE=$(cti_verzi "$VERZE_FILE"); [ -n "$VERZE" ] || exit 0
TYM=$(hlavicka "$VERZE_FILE" TYM)
ZDROJ=$(hlavicka "$VERZE_FILE" ZDROJ-PRAVIDEL); [ -n "$ZDROJ" ] || ZDROJ="PRAVIDLA.md ve sdílené složce"
[ -n "$SID" ] && printf '%s' "$VERZE" > "$STAMP_DIR/$SID" 2>/dev/null
find "$STAMP_DIR" -type f -mtime +30 -delete 2>/dev/null
cat <<TXT
TÝMOVÝ PROSTOR${TYM:+ "$TYM"} - hook cowork-tym běží, platná verze pravidel je $VERZE.
Sdílená složka: $(dirname "$VERZE_FILE")
Pokud pracuješ v tomto týmovém projektu: než začneš, přečti pravidla ($ZDROJ) a řiď se jimi.
Když se pravidla během sezení změní, dozvíš se to při prvním zápisu.
TXT
# Sdílené skilly: jen upozornění, instalaci potvrzuje člověk (viz skilly/README.md).
SD=$(dirname "$VERZE_FILE")
if [ -f "$SD/skilly/VERZE.txt" ]; then
  SV=$(cti_verzi "$SD/skilly/VERZE.txt")
  ZN="$HOME/.claude/cowork-tym-skilly-$(printf '%s' "$SD" | cksum | cut -d' ' -f1)"
  NAINST=$(cat "$ZN" 2>/dev/null | cisti)
  if [ -n "$SV" ] && [ "$SV" != "0" ] && [ "$NAINST" != "vlastnik" ] && [ "$SV" != "$NAINST" ]; then
    cat <<TXT2
SKILLY: ve sdílené složce je sada skillů verze $SV, na tomto počítači ${NAINST:-žádná}.
Řekni uživateli jednou větou: "Jsou nové nebo změněné sdílené skilly, napiš: aktualizuj skilly."
Postup: $SD/skilly/README.md. Po instalaci zapiš verzi do: $ZN
TXT2
  fi
fi
exit 0
