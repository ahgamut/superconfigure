
GNUTLS_SRC := https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.10.tar.xz 

$(eval $(call DOWNLOAD_SOURCE,lib/gnutls,$(GNUTLS_SRC)))
$(eval $(call SPECIFY_DEPS,lib/gnutls,lib/nettle compress/brotli))

o/lib/gnutls/.configured.x86_64:\
	CONFIG_COMMAND = $(BASELOC)/lib/gnutls/config-wrapper

o/lib/gnutls/.configured.aarch64:\
	CONFIG_COMMAND = $(BASELOC)/lib/gnutls/config-wrapper

o/lib/gnutls/.built.fat: APELINKPLS = echo "nothing"
