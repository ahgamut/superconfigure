
LIBUUID_SRC := https://sourceforge.net/projects/libuuid/files/libuuid-1.0.3.tar.gz/download 

LIBUUID_CONFIG_ARGS =  --enable-static --disable-shared\
    --without-pic --with-gnu-ld\
    --prefix=$$(COSMOS)\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/libuuid,$(LIBUUID_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/libuuid,$(LIBUUID_CONFIG_ARGS),$(LIBUUID_CONFIG_ARGS)))

o/lib/libuuid/.built.fat: APELINKPLS = echo "nothing"
