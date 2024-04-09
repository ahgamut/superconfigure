
LIBUNISTRING_SRC := https://ftp.gnu.org/gnu/libunistring/libunistring-1.2.tar.gz

LIBUNISTRING_CONFIG_ARGS = --prefix=$$(COSMOS)\
    --disable-shared --enable-static\
    --without-pic --with-gnu-ld\
    --disable-rpath\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/libunistring,$(LIBUNISTRING_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/libunistring,$(LIBUNISTRING_CONFIG_ARGS),$(LIBUNISTRING_CONFIG_ARGS)))

o/lib/libunistring/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
