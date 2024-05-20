FONTCONFIG_SRC := https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.14.0.tar.gz
FONTCONFIG_DEPS := lib/freetype lib/libexpat lib/libxml2

FONTCONFIG_CONFIG_ARGS = --enable-static --disable-shared\
					   --prefix=$$(COSMOS) --sysconfdir=/zip/etc --datarootdir=/zip/usr/share\
    					CFLAGS="-Os"

o/lib/fontconfig/setup: o/lib/fontconfig/patched
	cd $(BASELOC)/o/lib/fontconfig/fontconfig* && autoreconf -fi
	touch $@

o/lib/fontconfig/configured.x86_64: o/lib/fontconfig/setup
o/lib/fontconfig/configured.aarch64: o/lib/fontconfig/setup

$(eval $(call DOWNLOAD_SOURCE,lib/fontconfig,$(FONTCONFIG_SRC)))
$(eval $(call SPECIFY_DEPS,lib/fontconfig,$(FONTCONFIG_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,lib/fontconfig,$(FONTCONFIG_CONFIG_ARGS),$(FONTCONFIG_CONFIG_ARGS)))

o/lib/fontconfig/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
