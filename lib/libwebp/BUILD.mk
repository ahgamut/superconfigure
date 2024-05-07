
# Official repo: https://chromium.googlesource.com/webm/libwebp
LIBWEBP_SRC := https://github.com/webmproject/libwebp/archive/refs/tags/v1.3.2.tar.gz

LIBWEBP_CONFIG_ARGS = --enable-static --disable-shared\
    --disable-dependency-tracking --disable-libwebpextras\
    --disable-tiff --without-pic\
    --sysconfdir=/zip/etc --datarootdir=/zip/usr/share\
    --prefix=$$(COSMOS) CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/libwebp,$(LIBWEBP_SRC)))
$(eval $(call SPECIFY_DEPS,lib/libwebp,lib/libjpeg,lib/libpng))
$(eval $(call AUTOTOOLS_BUILD,lib/libwebp,$(LIBWEBP_CONFIG_ARGS),$(LIBWEBP_CONFIG_ARGS)))

o/lib/libwebp/setup: o/lib/libwebp/patched
	cd $(BASELOC)/o/lib/libwebp/libwebp-* && ./autogen.sh
	touch $@

o/lib/libwebp/configured.x86_64: o/lib/libwebp/setup
o/lib/libwebp/configured.aarch64: o/lib/libwebp/setup

o/lib/libwebp/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
