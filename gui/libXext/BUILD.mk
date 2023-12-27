
LIBXEXT_SRC := https://www.x.org/archive/individual/lib/libXext-1.3.5.tar.gz 
LIBXEXT_DEPS := gui/libX11

LIBXEXT_CONFIG_ARGS = --disable-shared --enable-static\
    --without-pic --prefix="$$(COSMOS)"\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,gui/libXext,$(LIBXEXT_SRC)))
$(eval $(call SPECIFY_DEPS,gui/libXext,$(LIBXEXT_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,gui/libXext,$(LIBXEXT_CONFIG_ARGS),$(LIBXEXT_CONFIG_ARGS)))

o/gui/libXext/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
