
SHELL:=/bin/bash
BASELOC:=$(shell pwd)

ifeq ($(ARCH),)
	ARCH=x86_64
endif

cosmo.setup:
	source $(BASELOC)/vars/$(ARCH) && $(BASELOC)/cosmo-setup
	touch $@

%.built: % cosmo.setup
	cd $< && chmod +x superconfigure
	source $(BASELOC)/vars/$(ARCH) && cd $< && ./superconfigure >/dev/null
	touch $@

readline-8.2.built: ncurses-6.4.built

emacs-28.2.built: ncurses-6.4.built

vim-9.0.1670.built: ncurses-6.4.built readline-8.2.built

bash-5.2.built: ncurses-6.4.built readline-8.2.built

wget-1.21.built: openssl-1.1.1u.built libuuid-1.0.3.built xz-5.4.3.built

cpy311-datasette.built: ncurses-6.4.built readline-8.2.built\
	openssl-1.1.1u.built gdbm-1.23.built libuuid-1.0.3.built\
	libyaml-0.2.5.built xz-5.4.3.built

cpy311-pypack1.built: ncurses-6.4.built readline-8.2.built\
	openssl-1.1.1u.built gdbm-1.23.built libuuid-1.0.3.built\
	xz-5.4.3.built

binutils-2.35.2.built: gmp-6.3.0.built mpc-1.3.1.built mpfr-4.2.0.built texinfo-7.0.2.built isl-0.18.built
gcc-11.2-patched.built: binutils-2.35.2.built

#

cli: bash-5.2.built wget-1.21.built 
editor: emacs-28.2.built vim-9.0.1670.built
pypack1: cpy311-pypack1.built
datasette: cpy311-datasette.built
python: pypack1 datasette

gcc: gcc-11.2-patched.built

all: python cli editor

clean:
	find . -name "*.built" | xargs rm -f
	rm -f $(BASELOC)/cosmo.setup

distclean:
	git clean -f -d -x

.PHONY: all clean distclean\
	python cli pypack1 datasette editor
