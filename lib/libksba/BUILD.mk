
LIBKSBA_SRC := https://gnupg.org/ftp/gcrypt/libksba/libksba-1.6.7.tar.bz2

LIBKSBA_CONFIG_ARGS = --prefix="$$(COSMOS)"\
					CFLAGS="-Os" \
					--enable-static --disable-shared \
					--without-pic

LIBKSBA_DEPS := lib/libgpg-error lib/libgcrypt

$(eval $(call DOWNLOAD_SOURCE,lib/libksba,$(LIBKSBA_SRC)))
$(eval $(call SPECIFY_DEPS,lib/libksba,$(LIBKSBA_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,lib/libksba,$(LIBKSBA_CONFIG_ARGS),$(LIBKSBA_CONFIG_ARGS)))

o/lib/libksba/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
