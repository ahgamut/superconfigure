
PATCH_SRC := https://ftp.gnu.org/gnu/patch/patch-2.7.tar.gz
PATCH_CONFIG_ARGS = --prefix=$$(COSMOS) CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,cli/patch,$(PATCH_SRC)))
$(eval $(call AUTOTOOLS_BUILD,cli/patch,$(PATCH_CONFIG_ARGS),$(PATCH_CONFIG_ARGS)))

o/cli/patch/built.fat: BINS = patch
