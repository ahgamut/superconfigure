
GMP_SRC := https://ftp.gnu.org/gnu/gmp/gmp-6.3.0.tar.xz 

GMP_CONFIG_ARGS = --prefix=$$(COSMOS)\
    --disable-shared --disable-dependency-tracking\
    --disable-silent-rules --enable-fat\
    --build=$$(ARCH)-linux-gnu

$(eval $(call DOWNLOAD_SOURCE,lib/gmp,$(GMP_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/gmp,$(GMP_CONFIG_ARGS),$(GMP_CONFIG_ARGS)))

o/lib/gmp/.built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
