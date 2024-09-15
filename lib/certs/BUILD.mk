
o/lib/certs/downloaded: DL_COMMAND = $(BASELOC)/lib/certs/certs-to-zip.sh
o/lib/certs/checked: CHECK_COMMAND = $(DUMMYLINK0)
o/lib/certs/patched: PATCH_COMMAND = $(DUMMYLINK0)

o/lib/certs/configured.x86_64: CONFIG_COMMAND = $(DUMMYLINK0)
o/lib/certs/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/lib/certs/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)

o/lib/certs/configured.aarch64: CONFIG_COMMAND = $(DUMMYLINK0)
o/lib/certs/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)
o/lib/certs/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/lib/certs/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
