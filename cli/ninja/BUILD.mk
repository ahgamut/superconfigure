
NINJA_SRC := https://github.com/ninja-build/ninja/archive/refs/tags/v1.11.1.tar.gz
NINJA_CONFIG_ARGS = -DCMAKE_BUILD_SHARED=OFF\
    -DCMAKE_BUILD_STATIC=ON\
	-DCMAKE_CXX_FLAGS="-std=c++20"\
    -DCMAKE_INSTALL_PREFIX="$$(COSMOS)"

$(eval $(call DOWNLOAD_SOURCE,cli/ninja,$(NINJA_SRC)))
$(eval $(call CMAKE_BUILD,cli/ninja,$(NINJA_CONFIG_ARGS),$(NINJA_CONFIG_ARGS)))

o/cli/ninja/built.fat: BINS = ninja
