
TAR_SRC := https://ftp.gnu.org/gnu/tar/tar-1.35.tar.gz 

TAR_CONFIG_ARGS =  --prefix=$$(COSMOS)\
    --disable-acl --disable-nls --disable-rpath\
    --without-posix-acls --without-selinux\
    --with-packager="cosmo" --without-xattrs\
    --with-gzip=gzip --with-bzip2=bzip2\
    --with-xz=xz --with-zstd=zstd\
    --datarootdir=/zip/usr/share\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,compress/tar,$(TAR_SRC)))
$(eval $(call SPECIFY_DEPS,compress/tar,compress/zlib compress/xz compress/brotli compress/gzip))
$(eval $(call AUTOTOOLS_BUILD,compress/tar,$(TAR_CONFIG_ARGS),$(TAR_CONFIG_ARGS)))

o/compress/tar/.build.fat: BINS = tar
