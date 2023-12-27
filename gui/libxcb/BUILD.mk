
LIBXCB_SRC := https://www.x.org/archive/individual/lib/libxcb-1.16.tar.gz 
LIBXCB_DEPS := gui/xcb-proto gui/libXau

LIBXCB_CONFIG_ARGS = --disable-shared --enable-static\
    --without-pic --prefix="$$(COSMOS)"\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,gui/libxcb,$(LIBXCB_SRC)))
$(eval $(call SPECIFY_DEPS,gui/libxcb,$(LIBXCB_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,gui/libxcb,$(LIBXCB_CONFIG_ARGS),$(LIBXCB_CONFIG_ARGS)))

o/gui/libxcb/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
