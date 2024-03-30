
TAR_SRC := https://ftp.gnu.org/gnu/tar/tar-1.35.tar.gz 

$(eval $(call DOWNLOAD_SOURCE,compress/tar,$(TAR_SRC)))
$(eval $(call SPECIFY_DEPS,compress/tar,cosmo-repo/base compress/brotli compress/gzip cosmo-repo/compress))

o/compress/tar/configured.x86_64:\
	CONFIG_COMMAND = $(BASELOC)/compress/tar/config-wrapper

o/compress/tar/configured.aarch64:\
	CONFIG_COMMAND = $(BASELOC)/compress/tar/config-wrapper

o/compress/tar/built.fat: BINS = tar
