
# Documentation: https://gitlab.freedesktop.org/freetype/freetype
FREETYPE_SRC := https://download.savannah.gnu.org/releases/freetype/freetype-2.13.2.tar.gz
FREETYPE_DEPS := cosmo-repo/base cosmo-repo/compress

FREETYPE_CONFIG_ARGS = --enable-static --disable-shared --with-tests=no\
    --with-brotli=no --with-harfbuzz=no --with-png=no --with-librsvg=no\
    --prefix=$$(COSMOS) --sysconfdir=/zip/etc --datarootdir=/zip/usr/share\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/freetype,$(FREETYPE_SRC)))
$(eval $(call SPECIFY_DEPS,lib/freetype,$(FREETYPE_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,lib/freetype,$(FREETYPE_CONFIG_ARGS),$(FREETYPE_CONFIG_ARGS)))

o/lib/freetype/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
