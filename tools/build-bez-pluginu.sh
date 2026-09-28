#!/bin/bash
# Vygeneruje složku bez-pluginu/ ze zdrojů pluginu (jediný zdroj pravdy = skills/ a hooks/).
set -e
cd "$(dirname "$0")/.."
OUT=bez-pluginu
rm -rf "$OUT/A-osobni-prostor" "$OUT/B-tym"
mkdir -p "$OUT/A-osobni-prostor" "$OUT/B-tym/hlidac"
cp -R skills/zakladni-nastaveni/assets/workspace "$OUT/A-osobni-prostor/CLAUDE COWORK"
cp skills/zakladni-nastaveni/references/navod-pro-cloveka.md "$OUT/A-osobni-prostor/NAVOD.md"
cp -R skills/tym-vedouci/assets/sablona-slozky "$OUT/B-tym/sdilena-slozka"
cp skills/tym-vedouci/assets/PROJECT-INSTRUCTIONS-vedouci.md "$OUT/B-tym/"
cp skills/tym-vedouci/references/architektura.md skills/tym-vedouci/references/udrzba.md "$OUT/B-tym/"
cp hooks/common.sh hooks/session-start.sh hooks/pre-write.sh hooks/hooks.json skills/tym-vedouci/assets/rucni-instalace-hooku/install-hooks.sh "$OUT/B-tym/hlidac/"
chmod +x "$OUT/B-tym/hlidac/"*.sh
echo "bez-pluginu/ vygenerováno"
