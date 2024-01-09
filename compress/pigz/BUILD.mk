
PIGZ_SRC := https://github.com/madler/pigz/archive/refs/tags/v2.8.tar.gz 

$(eval $(call DOWNLOAD_SOURCE,compress/pigz,$(PIGZ_SRC)))
$(eval $(call SPECIFY_DEPS,compress/pigz,compress/zlib))

o/compress/pigz/configured.x86_64: CONFIG_COMMAND = cp -r $(BASELOC)/o/compress/pigz/pigz*/* ./
o/compress/pigz/configured.aarch64: CONFIG_COMMAND = cp -r $(BASELOC)/o/compress/pigz/pigz*/* ./
o/compress/pigz/installed.x86_64: INSTALL_COMMAND = cp pigz $(COSMOS)/bin
o/compress/pigz/installed.aarch64: INSTALL_COMMAND = cp pigz $(COSMOS)/bin

o/compress/pigz/built.fat: BINS = pigz
