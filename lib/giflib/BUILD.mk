
GIFLIB_SRC := https://sourceforge.net/projects/giflib/files/giflib-5.2.2.tar.gz/download

$(eval $(call DOWNLOAD_SOURCE,lib/giflib,$(GIFLIB_SRC)))

o/lib/giflib/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/lib/giflib/config-wrapper
o/lib/giflib/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/lib/giflib/config-wrapper

o/lib/giflib/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/lib/giflib/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)

o/lib/giflib/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)
o/lib/giflib/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/lib/giflib/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
