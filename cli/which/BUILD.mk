WHICH_SRC := https://mirrors.ocf.berkeley.edu/gnu/which/which-2.23.tar.gz
WHICH_CONFIG_ARGS := --prefix="$$(COSMOS)"

$(eval $(call DOWNLOAD_SOURCE,cli/which,$(WHICH_SRC)))
$(eval $(call AUTOTOOLS_BUILD,cli/which,$(WHICH_CONFIG_ARGS),$(WHICH_CONFIG_ARGS)))

o/cli/which/built.fat: BINS = which
