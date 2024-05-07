
FRIBIDI_SRC := https://github.com/fribidi/fribidi/archive/refs/tags/v1.0.14.tar.gz

$(eval $(call DOWNLOAD_SOURCE,lib/fribidi,$(FRIBIDI_SRC)))

FRIBIDI_CONFIG_ARGS = --disable-shared --enable-static \
	--disable-docs \
    --without-pic --with-gnu-ld --prefix=$(COSMOS) CFLAGS="-Os"

o/lib/fribidi/configured.x86_64: CONFIG_COMMAND = \
	cp -r $(BASELOC)/o/lib/fribidi/fribidi-*/* ./ && \
		./autogen.sh $(FRIBIDI_CONFIG_ARGS)
o/lib/fribidi/configured.aarch64: CONFIG_COMMAND = \
	cp -r $(BASELOC)/o/lib/fribidi/fribidi-*/* ./ && \
		./autogen.sh $(FRIBIDI_CONFIG_ARGS)

o/lib/fribidi/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
