#!/bin/sh
set -e

EXE="${1:-ERROR}"
shift 1
FILELIST="$@"

if [ "$EXE" = "ERROR" ]; then
    echo "did not specify exe to fatten!"
    exit 1
fi

if [ "$FILELIST" = "" ]; then
    echo "did not specify folders to add!"
    exit 1
fi

apelinkpls () {
    OUTPUT="$1"
    OLDNAME_X86_64="$(basename -- "$2")"
    OLDNAME_AARCH64="$(basename -- "$3")"
    TARG_FOLD="$(dirname "$OUTPUT")"
    "$APELINK" -l "$COSMO/o/x86_64/ape/ape.elf" \
        -l "$COSMO/o/aarch64/ape/ape.elf" \
        -M "$COSMO/ape/ape-m1.c" \
        -o "$OUTPUT" \
        "$2" \
        "$3"
    cp "$2" "$TARG_FOLD/$OLDNAME_X86_64.x86_64"
    cp "$3" "$TARG_FOLD/$OLDNAME_AARCH64.aarch64"
}

apelinkpls "$RESULTS"/bin/"$EXE".com "$COSMOS_X86_64"/bin/"$EXE" "$COSMOS_AARCH64"/bin/"$EXE"

echo "adding zip assets to $EXE"
cd /zip
zip -qr "$RESULTS"/bin/"$EXE".com $FILELIST
cd "$BASELOC"
