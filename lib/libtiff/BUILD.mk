
# Documentation: https://libtiff.gitlab.io/libtiff/
LIBTIFF_SRC := https://gitlab.com/libtiff/libtiff/-/archive/v4.6.0/libtiff-v4.6.0.tar.gz

LIBTIFF_CONFIG_ARGS = --enable-static --disable-shared\
    --disable-tests --disable-docs --disable-sphinx\
    --prefix=$$(COSMOS) --sysconfdir=/zip/etc --datarootdir=/zip/usr/share\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/libtiff,$(LIBTIFF_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/libtiff,$(LIBTIFF_CONFIG_ARGS),$(LIBTIFF_CONFIG_ARGS)))

o/lib/libtiff/setup: o/lib/libtiff/patched
	cd $(BASELOC)/o/lib/libtiff/libtiff-* && ./autogen.sh
	touch $@

o/lib/libtiff/configured.x86_64: o/lib/libtiff/setup
o/lib/libtiff/configured.aarch64: o/lib/libtiff/setup

o/lib/libtiff/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
