
SHELL:=/usr/bin/env bash
BASELOC:=$(shell pwd)

ifeq ($(ARCH),)
	ARCH=x86_64
endif

ifeq ($(TARGET_ARCH),)
	TARGET_ARCH=x86_64
endif

cosmo.setup.$(ARCH):
	source $(BASELOC)/vars/$(ARCH) && $(BASELOC)/cosmo-setup
	touch $@

%.built.$(ARCH): % cosmo.setup.$(ARCH)
	cd $< && chmod +x superconfigure
	source $(BASELOC)/vars/$(ARCH) && cd $< && ./superconfigure
	touch $@

# from cosmo monorepo

cosmo-thirdparty: cosmo-repo-thirdparty.built.$(ARCH)

# lib

lib/readline-8.2.built.$(ARCH): lib/ncurses-6.4.built.$(ARCH)
lib/nettle-3.9.built.$(ARCH): lib/gmp-6.3.0.built.$(ARCH)
lib/gnutls-3.7.10.built.$(ARCH): lib/nettle-3.9.built.$(ARCH) compress/brotli-1.1.0.built.$(ARCH) 
lib/mpfr-4.2.0.built.$(ARCH): lib/gmp-6.3.0.built.$(ARCH) compress/zlib-1.3.built.$(ARCH)
lib/mpc-1.3.1.built.$(ARCH): lib/gmp-6.3.0.built.$(ARCH) lib/mpfr-4.2.0.built.$(ARCH) lib/isl-0.18.built.$(ARCH)

# cli

cli/bash-5.2.built.$(ARCH): lib/ncurses-6.4.built.$(ARCH) lib/readline-8.2.built.$(ARCH)
cli/zsh-5.9.built.$(ARCH):\
	lib/ncurses-6.4.built.$(ARCH) lib/readline-8.2.built.$(ARCH)\
	lib/gdbm-1.23.built.$(ARCH)
cli/less-643.built.$(ARCH): lib/ncurses-6.4.built.$(ARCH) lib/readline-8.2.built.$(ARCH)
cli/grep-3.11.built.$(ARCH):\
	lib/ncurses-6.4.built.$(ARCH) lib/readline-8.2.built.$(ARCH)\
	lib/pcre-10.42.built.$(ARCH)
cli/berry-lang.built.$(ARCH): lib/readline-8.2.built.$(ARCH)
cli/coreutils-9.4.built.$(ARCH): lib/gmp-6.3.0.built.$(ARCH)
cli/texinfo-7.0.2.built.$(ARCH): lib/gmp-6.3.0.built.$(ARCH) lib/ncurses-6.4.built.$(ARCH)

cli/tmux-3.3a.built.$(ARCH): lib/ncurses-6.4.built.$(ARCH) lib/libevent-2.1.12.built.$(ARCH)

cli: cosmo-repo-thirdparty.built.$(ARCH)\
	cli/tmux-3.3a.built.$(ARCH)\
	cli/make-4.4.built.$(ARCH)\
	cli/sed-4.9.built.$(ARCH)\
	cli/ninja-1.11.1.built.$(ARCH)\
	cli/grep-3.11.built.$(ARCH)\
	cli/less-643.built.$(ARCH)\
	cli/bash-5.2.built.$(ARCH)\
	cli/findutils-4.9.0.built.$(ARCH)\
	cli/coreutils-9.4.built.$(ARCH)\
	cli/berry-lang.built.$(ARCH)\
	cli/zsh-5.9.built.$(ARCH)

# editor

editor/emacs-28.2.built.$(ARCH): lib/ncurses-6.4.built.$(ARCH) lib/gnutls-3.7.10.built.$(ARCH)
editor/vim-9.0.1670.built.$(ARCH): lib/ncurses-6.4.built.$(ARCH) lib/readline-8.2.built.$(ARCH)
editor/nano-7.2.built.$(ARCH): lib/ncurses-6.4.built.$(ARCH) lib/readline-8.2.built.$(ARCH)

editor: editor/nano-7.2.built.$(ARCH)\
	editor/emacs-28.2.built.$(ARCH)\
	editor/vim-9.0.1670.built.$(ARCH)

# compress

compress/tar-1.35.built.$(ARCH): \
	compress/zlib-1.3.built.$(ARCH) \
	compress/xz-5.4.3.built.$(ARCH) \
	compress/brotli-1.1.0.built.$(ARCH)\
	compress/gzip-1.13.built.$(ARCH)

compress/pigz-2.8.built.$(ARCH): compress/zlib-1.3.built.$(ARCH)
compress/gzip-1.13.built.$(ARCH): compress/zlib-1.3.built.$(ARCH)

compress: cosmo-repo-thirdparty.built.$(ARCH)\
	compress/lz4-1.9.4.built.$(ARCH)\
	compress/pigz-2.8.built.$(ARCH)\
	compress/xz-5.4.3.built.$(ARCH)\
	compress/brotli-1.1.0.built.$(ARCH)\
	compress/gzip-1.13.built.$(ARCH)\
	compress/tar-1.35.built.$(ARCH)

# web

web/wget-1.21.built.$(ARCH):\
	lib/openssl-1.1.1u.built.$(ARCH)\
	lib/libuuid-1.0.3.built.$(ARCH)\
	compress/xz-5.4.3.built.$(ARCH)\
	compress/brotli-1.1.0.built.$(ARCH)
web/rsync-3.2.7.built.$(ARCH): lib/openssl-1.1.1u.built.$(ARCH)
web/curl-8.4.0.built.$(ARCH):\
	lib/openssl-1.1.1u.built.$(ARCH) compress/xz-5.4.3.built.$(ARCH)\
	lib/libssh2-1.11.0.built.$(ARCH) compress/brotli-1.1.0.built.$(ARCH)
web/git-2.42.0.built.$(ARCH):\
	lib/openssl-1.1.1u.built.$(ARCH)\
	compress/xz-5.4.3.built.$(ARCH)\
	web/curl-8.4.0.built.$(ARCH)\
	lib/libexpat-2.5.0.built.$(ARCH)

web/links-2.29.built.$(ARCH):\
	lib/ncurses-6.4.built.$(ARCH)\
	lib/openssl-1.1.1u.built.$(ARCH)\
	lib/libuuid-1.0.3.built.$(ARCH)\
	compress/xz-5.4.3.built.$(ARCH)\
	compress/brotli-1.1.0.built.$(ARCH)

web/postgres-15.5.built.$(ARCH):\
	lib/openssl-1.1.1u.built.$(ARCH)\
	lib/libuuid-1.0.3.built.$(ARCH)\
	lib/readline-8.2.built.$(ARCH)\
	compress/xz-5.4.3.built.$(ARCH)\
	lib/libexpat-2.5.0.built.$(ARCH)

web: web/wget-1.21.built.$(ARCH)\
	web/links-2.29.built.$(ARCH)\
	web/curl-8.4.0.built.$(ARCH)\
	web/rsync-3.2.7.built.$(ARCH)\
	web/git-2.42.0.built.$(ARCH)

# python

python/cpy311-datasette.built.$(ARCH):\
	lib/ncurses-6.4.built.$(ARCH) lib/readline-8.2.built.$(ARCH)\
	lib/openssl-1.1.1u.built.$(ARCH) lib/gdbm-1.23.built.$(ARCH)\
	lib/libuuid-1.0.3.built.$(ARCH) lib/libexpat-2.5.0.built.$(ARCH)\
	lib/libyaml-0.2.5.built.$(ARCH) compress/xz-5.4.3.built.$(ARCH)

python/cpy311-pypack1.built.$(ARCH):\
	lib/ncurses-6.4.built.$(ARCH) lib/readline-8.2.built.$(ARCH)\
	lib/openssl-1.1.1u.built.$(ARCH) lib/gdbm-1.23.built.$(ARCH)\
	lib/libuuid-1.0.3.built.$(ARCH) lib/libexpat-2.5.0.built.$(ARCH)\
	lib/libyaml-0.2.5.built.$(ARCH) compress/xz-5.4.3.built.$(ARCH)\
	compress/lz4-1.9.4.built.$(ARCH)

python/cpy311-pypack2.built.$(ARCH):\
	lib/ncurses-6.4.built.$(ARCH) lib/readline-8.2.built.$(ARCH)\
	lib/openssl-1.1.1u.built.$(ARCH) lib/gdbm-1.23.built.$(ARCH)\
	lib/libuuid-1.0.3.built.$(ARCH) lib/libexpat-2.5.0.built.$(ARCH)\
	lib/libyaml-0.2.5.built.$(ARCH) compress/xz-5.4.3.built.$(ARCH)

pypack2: python/cpy311-pypack2.built.$(ARCH)
pypack1: python/cpy311-pypack1.built.$(ARCH)
datasette: python/cpy311-datasette.built.$(ARCH)

python: pypack1 datasette

# compiler

compiler/x86_64-binutils.built.$(ARCH):\
	lib/gmp-6.3.0.built.$(ARCH) lib/mpc-1.3.1.built.$(ARCH)\
	lib/mpfr-4.2.0.built.$(ARCH) lib/isl-0.18.built.$(ARCH)
compiler/x86_64-gcc.built.$(ARCH):\
	compiler/x86_64-binutils.built.$(ARCH)

compiler/aarch64-binutils.built.$(ARCH):\
	lib/gmp-6.3.0.built.$(ARCH) lib/mpc-1.3.1.built.$(ARCH)\
	lib/mpfr-4.2.0.built.$(ARCH) lib/isl-0.18.built.$(ARCH)
compiler/aarch64-gcc.built.$(ARCH):\
	compiler/aarch64-binutils.built.$(ARCH)

gcc: compiler/$(TARGET_ARCH)-gcc.built.$(ARCH)

compiler/llvm-15.0.7.built.$(ARCH): compress/zlib-1.3.built.$(ARCH)
llvm: compiler/llvm-15.0.7.built.$(ARCH)

# gui

gui/xorgproto-2023.2.built.$(ARCH): gui/util-macros-1.20.0.built.$(ARCH)
gui/xcb-proto-1.16.0.built.$(ARCH): gui/util-macros-1.20.0.built.$(ARCH)
gui/xtrans-1.5.0.built.$(ARCH): gui/xorgproto-2023.2.built.$(ARCH)
gui/libXau-1.0.11.built.$(ARCH): gui/xorgproto-2023.2.built.$(ARCH) gui/xtrans-1.5.0.built.$(ARCH)
gui/libxcb-1.16.built.$(ARCH): gui/libXau-1.0.11.built.$(ARCH) gui/xcb-proto-1.16.0.built.$(ARCH)
gui/libX11-1.8.7.built.$(ARCH): gui/libxcb-1.16.built.$(ARCH)
gui/libXext-1.3.5.built.$(ARCH): gui/libX11-1.8.7.built.$(ARCH)
gui/SDL2-2.28.5.built.$(ARCH): gui/libXext-1.3.5.built.$(ARCH) gui/libX11-1.8.7.built.$(ARCH)
gui: gui/SDL2-2.28.5.built.$(ARCH)

######

cosmos: python cli editor compress
all: python cli editor web compress

######

zipclean:
	find /zip -mindepth 1 -delete

clean: zipclean
	find . -name "*.built.x86_64" | xargs rm -f
	find . -name "*.built.aarch64" | xargs rm -f
	rm -f $(BASELOC)/cosmo.setup.*

distclean: zipclean
	git clean -f -d -x

.PHONY: all clean distclean zipclean
