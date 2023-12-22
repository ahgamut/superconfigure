#!/usr/bin/env bash
set -e

URL="${1:-ERROR}"
CURDIR="`pwd`"

if [[ "$URL" = "ERROR" ]]; then
    echo "did not specify file to download!"
    exit 1
fi

case "$URL" in
    *.tar.gz* )
        wget -qO sources.tar.gz "$URL"
        tar xf sources.tar.gz
        ;;
    *.tar.xz* )
        wget -qO sources.tar.xz "$URL"
        tar xf sources.tar.xz
        ;;
    *.tar.bz2* )
        wget -qO sources.tar.bz2 "$URL"
        tar xf sources.tar.bz2
        ;;
    *.zip* )
        wget -qO sources.zip "$URL"
        unzip -qo sources.zip
        ;;
    *github.com/* )
        outdir=`basename "$CURDIR"`
        git clone --quiet --depth=1 "$URL" "$outdir"
        ;;
    * )
        echo "unable to use downloader for $URL"
        exit 1
        ;;
esac
