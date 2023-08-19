BASELOC=$(shell pwd)
ifeq ($(ARCH),)
	ARCH=x86_64
endif

cosmo.setup:
	source $(BASELOC)/vars/$(ARCH)
	$(BASELOC)/cosmo-setup
	touch $@

%.built: cosmo.setup
	source $(BASELOC)/vars/$(ARCH)
	cd %
	chmod +x superconfigure
	./superconfigure >/dev/null
	touch $@
	cd $(BASELOC)

readline-8.2.built: ncurses-6.4.built

wget-1.21.built: openssl-1.1.1u.built libuuid-1.0.3.built\
	libyaml-0.2.5.built xz-5.4.3.built

cpy311-datasette.built: ncurses-6.4.built readline-8.2.built\
	openssl-1.1.1u.built gdbm-1.23.built libuuid-1.0.3.built\
	libyaml-0.2.5.built xz-5.4.3.built

cpy311-pypack.built: ncurses-6.4.built readline-8.2.built\
	openssl-1.1.1u.built gdbm-1.23.built libuuid-1.0.3.built\
	libyaml-0.2.5.built xz-5.4.3.built

cli: wget-1.21.built

python: cpy311-datasette.built cpy311-pypack1.built

all: python cli

clean:
	find . -name "*.built" | xargs rm -f
	rm -f $(BASELOC)/cosmo.setup

.PHONY: all python cli clean
