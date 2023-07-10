#!/usr/bin/env bash

./configure --without-x --without-gnutls\
    --disable-acl --with-threads\
    --with-sound=no --with-unexec=no\
    --without-gpm --without-modules --without-libgmp\
    --prefix=$COSMOS\
    CFLAGS="-Os -g3 -I$COSMOS/include/ncurses"
