
LZ4_SRC := https://github.com/lz4/lz4/archive/refs/tags/v1.9.4.tar.gz

$(eval $(call DOWNLOAD_SOURCE,compress/lz4,$(LZ4_SRC)))

o/compress/lz4/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/compress/lz4/config-wrapper
o/compress/lz4/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/compress/lz4/config-wrapper

o/compress/lz4/built.fat: BINS = lz4
