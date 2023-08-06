#!/usr/bin/env bash

export LDFLAGS=-L/opt/cosmos/lib
export CFLAGS=-I/opt/cosmos/include

./configure --disable-darwin --disable-smack --disable-selinux\
    --disable-xsmp --enable-luainterp=no --enable-perlinterp=no\
    --enable-pythoninterp=no --enable-python3interp=no\
    --enable-tclinterp=no --enable-rubyinterp=no\
    --disable-netbeans --disable-cscope --enable-multibyte\
    --disable-xim --disable-fontset --enable-gui=no\
    --disable-nls --disable-sysmouse --disable-acl\
    --disable-canberra --disable-libsodium\
    --without-x --with-tlib=tinfo\
    --with-local-dir=$COSMOS/lib\
    --prefix=$COSMOS\
    CFLAGS="-Os"
