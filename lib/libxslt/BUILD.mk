
# Documentation from https://gitlab.gnome.org/GNOME/libxslt
LIBXSLT_SRC := https://gitlab.gnome.org/GNOME/libxslt/-/archive/v1.1.39/libxslt-v1.1.39.tar.gz

LIBXSLT_CONFIG_ARGS = --enable-static --disable-shared\
    --with-debug=no --with-tests=no --with-debugger=no --with-profiler=no \
    --with-crypto=no --with-python=no\
    --sysconfdir=/zip --datarootdir=/zip/usr/share\
    --prefix=$$(COSMOS) CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/libxslt,$(LIBXSLT_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/libxslt,$(LIBXSLT_CONFIG_ARGS),$(LIBXSLT_CONFIG_ARGS)))

o/lib/libxslt/setup: o/lib/libxslt/patched
	cd $(BASELOC)/o/lib/libxslt/libxslt* && ./autogen.sh
	touch $@

o/lib/libxslt/configured.x86_64: o/lib/libxslt/setup
o/lib/libxslt/configured.aarch64: o/lib/libxslt/setup

o/lib/libxslt/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
