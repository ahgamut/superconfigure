
BROTLI_SRC := https://github.com/google/brotli/archive/refs/tags/v1.1.0.tar.gz 
BROTLI_CONFIG_ARGS = -DCMAKE_INSTALL_PREFIX=$$(COSMOS)\
    -DBUILD_SHARED_LIBS=OFF\
    -DCMAKE_C_FLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,compress/brotli,$(BROTLI_SRC)))
$(eval $(call CMAKE_BUILD,compress/brotli,$(BROTLI_CONFIG_ARGS),$(BROTLI_CONFIG_ARGS)))

o/compress/brotli/built.fat: BINS = brotli
