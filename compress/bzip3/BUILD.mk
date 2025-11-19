BZIP3_SRC := https://github.com/iczelia/bzip3/archive/refs/tags/1.5.3.tar.gz

BZIP3_CONFIG_ARGS = --prefix=$$(COSMOS) \
		--disable-shared\
		--enable-static\
		--enable-static-exe\
		CFLAGS="-Os"

o/compress/bzip3/setup: o/compress/bzip3/patched
	cd $(BASELOC)/o/compress/bzip3/bzip3* && autoreconf -fi
	touch $@

o/compress/bzip3/configured.x86_64: o/compress/bzip3/setup

o/compress/bzip3/configured.aarch64: o/compress/bzip3/setup

$(eval $(call DOWNLOAD_SOURCE,compress/bzip3,$(BZIP3_SRC)))
$(eval $(call AUTOTOOLS_BUILD,compress/bzip3,$(BZIP3_CONFIG_ARGS),$(BZIP3_CONFIG_ARGS)))

o/compress/bzip3/built.fat: BINS = bzip3
