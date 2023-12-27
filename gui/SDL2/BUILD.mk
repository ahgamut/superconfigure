
SDL2_SRC := https://github.com/libsdl-org/SDL/releases/download/release-2.28.5/SDL2-2.28.5.tar.gz 
SDL2_DEPS := gui/libXext gui/libX11

SDL2_BINS := checkkeys testgeometry testdraw2\
			 testscale testrendercopyex testsprite2\
			 testbounds testmessage

$(eval $(call DOWNLOAD_SOURCE,gui/SDL2,$(SDL2_SRC)))
$(eval $(call SPECIFY_DEPS,gui/SDL2,$(SDL2_DEPS)))

o/gui/SDL2/setup: o/gui/SDL2/patched
	cd $(BASELOC)/o/gui/SDL2/SDL2* && aclocal --force && autoconf --force
	touch $@

o/gui/SDL2/configured.x86_64: o/gui/SDL2/setup
o/gui/SDL2/configured.aarch64: o/gui/SDL2/setup

o/gui/SDL2/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/gui/SDL2/config-wrapper
o/gui/SDL2/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/gui/SDL2/config-wrapper

o/gui/SDL2/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/gui/SDL2/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)

o/gui/SDL2/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)
o/gui/SDL2/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/gui/SDL2/built.fat: BINS = $(SDL2_BINS)
