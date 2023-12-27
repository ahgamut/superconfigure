
include gui/libX11/BUILD.mk
include gui/libXau/BUILD.mk
include gui/libxcb/BUILD.mk
include gui/libXext/BUILD.mk
include gui/xcb-proto/BUILD.mk
include gui/xorgproto/BUILD.mk
include gui/xtrans/BUILD.mk
include gui/util-macros/BUILD.mk
include gui/SDL2/BUILD.mk

gui:\
	o/gui/libX11/built.fat \
	o/gui/libXext/built.fat \
	o/gui/SDL2/built.fat
.PHONY: gui
