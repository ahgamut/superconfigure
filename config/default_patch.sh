#!/usr/bin/env bash
set -e

PFILE="${1:-ERROR}"
CURDIR="`pwd`"

if [[ "$PFILE" = "ERROR" ]]; then
    echo "did not specify file to patch!"
    exit 1
fi

if ! [ -f "$PFILE" ]; then
    echo "$PFILE does not exist, assuming nothing to patch :)"
    exit 0
fi

patch -p0 -i "$PFILE"
