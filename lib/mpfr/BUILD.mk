

MPFR_SRC := https://ftp.gnu.org/gnu/mpfr/mpfr-4.2.0.tar.xz 

MPFR_CONFIG_ARGS = --prefix=$$(COSMOS)\
    --disable-shared --disable-dependency-tracking --disable-silent-rules

$(eval $(call DOWNLOAD_SOURCE,lib/mpfr,$(MPFR_SRC)))
$(eval $(call SPECIFY_DEPS,lib/mpfr,lib/gmp cosmo-repo/base cosmo-repo/compress))
$(eval $(call AUTOTOOLS_BUILD,lib/mpfr,$(MPFR_CONFIG_ARGS),$(MPFR_CONFIG_ARGS)))

o/lib/mpfr/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
