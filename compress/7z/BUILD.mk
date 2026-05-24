
7Z_SRC := https://github.com/ip7z/7zip/releases/download/26.01/7z2601-src.tar.xz

$(eval $(call DOWNLOAD_SOURCE,compress/7z,$(7Z_SRC)))

o/compress/7z/checked: \
	CHECK_COMMAND = $(BASELOC)/compress/7z/check_sha.sh

o/compress/7z/configured.x86_64: \
	CONFIG_COMMAND = $(BASELOC)/compress/7z/config-wrapper

o/compress/7z/configured.aarch64: \
	CONFIG_COMMAND = $(BASELOC)/compress/7z/config-wrapper

o/compress/7z/built.x86_64: \
	BUILD_COMMAND = $(BASELOC)/compress/7z/build-wrapper

o/compress/7z/built.aarch64: \
	BUILD_COMMAND = $(BASELOC)/compress/7z/build-wrapper

o/compress/7z/installed.x86_64: \
	INSTALL_COMMAND = $(BASELOC)/compress/7z/install-wrapper

o/compress/7z/installed.aarch64: \
	INSTALL_COMMAND = $(BASELOC)/compress/7z/install-wrapper

o/compress/7z/built.fat: BINS = 7z
