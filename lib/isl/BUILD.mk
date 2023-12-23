
ISL_SRC := https://gcc.gnu.org/pub/gcc/infrastructure/isl-0.18.tar.bz2 

ISL_CONFIG_ARGS =  --prefix=$$(COSMOS)\
    --disable-shared --disable-dependency-tracking --disable-silent-rules\
    --enable-portable-binary

$(eval $(call DOWNLOAD_SOURCE,lib/isl,$(ISL_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/isl,$(ISL_CONFIG_ARGS),$(ISL_CONFIG_ARGS)))

o/lib/isl/.built.fat: APELINKPLS = echo "nothing"
