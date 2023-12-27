
LIBXAU_SRC := https://www.x.org/archive/individual/lib/libXau-1.0.11.tar.gz 
LIBXAU_DEPS := gui/xorgproto gui/xtrans

LIBXAU_CONFIG_ARGS = --disable-shared --enable-static\
    --without-pic --prefix="$$(COSMOS)"\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,gui/libXau,$(LIBXAU_SRC)))
$(eval $(call SPECIFY_DEPS,gui/libXau,$(LIBXAU_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,gui/libXau,$(LIBXAU_CONFIG_ARGS),$(LIBXAU_CONFIG_ARGS)))

o/gui/libXau/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
