

OPENSSL_SRC := https://github.com/openssl/openssl/archive/refs/tags/OpenSSL_1_1_1u.tar.gz 

# no $$ here because we're not calling the AUTOTOOLS_BUILD function

OPENSSL_CONFIG_ARGS = no-shared no-asm\
    no-dso no-dynamic-engine no-engine no-pic\
    no-autoalginit no-autoerrinit\
    --with-rand-seed=getrandom\
    --openssldir=/zip/ssl\
    CFLAGS="-Os"\
    --prefix=$(COSMOS) linux-$(ARCH)

$(eval $(call DOWNLOAD_SOURCE,lib/openssl,$(OPENSSL_SRC)))
$(eval $(call SPECIFY_DEPS,lib/openssl,lib/certs))

o/lib/openssl/configured.x86_64:\
	CONFIG_COMMAND = ../../openssl*/Configure $(OPENSSL_CONFIG_ARGS)

o/lib/openssl/configured.aarch64:\
	CONFIG_COMMAND = ../../openssl*/Configure $(OPENSSL_CONFIG_ARGS)

o/lib/openssl/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
