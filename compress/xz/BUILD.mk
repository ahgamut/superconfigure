
XZ_SRC := https://sourceforge.net/projects/lzmautils/files/xz-5.4.3.tar.gz/download 

$(eval $(call DOWNLOAD_SOURCE,compress/xz,$(XZ_SRC)))

XZ_CONFIG_ARGS =  --prefix=$$(COSMOS)\
    --enable-shared=no --enable-static=yes\
    --disable-nls --disable-rpath\
    --without-pic --with-gnu-ld\
    --enable-sandbox=no\
    --sysconfdir=$$(COSMOS) --datarootdir=$$(COSMOS)/share\
    CFLAGS="-Os -std=gnu99"

$(eval $(call AUTOTOOLS_BUILD,compress/xz,$(XZ_CONFIG_ARGS),$(XZ_CONFIG_ARGS)))

o/compress/xz/built.fat: BINS = xz
