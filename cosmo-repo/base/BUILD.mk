
o/cosmo-repo/base/downloaded: DL_COMMAND = $(DUMMYLINK0)
o/cosmo-repo/base/checked: CHECK_COMMAND = $(DUMMYLINK0)
o/cosmo-repo/base/patched: PATCH_COMMAND = $(DUMMYLINK0)

o/cosmo-repo/base/configured.x86_64: CONFIG_COMMAND = $(DUMMYLINK0)
o/cosmo-repo/base/configured.aarch64: CONFIG_COMMAND = $(DUMMYLINK0)

o/cosmo-repo/base/built.x86_64: BUILD_COMMAND = $(BASELOC)/cosmo-repo/base/build-wrapper
o/cosmo-repo/base/built.aarch64: BUILD_COMMAND = $(BASELOC)/cosmo-repo/base/build-wrapper

o/cosmo-repo/base/installed.x86_64: INSTALL_COMMAND = $(BASELOC)/cosmo-repo/base/install-wrapper
o/cosmo-repo/base/installed.aarch64: INSTALL_COMMAND = $(BASELOC)/cosmo-repo/base/install-wrapper

o/cosmo-repo/base/built.aarch64: o/cosmo-repo/base/installed.x86_64

o/cosmo-repo/base/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
