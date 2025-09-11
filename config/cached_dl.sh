#!/bin/bash
set -e

URL="${1:-ERROR}"
CURDIR="$(pwd)"

if [ "$URL" = "ERROR" ]; then
    echo "did not specify file to download!"
    exit 1
fi

cached_wget () {
    URL="$1"
    RESULT="$2"
    fdir="${URL%/*}"
    fname="${URL##*/}"
    ext0="${fname##*.}"
    ext1="${RESULT##*.}"
    while [ "$ext0" != "$ext1" ]; do
        fname="${fdir##*/}"
        fdir="${fdir%/*}"
        ext0="${fname##*.}"
        ext1="${RESULT##*.}"
    done
    if ! [ -f "$HOME/.cache/$fname" ]; then
        wget -q -O "$HOME/.cache/$fname" "$URL"
    fi
    cp "$HOME/.cache/$fname" "$RESULT"
}

case "$URL" in
    *.tar.gz* | *.tgz* )
        cached_wget "$URL" sources.tar.gz
        ;;
    *.tar.xz* )
        cached_wget "$URL" sources.tar.xz
        ;;
    *.tar.bz2* )
        cached_wget "$URL" sources.tar.bz2
        ;;
    *.zip* )
        cached_wget "$URL" sources.zip
        ;;
    *github.com/* )
        outdir=$(basename "$CURDIR")
        git clone --quiet --depth=1 "$URL" "$outdir"
        ;;
    * )
        echo "unable to use downloader for $URL"
        exit 1
        ;;
esac
