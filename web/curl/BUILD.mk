
CURL_SRC := https://github.com/curl/curl/releases/download/curl-8_10_1/curl-8.10.1.tar.gz

CURL_DEPS := \
	lib/openssl lib/libssh2 lib/libpsl \
	compress/brotli \
	cosmo-repo/compress cosmo-repo/base

$(eval $(call DOWNLOAD_SOURCE,web/curl,$(CURL_SRC)))
$(eval $(call SPECIFY_DEPS,web/curl,$(CURL_DEPS)))

o/web/curl/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/web/curl/config-wrapper
o/web/curl/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/web/curl/config-wrapper

o/web/curl/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/web/curl/built.fat: BINS = curl usr/share/ssl
