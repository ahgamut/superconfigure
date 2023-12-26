
FINDUTILS_SRC := https://ftp.gnu.org/gnu/findutils/findutils-4.9.0.tar.xz 
FINDUTILS_DEPS := cosmo-repo/base
FINDUTILS_BINS := find locate xargs

$(eval $(call DOWNLOAD_SOURCE,cli/findutils,$(FINDUTILS_SRC)))
$(eval $(call SPECIFY_DEPS,cli/findutils,$(FINDUTILS_DEPS)))

o/cli/findutils/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/cli/findutils/config-wrapper
o/cli/findutils/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/cli/findutils/config-wrapper

o/cli/findutils/built.fat: BINS = $(FINDUTILS_BINS)
