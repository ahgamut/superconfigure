
# Documentation from https://gitlab.gnome.org/GNOME/libxml2
LIBXML2_SRC := https://gitlab.gnome.org/GNOME/libxml2/-/archive/v2.12.6/libxml2-v2.12.6.tar.gz

LIBXML2_CONFIG_ARGS = --enable-static --disable-shared\
    --with-debug=no --with-zlib=no --with-lzma=no --with-sax1=no --with-python=no\
    --sysconfdir=/zip/etc --datarootdir=/zip/usr/share\
    --prefix=$(COSMOS) CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/libxml2,$(LIBXML2_SRC)))
# $(eval $(call AUTOTOOLS_BUILD,lib/libxml2,$(LIBXML2_CONFIG_ARGS),$(LIBXML2_CONFIG_ARGS)))

o/lib/libxml2/configured.x86_64: \
	CONFIG_COMMAND = cp -r $(BASELOC)/o/lib/libxml2/libxml2*/* ./ && ./autogen.sh $(LIBXML2_CONFIG_ARGS)
o/lib/libxml2/configured.aarch64: \
	CONFIG_COMMAND = cp -r $(BASELOC)/o/lib/libxml2/libxml2*/* ./ && ./autogen.sh $(LIBXML2_CONFIG_ARGS)

o/lib/libxml2/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
