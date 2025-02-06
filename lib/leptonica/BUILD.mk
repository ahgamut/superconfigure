
LEPTONICA_SRC := https://github.com/DanBloomberg/leptonica/releases/download/1.85.0/leptonica-1.85.0.tar.gz
LEPTONICA_DEPS := lib/libpng lib/giflib lib/libjpeg lib/libtiff lib/libwebp cosmo-repo/base
LEPTONICA_CONFIG_ARGS = -DCMAKE_BUILD_SHARED=OFF\
	-DBUILD_SHARED_LIBS=OFF\
    -DCMAKE_INSTALL_OLDINCLUDEDIR="$$(COSMOS)/include"\
    -DC_INCLUDE_DIRS="$$(COSMOS)/include" \
    -DCMAKE_PREFIX_PATH="$$(COSMOS)" \
	-DCMAKE_C_FLAGS="-Os -Wno-int-conversion"\
	-DCMAKE_CXX_FLAGS="-Os -Wno-int-conversion -Wno-implicit-function-declaration"\
    -DCMAKE_INSTALL_PREFIX="$$(COSMOS)"

$(eval $(call DOWNLOAD_SOURCE,lib/leptonica,$(LEPTONICA_SRC)))
$(eval $(call SPECIFY_DEPS,lib/leptonica,$(LEPTONICA_DEPS)))
$(eval $(call CMAKE_BUILD,lib/leptonica,$(LEPTONICA_CONFIG_ARGS),$(LEPTONICA_CONFIG_ARGS)))

o/lib/leptonica/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
