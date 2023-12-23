

GDBM_SRC := https://ftp.gnu.org/gnu/gdbm/gdbm-1.23.tar.gz 

GDBM_CONFIG_ARGS =  --prefix=$$(COSMOS)\
    --disable-memory-mapped-io --enable-libgdbm-compat\
    --disable-shared --enable-static\
    --disable-nls --disable-rpath\
    --without-pic --with-gnu-ld --without-readline\
    --sysconfdir=/zip --datarootdir=/zip/usr/share\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/gdbm,$(GDBM_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/gbdm,$(GDBM_CONFIG_ARGS),$(GDBM_CONFIG_ARGS)))

o/lib/gdbm/.built.fat: APELINKPLS = echo "nothing"
