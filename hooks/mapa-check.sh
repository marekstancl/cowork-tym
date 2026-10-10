#!/bin/bash
# cowork-tym - kontrola MAPA.md: hlásí složky workspace, které v mapě chybí.
# Volá se ze session-start.sh s cestou k aktuální složce sezení. Fail-open, nic neblokuje.
trap 'exit 0' EXIT
set +e
CWD="$1"; [ -n "$CWD" ] || exit 0
command -v perl >/dev/null 2>&1 || exit 0
# Najdi kořen: nejbližší nadřazená složka s MAPA.md obsahující značku COWORK-MAPA (max 8 úrovní)
D="$CWD"; ROOT=""
for _ in 1 2 3 4 5 6 7 8; do
  if [ -f "$D/MAPA.md" ] && head -n 10 "$D/MAPA.md" 2>/dev/null | grep -q 'COWORK-MAPA'; then ROOT="$D"; break; fi
  P=$(dirname "$D"); [ "$P" = "$D" ] && break; D="$P"
done
[ -n "$ROOT" ] || exit 0
MAPA="$ROOT/MAPA.md"
NFC() { perl -MUnicode::Normalize -CSD -ne 'chomp; print NFC($_),"\n"'; }
HL=$(sed -n 's/.*HLOUBKA:[[:space:]]*\([0-9]\).*/\1/p' "$MAPA" | head -n 1); [ -n "$HL" ] || HL=2
ZNAME=$(grep -o '| `[^`]*` |' "$MAPA" | sed 's/^| `//; s/` |$//' | NFC | sort -u)
vypis() { # $1 základ (relativně), $2 hloubka
  ( cd "$ROOT/$1" 2>/dev/null && find . -mindepth 1 -maxdepth "$2" -type d \
     ! -name '.*' ! -path '*/.*' ! -name node_modules ! -path '*/node_modules/*' \
     ! -path './_tmp*' ! -path '*/_tmp/*' ! -path './archiv/*' ! -path '*/Archiv/*' \
     ! -path '*/archive/*' ! -path '*/workshop/*' ! -path '*/outputs/*' 2>/dev/null ) | sed 's#^\./##' | while IFS= read -r x; do
       [ -n "$1" ] && printf '%s/%s\n' "$1" "$x" || printf '%s\n' "$x"; done
}
{
  vypis "" "$HL"
  sed -n 's/.*HLOUBKA[[:space:]]\+\([^:]*\):[[:space:]]*\([0-9]\).*/\1|\2/p' "$MAPA" | while IFS='|' read -r B H; do
    B=$(printf '%s' "$B" | sed 's/[[:space:]]*$//'); vypis "$B" "$H"; done
} | NFC | sort -u > "${TMPDIR:-/tmp}/cowork-mapa-$$.txt"
CHYBI=$(printf '%s\n' "$ZNAME" | comm -13 - "${TMPDIR:-/tmp}/cowork-mapa-$$.txt" | head -n 15)
rm -f "${TMPDIR:-/tmp}/cowork-mapa-$$.txt"
[ -n "$CHYBI" ] || exit 0
echo "MAPA: v $MAPA chybí tyto složky:"
printf '%s\n' "$CHYBI" | sed 's/^/  - /'
echo "Až budeš ukládat nebo uživatel bude chtít, doplň je do mapy (k čemu, co patří, co ne, citlivost), nebo se zeptej, k čemu jsou. Teď jen jednou větou upozorni uživatele."
exit 0
