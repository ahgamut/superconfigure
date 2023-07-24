#!/usr/bin/env bash

# bash 5.2 uses readline8.2 implicitly

./configure --prefix="$COSMOS"\
    --without-bash-malloc --enable-static-link\
    --disable-rpath\
    --disable-nls --enable-threads=posix\
    --with-gnu-ld --with-curses\
    CFLAGS="-Os -I$COSMOS/include/ncurses"
