DIFFUTILS_SRC := https://ftp.gnu.org/gnu/diffutils/diffutils-3.10.tar.xz
DIFFUTILS_CONFIG_ARGS = --prefix=$$(COSMOS) CFLAGS="-Os -Wno-implicit-function-declaration" \
						--disable-nls --disable-rpath

$(eval $(call DOWNLOAD_SOURCE,cli/diffutils,$(DIFFUTILS_SRC)))
$(eval $(call AUTOTOOLS_BUILD,cli/diffutils,$(DIFFUTILS_CONFIG_ARGS),$(DIFFUTILS_CONFIG_ARGS)))

o/cli/diffutils/built.fat: BINS = diff diff3 sdiff cmp
