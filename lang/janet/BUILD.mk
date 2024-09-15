
o/lang/janet/downloaded: \
	DL_COMMAND = rm -rf janet && git clone --quiet --depth=1 --branch=v1.34.0 https://github.com/janet-lang/janet

o/lang/janet/checked: CHECK_COMMAND = $(DUMMYLINK0)
o/lang/janet/patched: PATCH_COMMAND = $(DUMMYLINK0)

o/lang/janet/configured.x86_64: \
	CONFIG_COMMAND = cp -r $(BASELOC)/o/lang/janet/janet/* ./

o/lang/janet/configured.aarch64: \
	CONFIG_COMMAND = cp -r $(BASELOC)/o/lang/janet/janet/* ./

o/lang/janet/built.x86_64: \
	BUILD_COMMAND = make PREFIX=$(COSMOS) HAS_SHARED=0 JANET_NO_AMALG=1

o/lang/janet/built.aarch64: \
	BUILD_COMMAND = make PREFIX=$(COSMOS) HAS_SHARED=0 JANET_NO_AMALG=1

o/lang/janet/installed.x86_64: \
	INSTALL_COMMAND = cp build/janet $(COSMOS)/bin/

o/lang/janet/installed.aarch64: \
	INSTALL_COMMAND = cp build/janet $(COSMOS)/bin/

o/lang/janet/built.fat: \
	BINS = janet
