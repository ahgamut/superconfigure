#!/usr/bin/env bash

# edit src/config.in to change 
#   INTERRUPT_INPUT to INTERRUPT_INPUT0
#   USABLE_FIONREAD to USABLE_FIONREAD0

./configure --without-x --without-gnutls\
    --disable-acl --with-threads\
    --with-sound=no --with-unexec=no\
    --without-gpm --without-modules --without-libgmp\
    --prefix=$COSMOS\
    CFLAGS="-Os -I$COSMOS/include/ncurses"
