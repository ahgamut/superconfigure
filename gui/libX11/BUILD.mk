
LIBX11_SRC := https://www.x.org/archive/individual/lib/libX11-1.8.7.tar.gz
LIBX11_DEPS := gui/libxcb

LIBX11_CONFIG_ARGS = --disable-shared --enable-static\
    --without-pic --prefix="$$(COSMOS)"\
    --without-xmlto\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,gui/libX11,$(LIBX11_SRC)))
$(eval $(call SPECIFY_DEPS,gui/libX11,$(LIBX11_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,gui/libX11,$(LIBX11_CONFIG_ARGS),$(LIBX11_CONFIG_ARGS)))

o/gui/libX11/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
