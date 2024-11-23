
GNUPG_SRC := https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.6.tar.bz2

GNUPG_DEPS := lib/pinentry lib/npth lib/libgpg-error lib/libgcrypt lib/libksba \
	lib/readline lib/ncurses cosmo-repo/base lib/gnutls

GNUPG_CONFIG_ARGS = --prefix="$$(COSMOS)"\
					CFLAGS="-Os" \
					--enable-static --disable-shared \
					--without-pic --disable-doc \
					--disable-libdns --disable-exec \
					--disable-ldap --disable-rpath \
					--disable-nls --disable-tests \
					--disable-dirmngr

$(eval $(call DOWNLOAD_SOURCE,web/gnupg,$(GNUPG_SRC)))
$(eval $(call SPECIFY_DEPS,web/gnupg,$(GNUPG_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,web/gnupg,$(GNUPG_CONFIG_ARGS),$(GNUPG_CONFIG_ARGS)))

o/web/gnupg/built.fat: FATTEN_COMMAND = $(BASELOC)/web/gnupg/fatten
