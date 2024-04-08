
LINKS_SRC := http://links.twibright.com/download/links-2.29.tar.gz

LINKS_DEPS := lib/ncurses lib/openssl lib/libuuid \
			  compress/brotli

LINKS_CONFIG_ARGS = --prefix=$$(COSMOS)\
    --with-ssl=$$(COSMOS)/ssl --disable-ipv6 \
    --datadir=/zip/usr/share --sysconfdir=/zip/usr/share\
    --without-openmp  --without-svgalib  --without-x\
    --without-fb      --without-directfb --without-pmshell\
    --without-windows --without-atheos   --without-haiku\
    --without-grx     --without-freetype --without-libjpeg\
    --without-libtiff --without-librsvg --without-libwebp\
    --without-libavif --disable-graphics --without-gpm\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,web/links,$(LINKS_SRC)))
$(eval $(call SPECIFY_DEPS,web/links,$(LINKS_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,web/links,$(LINKS_CONFIG_ARGS),$(LINKS_CONFIG_ARGS)))

o/web/links/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/web/links/built.fat: BINS = links ssl usr/share/terminfo
