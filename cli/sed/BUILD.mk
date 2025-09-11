
SED_SRC := https://mirrors.ocf.berkeley.edu/gnu/sed/sed-4.9.tar.gz 

SED_CONFIG_ARGS = --prefix="$$(COSMOS)"\
    --disable-silent-rules --disable-dependency-tracking \
    --disable-assert --disable-gcc-warnings \
    --disable-nls --disable-rpath --disable-acl \
    --without-selinux --with-gnu-ld=yes\
    --without-libiconv-prefix\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,cli/sed,$(SED_SRC)))
$(eval $(call AUTOTOOLS_BUILD,cli/sed,$(SED_CONFIG_ARGS),$(SED_CONFIG_ARGS)))

o/cli/sed/built.fat: BINS = sed
