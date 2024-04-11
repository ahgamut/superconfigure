
# Documentation: https://libtiff.gitlab.io/libtiff/
LIBTIFF_SRC := https://gitlab.com/libtiff/libtiff/-/archive/v4.6.0/libtiff-v4.6.0.tar.gz

LIBTIFF_CONFIG_ARGS = --enable-static --disable-shared\
    --disable-rpath --disable-tools --disable-contrib\
    --disable-docs --disable-sphinx\
    --sysconfdir=/zip/etc --datarootdir=/zip/usr/share\
    --prefix=$$(COSMOS) CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/libtiff,$(LIBTIFF_SRC)))
$(eval $(call SPECIFY_DEPS,lib/libtiff,lib/libjpeg))
$(eval $(call AUTOTOOLS_BUILD,lib/libtiff,$(LIBTIFF_CONFIG_ARGS),$(LIBTIFF_CONFIG_ARGS)))

o/lib/libtiff/setup: o/lib/libtiff/patched
	cd $(BASELOC)/o/lib/libtiff/libtiff-* && ./autogen.sh
	touch $@

o/lib/libtiff/configured.x86_64: o/lib/libtiff/setup
o/lib/libtiff/configured.aarch64: o/lib/libtiff/setup

o/lib/libtiff/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
