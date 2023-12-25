
RSYNC_SRC := https://github.com/WayneD/rsync/archive/refs/tags/v3.2.7.tar.gz 
RSYNC_DEPS := lib/openssl cosmo-repo/base cosmo-repo/compress

$(eval $(call DOWNLOAD_SOURCE,web/rsync,$(RSYNC_SRC)))
$(eval $(call SPECIFY_DEPS,web/rsync,$(RSYNC_DEPS)))

o/web/rsync/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/web/rsync/config-wrapper
o/web/rsync/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/web/rsync/config-wrapper

o/web/rsync/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/web/rsync/built.fat: BINS = rsync usr/share/ssl
