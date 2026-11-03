#!/bin/sh
# Fail when a drawing has no LICENSES.tsv row, or SHA256SUMS doesn't match the files.
set -eu
cd "$(dirname "$0")/.."
status=0
files=$(find cadcraft contributed -type f \( -iname '*.dxf' -o -iname '*.dwg' \) | LC_ALL=C sort)
for f in $files; do
    if ! cut -f1 LICENSES.tsv | grep -qxF "$f"; then
        echo "no LICENSES.tsv row: $f"
        status=1
    fi
done
for f in $(tail -n +2 LICENSES.tsv | cut -f1); do
    if [ ! -f "$f" ]; then
        echo "LICENSES.tsv names a missing file: $f"
        status=1
    fi
done
if [ "$(sed 's/^[0-9a-f]* [ *]//' SHA256SUMS)" != "$files" ]; then
    echo "SHA256SUMS doesn't list exactly the drawings: run tools/sums.sh"
    status=1
fi
sha256sum --quiet -c SHA256SUMS || status=1
exit $status
