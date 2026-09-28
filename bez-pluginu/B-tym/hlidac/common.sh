# Společné funkce pro hooky cowork-tym (načítá se přes "source").
# Soubor s verzí: PRAVIDLA-VERZE.txt v kořeni sdílené složky, se značkou
# COWORK-TYM v hlavičce. Hlavička (řádky 2-15) může obsahovat:
#   TYM: <název týmu>
#   ZDROJ-PRAVIDEL: <kde pravidla leží>
# Funguje na macOS, Linuxu a Windows (Git Bash / WSL). Vše fail-open.

BASE="$HOME/.claude/cowork-tym"
mkdir -p "$BASE/stamps" 2>/dev/null || BASE="${TMPDIR:-/tmp}/cowork-tym"
mkdir -p "$BASE/stamps" 2>/dev/null
STAMP_DIR="$BASE/stamps"
CACHE="$BASE/verze-path"          # automaticky zapamatovaná cesta
RUCNE="$BASE/verze-path-rucne"    # ruční přepis (1 řádek = cesta), má přednost

BOM=$(printf '\357\273\277')   # BSD sed (macOS) nezná \x escapy
# Přečte 1. řádek bez BOM, CR a mezer.
cti_verzi() { head -n 1 "$1" 2>/dev/null | sed "s/^$BOM//" | tr -d '\r\n\t '; }
cisti() { sed "s/^$BOM//" | tr -d '\r\n\t '; }

je_nase() { head -n 15 "$1" 2>/dev/null | tr -d '\r' | grep -q 'COWORK-TYM'; }

hledej_v() { # $1 kořen, $2 hloubka
  [ -d "$1" ] || return 1
  find "$1" -maxdepth "$2" \( -name AppData -o -name node_modules -o -name .git -o -name '.Trash*' -o -name '$RECYCLE.BIN' \) -prune -o \
       -name PRAVIDLA-VERZE.txt -type f -print 2>/dev/null | while IFS= read -r f; do
    je_nase "$f" && { printf '%s' "$f"; break; }
  done
}

najdi_verzi() { # volitelně $1 = cwd sezení
  local P f
  # 1) ruční přepis: proměnná nebo soubor
  if [ -n "${COWORK_TYM_VERZE_FILE:-}" ] && [ -f "$COWORK_TYM_VERZE_FILE" ]; then printf '%s' "$COWORK_TYM_VERZE_FILE"; return; fi
  if [ -f "$RUCNE" ]; then P=$(head -n 1 "$RUCNE" | tr -d '\r'); [ -f "$P" ] && { printf '%s' "$P"; return; }; fi
  # 2) složka sezení (Cowork ji předává jako cwd)
  if [ -n "${1:-}" ] && [ -d "$1" ]; then
    P=$(hledej_v "$1" 4); [ -n "$P" ] && { printf '%s' "$P"; return; }
  fi
  # 3) zapamatovaná cesta
  if [ -f "$CACHE" ]; then P=$(cat "$CACHE" 2>/dev/null); if [ -n "$P" ] && [ -f "$P" ] && je_nase "$P"; then printf '%s' "$P"; return; fi; fi
  # 3b) nedávno nic nenalezeno -> neprohledávej znovu (10 min), ať je hook rychlý
  if [ -f "$BASE/nenalezeno" ] && [ -z "$(find "$BASE/nenalezeno" -mmin +10 2>/dev/null)" ]; then return; fi
  # 4) známá místa cloudových disků (bez prohledávání Plochy/Dokumentů na Macu)
  P=""
  for R in "$HOME/Library/CloudStorage" "$HOME/mnt" "$HOME"/OneDrive* "$HOME/Google Drive" "$HOME/My Drive" "$HOME/Můj disk" "$HOME/Dropbox" "$HOME/Box" \
           ${USERPROFILE:+"$USERPROFILE"}; do
    [ -d "$R" ] || continue
    P=$(hledej_v "$R" 8); [ -n "$P" ] && break
  done
  # Windows písmena disků (Google Drive G:, síťové disky) - mělce
  if [ -z "$P" ]; then
    for R in /[d-z] /mnt/[d-z]; do [ -d "$R" ] || continue; P=$(hledej_v "$R" 3); [ -n "$P" ] && break; done
  fi
  # 5) Windows: celý profil (Git Bash /c/Users/<jméno>, WSL /mnt/c/Users/<jméno>) - mělce
  if [ -z "$P" ]; then
    for R in /c/Users/* /mnt/c/Users/*; do [ -d "$R" ] || continue; P=$(hledej_v "$R" 5); [ -n "$P" ] && break; done
  fi
  if [ -n "$P" ]; then rm -f "$BASE/nenalezeno" 2>/dev/null; printf '%s' "$P" > "$CACHE" 2>/dev/null; printf '%s' "$P"
  else : > "$BASE/nenalezeno" 2>/dev/null; fi
}

hlavicka() { sed -n '2,15p' "$1" 2>/dev/null | tr -d '\r' | sed -n "s/^$2:[[:space:]]*//p" | head -n 1; }

json_pole() { # $1 vstup, $2 klíč - jednoduchá hodnota řetězce
  printf '%s' "$1" | tr -d '\n' | sed -n "s/.*\"$2\"[[:space:]]*:[[:space:]]*\"\([^\"]*\)\".*/\1/p" | head -n 1
}

win2posix() { # C:\\Users\\x -> /c/Users/x (přenositelné, bez GNU rozšíření)
  local x d
  x=$(printf '%s' "$1" | sed -e 's/\\\\/\//g' -e 's/\\/\//g')
  case "$x" in
    [A-Za-z]:*) d=$(printf '%s' "${x%%:*}" | tr 'A-Z' 'a-z'); x="/$d${x#?:}" ;;
  esac
  printf '%s' "$x"
}

esc_json() { printf '%s' "$1" | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' -e 's/\t/ /g' | awk 'BEGIN{ORS=""} NR>1{print "\\n"} {print}'; }
