
LIBSSH2_SRC := https://github.com/libssh2/libssh2/releases/download/libssh2-1.11.0/libssh2-1.11.0.tar.gz 

LIBSSH2_CONFIG_ARGS = --enable-static --disable-shared\
    --with-crypto=openssl --with-libssl-prefix=$$(COSMOS)/lib\
    --without-pic --with-gnu-ld --disable-rpath\
    --disable-tests --disable-examples-build --disable-werror\
    --prefix=$$(COSMOS) --sysconfdir=/zip/etc --datarootdir=/zip/usr/share\
    CFLAGS="-Os -Wno-implicit-function-declaration"

$(eval $(call DOWNLOAD_SOURCE,lib/libssh2,$(LIBSSH2_SRC)))
$(eval $(call SPECIFY_DEPS,lib/libssh2,lib/openssl))
$(eval $(call AUTOTOOLS_BUILD,lib/libssh2,$(LIBSSH2_CONFIG_ARGS),$(LIBSSH2_CONFIG_ARGS)))

o/lib/libssh2/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
