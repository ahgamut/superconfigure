
GZIP_SRC := https://ftp.gnu.org/gnu/gzip/gzip-1.13.tar.gz

GZIP_CONFIG_ARGS = --prefix=$$(COSMOS) --datarootdir=/zip/usr/share CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,compress/gzip,$(GZIP_SRC)))
$(eval $(call SPECIFY_DEPS,compress/gzip,cosmo-repo/base))
$(eval $(call AUTOTOOLS_BUILD,compress/gzip,$(GZIP_CONFIG_ARGS),$(GZIP_CONFIG_ARGS)))

o/compress/gzip/built.fat: BINS = gzip
