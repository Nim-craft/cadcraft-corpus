#!/bin/sh
# Regenerate cadcraft/ with a cadcraft-cli build: CADCRAFT_CLI=path/to/cadcraft-cli tools/generate.sh
# Then run tools/sums.sh and name the CADCraft commit in the commit message.
set -eu
cd "$(dirname "$0")/.."
cli="${CADCRAFT_CLI:-cadcraft-cli}"
for name in bracket floorplan; do
    for ext in dxf dwg; do
        "$cli" sample "$name" "cadcraft/sample-$name.$ext"
    done
done
