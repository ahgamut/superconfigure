
LIBPSL_SRC := https://github.com/rockdaboot/libpsl/releases/download/0.21.5/libpsl-0.21.5.tar.gz

LIBPSL_CONFIG_ARGS = --disable-shared --enable-static\
					 --prefix=$$(COSMOS)\
					 --sysconfdir=/zip/usr/share\
					 --datarootdir=/zip/usr/share\
					 --disable-runtime

$(eval $(call DOWNLOAD_SOURCE,lib/libpsl,$(LIBPSL_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/libpsl,$(LIBPSL_CONFIG_ARGS),$(LIBPSL_CONFIG_ARGS)))

o/lib/libpsl/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
