
XTRANS_SRC := https://www.x.org/archive/individual/lib/xtrans-1.5.0.tar.gz 
XTRANS_DEPS := gui/xorgproto

XTRANS_CONFIG_ARGS = --disable-shared --enable-static\
    --without-pic --prefix="$$(COSMOS)"\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,gui/xtrans,$(XTRANS_SRC)))
$(eval $(call SPECIFY_DEPS,gui/xtrans,$(XTRANS_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,gui/xtrans,$(XTRANS_CONFIG_ARGS),$(XTRANS_CONFIG_ARGS)))

o/gui/xtrans/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
