
NASM_SRC := https://www.nasm.us/pub/nasm/releasebuilds/3.00/nasm-3.00.tar.bz2

$(eval $(call DOWNLOAD_SOURCE,cli/nasm,$(NASM_SRC)))

NASM_CONFIG_ARGS = --prefix="$$(COSMOS)"\
				   --disable-lto --disable-gc \
				   --disable-gdb \
				   --disable-pedantic \
				   CFLAGS="-Os"

$(eval $(call AUTOTOOLS_BUILD,cli/nasm,$(NASM_CONFIG_ARGS),$(NASM_CONFIG_ARGS)))

o/cli/nasm/built.fat: BINS = nasm ndisasm
