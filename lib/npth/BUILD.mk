
NPTH_SRC := https://gnupg.org/ftp/gcrypt/npth/npth-1.8.tar.bz2

NPTH_CONFIG_ARGS = --prefix="$$(COSMOS)"\
					CFLAGS="-Os" \
					--enable-static --disable-shared \
					--without-pic


$(eval $(call DOWNLOAD_SOURCE,lib/npth,$(NPTH_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/npth,$(NPTH_CONFIG_ARGS),$(NPTH_CONFIG_ARGS)))

o/lib/npth/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
