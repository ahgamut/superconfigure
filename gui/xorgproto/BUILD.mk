
XORGPROTO_SRC := https://www.x.org/archive/individual/proto/xorgproto-2023.2.tar.gz 
XORGPROTO_DEPS := gui/util-macros

XORGPROTO_CONFIG_ARGS = --disable-shared --enable-static\
    --without-pic --prefix="$$(COSMOS)"\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,gui/xorgproto,$(XORGPROTO_SRC)))
$(eval $(call SPECIFY_DEPS,gui/xorgproto,$(XORGPROTO_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,gui/xorgproto,$(XORGPROTO_CONFIG_ARGS),$(XORGPROTO_CONFIG_ARGS)))

o/gui/xorgproto/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
