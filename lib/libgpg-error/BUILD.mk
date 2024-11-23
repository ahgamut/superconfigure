
LIBGPG_ERROR_SRC := https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.51.tar.bz2

LIBGPG_ERROR_CONFIG_ARGS = --prefix="$$(COSMOS)"\
					CFLAGS="-Os" \
					--enable-static --disable-shared \
					--without-pic \
					--disable-nls --disable-rpath \
					--disable-languages --disable-doc \
					--disable-tests \
					--without-readline


$(eval $(call DOWNLOAD_SOURCE,lib/libgpg-error,$(LIBGPG_ERROR_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/libgpg-error,$(LIBGPG_ERROR_CONFIG_ARGS),$(LIBGPG_ERROR_CONFIG_ARGS)))

o/lib/libgpg-error/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
