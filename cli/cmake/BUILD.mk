
CMAKE_SRC := https://github.com/Kitware/CMake/releases/download/v4.0.3/cmake-4.0.3.tar.gz

CMAKE_DEPS := lib/openssl

CMAKE_CONFIG_ARGS = -DBUILD_SHARED_LIBS=OFF\
    -DCMAKE_BUILD_STATIC=ON\
	-DCMAKE_IGNORE_PREFIX_PATH="/usr/;/usr/include"\
    -DCMAKE_INSTALL_PREFIX="$$(COSMOS)"

$(eval $(call SPECIFY_DEPS,cli/cmake,$(CMAKE_DEPS)))
$(eval $(call DOWNLOAD_SOURCE,cli/cmake,$(CMAKE_SRC)))
$(eval $(call CMAKE_BUILD,cli/cmake,$(CMAKE_CONFIG_ARGS),$(CMAKE_CONFIG_ARGS)))

o/cli/cmake/built.fat: BINS = cmake
