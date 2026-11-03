#!/bin/sh
# Rewrite SHA256SUMS for every drawing.
set -eu
cd "$(dirname "$0")/.."
find cadcraft contributed -type f \( -iname '*.dxf' -o -iname '*.dwg' \) | LC_ALL=C sort | xargs -r sha256sum | sed 's/ \*/  /' > SHA256SUMS
