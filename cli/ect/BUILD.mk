
ECT_SRC := https://github.com/fhanau/Efficient-Compression-Tool
ECT_DEPS := lib/libpng

ECT_CONFIG_ARGS = -DCMAKE_BUILD_SHARED=OFF\
	-DCMAKE_POLICY_VERSION_MINIMUM=3.10 \
    -DCMAKE_BUILD_STATIC=ON\
	-DCMAKE_CXX_FLAGS="-std=c++14"\
	-DTARGET_ARCH="$(ARCH)" \
    -DCMAKE_INSTALL_PREFIX="$(COSMOS)"


o/cli/ect/downloaded: \
	DL_COMMAND = rm -rf Efficient-Compression-Tool \
	&& git clone --quiet --depth=1 \
		 --branch v0.9.5 --single-branch \
		--recursive https://github.com/fhanau/Efficient-Compression-Tool

o/cli/ect/checked: CHECK_COMMAND = $(DUMMYLINK0)
o/cli/ect/patched: PATCH_FILE = $(BASELOC)/cli/ect/minimal.diff

o/cli/ect/configured.x86_64: \
	CONFIG_COMMAND = cmake -G Ninja $(BASELOC)/o/cli/ect/Efficient-Compression-Tool/src $(ECT_CONFIG_ARGS)
o/cli/ect/configured.aarch64: \
	CONFIG_COMMAND = cmake -G Ninja $(BASELOC)/o/cli/ect/Efficient-Compression-Tool/src $(ECT_CONFIG_ARGS)

o/cli/ect/built.x86_64: BUILD_COMMAND = ninja -j$(MAXPROC)
o/cli/ect/built.aarch64: BUILD_COMMAND = ninja -j$(MAXPROC)

o/cli/ect/installed.x86_64: INSTALL_COMMAND = ninja install -j$(MAXPROC)
o/cli/ect/installed.aarch64: INSTALL_COMMAND = ninja install -j$(MAXPROC)

$(eval $(call SPECIFY_DEPS,cli/ect,$(ECT_DEPS)))

o/cli/ect/built.fat: \
	BINS = ect
