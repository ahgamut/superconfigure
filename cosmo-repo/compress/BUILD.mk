
o/cosmo-repo/compress/downloaded: DL_COMMAND = $(DUMMYLINK0)
o/cosmo-repo/compress/checked: CHECK_COMMAND = $(DUMMYLINK0)
o/cosmo-repo/compress/patched: PATCH_COMMAND = $(DUMMYLINK0)

$(eval $(call SPECIFY_DEPS,cosmo-repo/compress,cosmo-repo/base))

o/cosmo-repo/compress/configured.x86_64: CONFIG_COMMAND = $(DUMMYLINK0)
o/cosmo-repo/compress/configured.aarch64: CONFIG_COMMAND = $(DUMMYLINK0)

o/cosmo-repo/compress/built.x86_64: BUILD_COMMAND = $(BASELOC)/cosmo-repo/compress/build-wrapper
o/cosmo-repo/compress/built.aarch64: BUILD_COMMAND = $(BASELOC)/cosmo-repo/compress/build-wrapper

o/cosmo-repo/compress/built.aarch64: o/cosmo-repo/compress/installed.x86_64

o/cosmo-repo/compress/installed.x86_64: INSTALL_COMMAND = $(BASELOC)/cosmo-repo/compress/install-wrapper
o/cosmo-repo/compress/installed.aarch64: INSTALL_COMMAND = $(BASELOC)/cosmo-repo/compress/install-wrapper

o/cosmo-repo/compress/built.fat: BINS = bzip2 unzip zip zstd
