
# http://www.libpng.org/
# https://github.com/pnggroup/libpng
LIBPNG_SRC := https://sourceforge.net/projects/libpng/files/libpng16/1.6.43/libpng-1.6.43.tar.gz/download

LIBPNG_CONFIG_ARGS = --enable-static --disable-shared\
    --disable-tests --disable-tools\
    --prefix=$$(COSMOS) --sysconfdir=/zip/etc --datarootdir=/zip/usr/share\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/libpng,$(LIBPNG_SRC)))
$(eval $(call SPECIFY_DEPS,lib/libpng,cosmo-repo/compress))
$(eval $(call AUTOTOOLS_BUILD,lib/libpng,$(LIBPNG_CONFIG_ARGS),$(LIBPNG_CONFIG_ARGS)))

o/lib/libpng/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
