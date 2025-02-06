TESSERACT_SRC := https://github.com/tesseract-ocr/tesseract/archive/refs/tags/5.5.0.tar.gz
TESSERACT_DEPS := lib/libpng lib/giflib lib/libjpeg\
	lib/libtiff lib/libwebp cosmo-repo/base\
	lib/leptonica

TESSERACT_CONFIG_ARGS = --prefix=$$(COSMOS) \
	CFLAGS="-Os -Wno-implicit-function-declaration" \
	LEPTONICA_CFLAGS="-I$$(COSMOS)/include -I$$(COSMOS)/include/leptonica"\
	LEPTONICA_LIBS="-L$$(COSMOS)/lib -lleptonica -lgif -lpng -ljpeg -ltiff -lwebp"\
	--disable-shared\
	--enable-static\
	--disable-tessdata-prefix\
	--disable-openmp\
	--without-curl\
	--without-pic\
	--without-archive

$(eval $(call DOWNLOAD_SOURCE,cli/tesseract,$(TESSERACT_SRC)))
$(eval $(call SPECIFY_DEPS,cli/tesseract,$(TESSERACT_DEPS)))

o/cli/tesseract/setup: o/cli/tesseract/patched
	cd $(BASELOC)/o/cli/tesseract/tesseract* && ./autogen.sh $(ERRLOG)
	touch $@

o/cli/tesseract/configured.x86_64: o/cli/tesseract/setup
o/cli/tesseract/configured.aarch64: o/cli/tesseract/setup

$(eval $(call AUTOTOOLS_BUILD,cli/tesseract,$(TESSERACT_CONFIG_ARGS),$(TESSERACT_CONFIG_ARGS)))

o/cli/tesseract/built.fat: BINS = tesseract
