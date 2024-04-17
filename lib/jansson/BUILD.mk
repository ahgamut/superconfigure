
JANSSON_SRC := https://github.com/akheron/jansson/releases/download/v2.14/jansson-2.14.tar.bz2

JANSSON_CONFIG_ARGS = --disable-shared --enable-static\
    --prefix=$$(COSMOS)\
	--disable-urandom --disable-windows-cryptoapi\
	--disable-Bsymbolic --without-pic\
    --sysconfdir=/zip --datarootdir=/zip/usr/share\
    CFLAGS="-Os"


$(eval $(call DOWNLOAD_SOURCE,lib/jansson,$(JANSSON_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/jansson,$(JANSSON_CONFIG_ARGS),$(JANSSON_CONFIG_ARGS)))

o/lib/jansson/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
