#!/bin/bash
# cowork-tym - PreToolUse: když se verze pravidel od startu sezení změnila,
# JEDNOU odmítne zápis, vypíše novinky a pošle načíst pravidla. Otisk se zvedne
# hned, druhý pokus projde. Změnu, kterou udělalo samo sezení (vedoucí zapisuje
# do PRAVIDLA-VERZE.txt), neblokuje. Fail-open.
trap 'exit 0' EXIT
set +e
. "$(dirname "$0")/common.sh" || exit 0
INPUT=$(cat)
SID=$(json_pole "$INPUT" session_id); [ -n "$SID" ] || exit 0
CWD=$(win2posix "$(json_pole "$INPUT" cwd)")
STAMP="$STAMP_DIR/$SID"

# Sezení samo zapisuje do souboru s verzí (Write/Edit na PRAVIDLA-VERZE.txt)
# -> povol a následnou změnu verze přijmi bez odmítnutí. Shell a konektory výjimku nemají.
TOOL=$(json_pole "$INPUT" tool_name)
FP=$(json_pole "$INPUT" file_path)
case "$TOOL" in Write|Edit|MultiEdit)
  case "$FP" in *PRAVIDLA-VERZE.txt) : > "$STAMP.vlastni" 2>/dev/null; exit 0 ;; esac ;;
esac

VERZE_FILE=$(najdi_verzi "$CWD"); [ -n "$VERZE_FILE" ] || exit 0
VERZE=$(cti_verzi "$VERZE_FILE"); [ -n "$VERZE" ] || exit 0
if [ ! -f "$STAMP" ]; then printf '%s' "$VERZE" > "$STAMP" 2>/dev/null; exit 0; fi
STARA=$(cisti < "$STAMP" 2>/dev/null); [ -n "$STARA" ] || exit 0
[ "$STARA" = "$VERZE" ] && { rm -f "$STAMP.vlastni" 2>/dev/null; exit 0; }

printf '%s' "$VERZE" > "$STAMP" 2>/dev/null
if [ -f "$STAMP.vlastni" ]; then rm -f "$STAMP.vlastni" 2>/dev/null; exit 0; fi

NOVINKY=$(sed "s/^$BOM//" "$VERZE_FILE" | tr -d '\r' | awk -v neu="$VERZE" -v alt="$STARA" '
  /^HISTORIE/ { h = 1; next }
  !h { next }
  index($0, neu) == 1 { p = 1 }
  p && index($0, alt) == 1 { exit }
  p { print }' | head -n 40 | sed -e 's/[[:space:]]*$//' -e '/^$/d')
ZDROJ=$(hlavicka "$VERZE_FILE" ZDROJ-PRAVIDEL); [ -n "$ZDROJ" ] || ZDROJ="PRAVIDLA.md ve sdílené složce"
ZPRAVA="PRAVIDLA SE ZMĚNILA. Tvoje sezení začalo s verzí $STARA, platná je $VERZE."
[ -n "$NOVINKY" ] && ZPRAVA="$ZPRAVA"$'\n\n'"CO SE ZMĚNILO:"$'\n'"$NOVINKY"
ZPRAVA="$ZPRAVA"$'\n\n'"Přečti znovu pravidla ($ZDROJ, složka $(dirname "$VERZE_FILE")). Pak tuhle akci zopakuj - podruhé projde. Když se rozdělaný úkol s novými pravidly rozchází, řekni to uživateli a nepokračuj. Tohle odmítnutí neobcházej."
printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"%s"}}\n' "$(esc_json "$ZPRAVA")"
exit 0
