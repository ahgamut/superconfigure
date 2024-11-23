LIBASSUAN_SRC := https://gnupg.org/ftp/gcrypt/libassuan/libassuan-3.0.1.tar.bz2

LIBASSUAN_DEPS := lib/npth lib/libgpg-error lib/libgcrypt lib/libksba

LIBASSUAN_CONFIG_ARGS = --prefix="$$(COSMOS)"\
					CFLAGS="-Os" \
					--enable-static --disable-shared \
					--without-pic \
					--disable-asm --disable-dev-random \
					--disable-doc

$(eval $(call DOWNLOAD_SOURCE,lib/libassuan,$(LIBASSUAN_SRC)))
$(eval $(call SPECIFY_DEPS,lib/libassuan,$(LIBASSUAN_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,lib/libassuan,$(LIBASSUAN_CONFIG_ARGS),$(LIBASSUAN_CONFIG_ARGS)))

o/lib/libassuan/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
