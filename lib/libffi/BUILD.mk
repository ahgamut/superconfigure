
LIBFFI_SRC := https://github.com/libffi/libffi/releases/download/v3.4.2/libffi-3.4.2.tar.gz 

LIBFFI_CONFIG_ARGS = --prefix=$$(COSMOS)\
    --disable-shared --enable-static\
    --without-pic --with-gnu-ld\
    --disable-exec-static-tramp\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/libffi,$(LIBFFI_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/libffi,$(LIBFFI_CONFIG_ARGS),$(LIBFFI_CONFIG_ARGS)))

o/lib/libffi/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
