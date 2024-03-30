
WGET_SRC := https://ftp.gnu.org/gnu/wget/wget-1.21.tar.gz 

WGET_DEPS := \
	lib/openssl lib/libuuid \
	compress/brotli \
	cosmo-repo/compress cosmo-repo/base

$(eval $(call DOWNLOAD_SOURCE,web/wget,$(WGET_SRC)))
$(eval $(call SPECIFY_DEPS,web/wget,$(WGET_DEPS)))

o/web/wget/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/web/wget/config-wrapper
o/web/wget/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/web/wget/config-wrapper

o/web/wget/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/web/wget/built.fat: BINS = wget usr/share/ssl wgetrc
