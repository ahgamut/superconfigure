LIBSODIUM_SRC := https://github.com/jedisct1/libsodium/releases/download/1.0.20-RELEASE/libsodium-1.0.20.tar.gz

LIBSODIUM_CONFIG_ARGS = --without-libtool --disable-shared\
	--disable-ssp --disable-asm --disable-pie\
    --prefix=$$(COSMOS) CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/libsodium,$(LIBSODIUM_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/libsodium,$(LIBSODIUM_CONFIG_ARGS),$(LIBSODIUM_CONFIG_ARGS)))

o/lib/libsodium/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
