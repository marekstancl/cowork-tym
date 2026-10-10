#!/bin/bash
# Vygeneruje složku bez-pluginu/ ze zdrojů pluginu (jediný zdroj pravdy = skills/ a hooks/).
set -e
cd "$(dirname "$0")/.."
OUT=bez-pluginu
rm -rf "$OUT/A-osobni-prostor" "$OUT/B-tym" "$OUT/C-dalsi-postupy"
mkdir -p "$OUT/A-osobni-prostor" "$OUT/B-tym/hlidac"
cp -R skills/zakladni-nastaveni/assets/workspace "$OUT/A-osobni-prostor/CLAUDE COWORK"
cp skills/zakladni-nastaveni/references/navod-pro-cloveka.md "$OUT/A-osobni-prostor/NAVOD.md"
cp -R skills/tym-vedouci/assets/sablona-slozky "$OUT/B-tym/sdilena-slozka"
cp skills/tym-vedouci/assets/PROJECT-INSTRUCTIONS-vedouci.md "$OUT/B-tym/"
cp skills/tym-vedouci/references/architektura.md skills/tym-vedouci/references/udrzba.md skills/tym-vedouci/references/hooky-kdy-a-proc.md "$OUT/B-tym/"
cp hooks/common.sh hooks/session-start.sh hooks/pre-write.sh hooks/hooks.json skills/tym-vedouci/assets/rucni-instalace-hooku/install-hooks.sh "$OUT/B-tym/hlidac/"
chmod +x "$OUT/B-tym/hlidac/"*.sh
mkdir -p "$OUT/C-dalsi-postupy"
for s in pruvodce novy-projekt stred-workspace nove-pc; do cp skills/$s/SKILL.md "$OUT/C-dalsi-postupy/$s.md"; done
cp skills/novy-projekt/references/prevzeti-dat-poznatky.md skills/stred-workspace/references/zadani-sablona.md skills/stred-workspace/references/schema.svg "$OUT/C-dalsi-postupy/"
echo "bez-pluginu/ vygenerováno"
