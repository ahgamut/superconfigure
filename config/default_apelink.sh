#!/usr/bin/env bash
set -e

FILELIST="${1:-ERROR}"

if [[ "$FILELIST" = "ERROR" ]]; then
    echo "did not specify files to fatten!"
    exit 1
fi

apelinkpls () {
    OUTPUT="$1"
    OLDNAME_X86_64="$(basename -- $OUTPUT_X86_64)"
    OLDNAME_AARCH64="$(basename -- $OUTPUT_AARCH64)"
    TARG_FOLD="$(dirname $OUTPUT)"
    "$APELINK" -l "$COSMO/o/$MODE/ape/ape.elf" \
        -l "$COSMO/o/$MODE_AARCH64/ape/ape.elf" \
        -M "$COSMO/ape/ape-m1.c" \
        -o "$OUTPUT" \
        "$OUTPUT_X86_64" \
        "$OUTPUT_AARCH64"
    cp "$OUTPUT_X86_64" "$TARG_FOLD/$OLDNAME_X86_64.x86_64"
    cp "$OUTPUT_AARCH64" "$TARG_FOLD/$OLDNAME_AARCH64.aarch64"
}

for EXE in $FILELIST; do
    apelinkpls $RESULTS/bin/$EXE.com $COSMOS_X86_64/bin/$EXE $COSMOS_AARCH64/bin/$EXE
done
