LIBPNG_SRC := https://download.sourceforge.net/libpng/libpng-1.6.43.tar.gz

LIBPNG_CONFIG_ARGS = --prefix=$$(COSMOS)\
    --disable-shared --enable-static\
	--disable-arm-neon\
    --without-pic --with-gnu-ld\
    --disable-rpath\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/libpng,$(LIBPNG_SRC)))
$(eval $(call SPECIFY_DEPS,lib/libpng,cosmo-repo/base))
$(eval $(call AUTOTOOLS_BUILD,lib/libpng,$(LIBPNG_CONFIG_ARGS),$(LIBPNG_CONFIG_ARGS)))

o/lib/libpng/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
