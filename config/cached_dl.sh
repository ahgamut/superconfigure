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
    fname=$(basename "$URL")
    fext="${fname##*.}"
    if ! [ -f "$HOME/.cache/$fname" ]; then
        wget -q -P "$HOME/.cache" "$URL"
    fi
    cp "$HOME/.cache/$fname" "sources.$fext"
}

case "$URL" in
    *.tar.gz* | *.tgz* )
        cached_wget "$URL"
        ;;
    *.tar.xz* )
        cached_wget "$URL"
        ;;
    *.tar.bz2* )
        cached_wget "$URL"
        ;;
    *.zip* )
        cached_wget "$URL"
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
