
DDRESCUE_SRC := https://mirrors.ocf.berkeley.edu/gnu/ddrescue/ddrescue-1.29.tar.lz

$(eval $(call DOWNLOAD_SOURCE,cli/ddrescue,$(DDRESCUE_SRC)))

DDRESCUE_CONFIG_ARGS = --prefix="$$(COSMOS)"\
    CFLAGS="-Os"

$(eval $(call AUTOTOOLS_BUILD,cli/ddrescue,$(DDRESCUE_CONFIG_ARGS),$(DDRESCUE_CONFIG_ARGS)))

o/cli/ddrescue/built.fat: BINS = ddrescue ddrescuelog
