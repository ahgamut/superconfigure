
SHELL:=/usr/bin/env bash
BASELOC:=$(shell pwd)

ifeq ($(ARCH),)
	ARCH=x86_64
endif

cosmo.setup.$(ARCH):
	source $(BASELOC)/vars/$(ARCH) && $(BASELOC)/cosmo-setup
	touch $@

%.built.$(ARCH): % cosmo.setup.$(ARCH)
	cd $< && chmod +x superconfigure
	source $(BASELOC)/vars/$(ARCH) && cd $< && ./superconfigure
	touch $@

readline-8.2.built.$(ARCH): ncurses-6.4.built.$(ARCH)
bash-5.2.built.$(ARCH): ncurses-6.4.built.$(ARCH) readline-8.2.built.$(ARCH)
less-643.built.$(ARCH): ncurses-6.4.built.$(ARCH) readline-8.2.built.$(ARCH)
grep-3.11.built.$(ARCH): ncurses-6.4.built.$(ARCH) readline-8.2.built.$(ARCH)
berry-lang.built.$(ARCH): readline-8.2.built.$(ARCH)

emacs-28.2.built.$(ARCH): ncurses-6.4.built.$(ARCH)
vim-9.0.1670.built.$(ARCH): ncurses-6.4.built.$(ARCH) readline-8.2.built.$(ARCH)
nano-7.2.built.$(ARCH): ncurses-6.4.built.$(ARCH) readline-8.2.built.$(ARCH)

wget-1.21.built.$(ARCH): openssl-1.1.1u.built.$(ARCH) libuuid-1.0.3.built.$(ARCH) xz-5.4.3.built.$(ARCH)
rsync-3.2.7.built.$(ARCH): openssl-1.1.1u.built.$(ARCH)
curl-8.4.0.built.$(ARCH): openssl-1.1.1u.built.$(ARCH) xz-5.4.3.built.$(ARCH) libssh2-1.11.0.built.$(ARCH)
git-2.42.0.built.$(ARCH): openssl-1.1.1u.built.$(ARCH) xz-5.4.3.built.$(ARCH) curl-8.4.0.built.$(ARCH) libexpat-2.5.0.built.$(ARCH)

cpy311-datasette.built.$(ARCH): ncurses-6.4.built.$(ARCH) readline-8.2.built.$(ARCH)\
	openssl-1.1.1u.built.$(ARCH) gdbm-1.23.built.$(ARCH) libuuid-1.0.3.built.$(ARCH)\
	libyaml-0.2.5.built.$(ARCH) xz-5.4.3.built.$(ARCH)

cpy311-pypack1.built.$(ARCH): ncurses-6.4.built.$(ARCH) readline-8.2.built.$(ARCH)\
	openssl-1.1.1u.built.$(ARCH) gdbm-1.23.built.$(ARCH) libuuid-1.0.3.built.$(ARCH)\
	xz-5.4.3.built.$(ARCH)


mpfr-4.2.0.built.$(ARCH): gmp-6.3.0.built.$(ARCH)
texinfo-7.0.2.built.$(ARCH): gmp-6.3.0.built.$(ARCH) ncurses-6.4.built.$(ARCH)
mpc-1.3.1.built.$(ARCH): gmp-6.3.0.built.$(ARCH) mpfr-4.2.0.built.$(ARCH) isl-0.18.built.$(ARCH)
binutils-2.35.2.built.$(ARCH): gmp-6.3.0.built.$(ARCH) mpc-1.3.1.built.$(ARCH) mpfr-4.2.0.built.$(ARCH) isl-0.18.built.$(ARCH)
gcc-11.2-patched.built.$(ARCH): binutils-2.35.2.built.$(ARCH)

coreutils-9.4.built.$(ARCH): gmp-6.3.0.built.$(ARCH)

cosmo-thirdparty: cosmo-repo-thirdparty.built.$(ARCH)
cli: tree-2.1.1.built.$(ARCH) grep-3.11.built.$(ARCH) less-643.built.$(ARCH) bash-5.2.built.$(ARCH)\
	findutils-4.9.0.built.$(ARCH) coreutils-9.4.built.$(ARCH) \
	berry-lang.built.$(ARCH) xz-5.4.3.built.$(ARCH)
web: wget-1.21.built.$(ARCH) rsync-3.2.7.built.$(ARCH) curl-8.4.0.built.$(ARCH) git-2.42.0.built.$(ARCH)
editor: nano-7.2.built.$(ARCH) emacs-28.2.built.$(ARCH) vim-9.0.1670.built.$(ARCH)
pypack1: cpy311-pypack1.built.$(ARCH)
datasette: cpy311-datasette.built.$(ARCH)
gcc: gcc-11.2-patched.built.$(ARCH)
llvm: llvm-15.0.7.built.$(ARCH)

python: pypack1 datasette
all: python cli editor gcc web

clean:
	find . -name "*.built*" | xargs rm -f
	rm -f $(BASELOC)/cosmo.setup.*

distclean:
	git clean -f -d -x

.PHONY: all clean distclean\
	python cli pypack1 web \
	gcc datasette editor
