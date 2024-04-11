BC_SRC := https://github.com/gavinhoward/bc/releases/download/6.7.5/bc-6.7.5.tar.xz 

BC_CONFIG_ARGS = --prefix="$$(COSMOS)"\
    --disable-nls \
    --disable-extra-math \
    CFLAGS="-Os"
$(eval $(call DOWNLOAD_SOURCE,cli/bc,$(BC_SRC)))
$(eval $(call AUTOTOOLS_BUILD,cli/bc,$(BC_CONFIG_ARGS),$(BC_CONFIG_ARGS)))

o/cli/bc/built.fat: BINS = bc #dc
