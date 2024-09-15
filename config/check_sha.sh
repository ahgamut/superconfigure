#!/bin/sh
set -e

CURDIR="$(pwd)"
sha256sum --check check.signature || exit 1
SRC_FILE=$(cat check.signature | sed 's/^[0-9a-f]*\s*//g')

echo "check successful. extracting from $SRC_FILE"
case "$SRC_FILE" in
    sources.tar.gz )
        tar xf sources.tar.gz
        ;;
    sources.tar.xz )
        tar xf sources.tar.xz
        ;;
    sources.tar.bz2 )
        tar xf sources.tar.bz2
        ;;
    sources.zip )
        unzip -qo sources.zip
        ;;
    * )
        echo "unable to extract files"
        exit 1
        ;;
esac
