

MPC_SRC := https://ftp.gnu.org/gnu/mpc/mpc-1.3.0.tar.gz 

MPC_CONFIG_ARGS =  --prefix=$$(COSMOS)\
    --disable-shared --disable-dependency-tracking --disable-silent-rules

$(eval $(call DOWNLOAD_SOURCE,lib/mpc,$(MPC_SRC)))
$(eval $(call SPECIFY_DEPS,lib/mpc,lib/gmp lib/mpfr lib/isl))
$(eval $(call AUTOTOOLS_BUILD,lib/mpc,$(MPC_CONFIG_ARGS),$(MPC_CONFIG_ARGS)))

o/lib/mpc/.built.fat: APELINKPLS = echo "nothing"
