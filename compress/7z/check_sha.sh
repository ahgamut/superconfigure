#!/bin/sh
set -e

CURDIR="$(pwd)"
sha256sum --check check.signature || exit 1
SRC_FILE=$(cat check.signature | sed 's/^[0-9a-f]*\s*//g')

echo "check successful. extracting from $SRC_FILE"
case "$SRC_FILE" in
    sources.tar.xz )
        mkdir -p 7z-src
        cd 7z-src
        tar xf ../sources.tar.xz
        chmod 666 $(find . -name '*.c')
        chmod 666 $(find . -name '*.cpp')
        chmod 666 $(find . -name '*.h')
        chmod 666 $(find . -name '*.mak')
        ;;
    * )
        echo "unable to extract files"
        exit 1
        ;;
esac
