
GNUTLS_SRC := https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.10.tar.xz 

GNUTLS_CONFIG_ARGS = --sysconfdir=/zip --datarootdir=/zip/usr/share\
    --libexecdir=/zip/$$(ARCH) --prefix=$$(COSMOS)\
    --disable-shared --enable-static\
    --with-gnu-ld --disable-cxx\
    --disable-nls --disable-rpath --disable-tests\
    --disable-hardware-acceleration --disable-padlock\
    --disable-libdane --disable-guile\
    --disable-bash-tests --disable-doc\
    --without-p11-kit --without-tpm --without-tpm2\
    --with-included-libtasn1 --with-included-unistring\
    --enable-fat\
    --with-default-trust-store-file=/zip/usr/share/ssl/certs/ca-certificates.crt \
    --with-default-trust-store-dir=/zip/usr/share/ssl/certs \
    --with-default-trust-store-dir=/zip/usr/share/ssl/default.crl \
    --with-unbound-root-key-file=/zip/usr/share/unbound/root.key \
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/gnutls,$(GNUTLS_SRC)))
$(eval $(call SPECIFY_DEPS,lib/gnutls,lib/nettle compress/brotli))
$(eval $(call AUTOTOOLS_BUILD,lib/gnutls,$(GNUTLS_CONFIG_ARGS),$(GNUTLS_CONFIG_ARGS)))

o/lib/gnutls/.built.fat: APELINKPLS = echo "nothing"
