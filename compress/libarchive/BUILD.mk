
LIBARCHIVE_SRC := https://github.com/libarchive/libarchive/releases/download/v3.8.0/libarchive-3.8.0.tar.gz

LIBARCHIVE_CONFIG_ARGS = -DCMAKE_INSTALL_PREFIX=$$(COSMOS)\
	-DENABLE_ACL=OFF -DENABLE_XATTR=OFF\
	-DENABLE_TEST=OFF -DBUILD_SHARED_LIBS=OFF\
	-DENABLE_OPENSSL=OFF\
    -DENABLE_CPIO_SHARED=OFF -DENABLE_CAT_SHARED=OFF -DENABLE_TAR_SHARED=OFF\
	-DCMAKE_IGNORE_PREFIX_PATH="/usr/;/usr/include"\
    -DCMAKE_C_FLAGS="-Os"

LIBARCHIVE_DEPS := cosmo-repo/base cosmo-repo/compress\
	lib/libxml2 lib/libexpat lib/pcre compress/lz4

$(eval $(call DOWNLOAD_SOURCE,compress/libarchive,$(LIBARCHIVE_SRC)))
$(eval $(call SPECIFY_DEPS,compress/libarchive,$(LIBARCHIVE_DEPS)))
$(eval $(call CMAKE_BUILD,compress/libarchive,$(LIBARCHIVE_CONFIG_ARGS),$(LIBARCHIVE_CONFIG_ARGS)))

o/compress/libarchive/built.fat: BINS = bsdtar bsdcpio bsdcat bsdunzip
