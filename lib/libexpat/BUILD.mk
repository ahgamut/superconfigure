
LIBEXPAT_SRC := https://github.com/libexpat/libexpat/releases/download/R_2_5_0/expat-2.5.0.tar.gz 

LIBEXPAT_CONFIG_ARGS =  --enable-static --disable-shared\
    --without-pic --with-gnu-ld\
    --disable-tests --disable-examples --without-docbook\
    --with-getrandom\
    --prefix=$(COSMOS) --sysconfdir=/zip/etc --datarootdir=/zip/usr/share \
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/libexpat,$(LIBEXPAT_SRC)))

o/lib/libexpat/.configured.x86_64:\
	CONFIG_COMMAND = ../../expat*/configure $(LIBEXPAT_CONFIG_ARGS)

o/lib/libexpat/.configured.aarch64:\
	CONFIG_COMMAND = ../../expat*/configure $(LIBEXPAT_CONFIG_ARGS)

o/lib/libexpat/.built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
