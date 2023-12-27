
XCB_PROTO_SRC := https://www.x.org/archive/individual/proto/xcb-proto-1.16.0.tar.gz
XCB_PROTO_DEPS := gui/util-macros

XCB_PROTO_CONFIG_ARGS = --disable-shared --enable-static\
    --without-pic --prefix="$$(COSMOS)"\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,gui/xcb-proto,$(XCB_PROTO_SRC)))
$(eval $(call SPECIFY_DEPS,gui/xcb-proto,$(XCB_PROTO_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,gui/xcb-proto,$(XCB_PROTO_CONFIG_ARGS),$(XCB_PROTO_CONFIG_ARGS)))

o/gui/xcb-proto/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
