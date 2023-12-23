
PCRE_SRC := https://github.com/PCRE2Project/pcre2/archive/refs/tags/pcre2-10.42.tar.gz 

# no $$ because we're not calling the AUTOTOOLS_BUILD function

PCRE_CONFIG_ARGS = --disable-shared --enable-static\
    --without-pic --prefix=$(COSMOS)\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/pcre,$(PCRE_SRC)))

o/lib/pcre/.configured.x86_64: \
	CONFIG_COMMAND = cd ../../pcre*/ && ./autogen.sh && \
		cd ../build/x86_64/ && ../../pcre*/configure $(PCRE_CONFIG_ARGS)

o/lib/pcre/.configured.aarch64: o/lib/pcre/.configured.x86_64
o/lib/pcre/.configured.aarch64: \
	CONFIG_COMMAND = ../../pcre*/configure $(PCRE_CONFIG_ARGS)

o/lib/pcre/.built.fat: APELINKPLS = echo "nothing"
