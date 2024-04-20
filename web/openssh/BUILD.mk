
OPENSSH_SRC := https://github.com/openssh/openssh-portable/archive/refs/tags/V_9_7_P1.tar.gz
OPENSSH_DEPS := lib/openssl cosmo-repo/base

OPENSSH_CONFIG_ARGS = --prefix=$$(COSMOS) \
	--sysconfdir=/zip/etc/openssh \
    --disable-strip --disable-etc-default-login \
    --disable-fd-passing --disable-lastlog \
    --disable-utmp --disable-utmpx \
    --disable-wtmp --disable-wtmpx \
    --disable-libutil \
    --disable-pututline --disable-pututxline \
    --without-pie \
    --without-prngd-port --without-prngd-socket \
    --without-pam --without-sandbox \
    --without-selinux --without-kerberos5 \
    --with-privsep-path=/tmp/ssh-privsep --without-xauth \
    --without-maildir --with-pid-dir=/tmp/ssh-piddir \
    --without-shadow \
    --without-superuser-path --without-bsd-auth

o/web/openssh/setup: o/web/openssh/patched
	cd $(BASELOC)/o/web/openssh/openssh*/ && \
		autoreconf -fi && \
		sed -i 's/deflate (/_Cz_deflate (/g' ./configure

o/web/openssh/configured.x86_64: o/web/openssh/setup
o/web/openssh/configured.aarch64: o/web/openssh/setup

$(eval $(call DOWNLOAD_SOURCE,web/openssh,$(OPENSSH_SRC)))

$(eval $(call SPECIFY_DEPS,web/openssh,$(OPENSSH_DEPS)))

$(eval $(call AUTOTOOLS_BUILD,web/openssh,$(OPENSSH_CONFIG_ARGS),$(OPENSSH_CONFIG_ARGS)))

o/web/openssh/built.fat: FATTEN_COMMAND = $(BASELOC)/web/openssh/fatten
