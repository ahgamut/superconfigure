
GMAKE_SRC := https://ftp.gnu.org/gnu/make/make-4.4.tar.gz 

GMAKE_CONFIG_ARGS = --prefix="$$(COSMOS)"\
    --disable-nls --disable-rpath \
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,cli/make,$(GMAKE_SRC)))
$(eval $(call AUTOTOOLS_BUILD,cli/make,$(GMAKE_CONFIG_ARGS),$(GMAKE_CONFIG_ARGS)))

o/cli/make/installed.x86_64: INSTALL_COMMAND = cp ./make $(COSMOS)/bin/gmake
o/cli/make/installed.aarch64: INSTALL_COMMAND = cp ./make $(COSMOS)/bin/gmake

o/cli/make/built.fat: BINS = gmake
