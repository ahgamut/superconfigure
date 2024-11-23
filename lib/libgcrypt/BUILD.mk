
LIBGCRYPT_SRC := https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.11.0.tar.bz2

LIBGCRYPT_DEPS := lib/npth lib/libgpg-error

LIBGCRYPT_CONFIG_ARGS = --prefix="$$(COSMOS)"\
					CFLAGS="-Os" \
					--enable-static --disable-shared \
					--without-pic \
					--disable-asm --disable-dev-random \
					--disable-doc

$(eval $(call DOWNLOAD_SOURCE,lib/libgcrypt,$(LIBGCRYPT_SRC)))
$(eval $(call SPECIFY_DEPS,lib/libgcrypt,$(LIBGCRYPT_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,lib/libgcrypt,$(LIBGCRYPT_CONFIG_ARGS),$(LIBGCRYPT_CONFIG_ARGS)))

o/lib/libgcrypt/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
