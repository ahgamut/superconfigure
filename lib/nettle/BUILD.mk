

NETTLE_SRC := https://mirrors.ocf.berkeley.edu/gnu/nettle/nettle-3.9.tar.gz 

NETTLE_CONFIG_ARGS = --disable-shared --enable-fat\
    --disable-openssl --disable-assembler\
    --libdir="$$(COSMOS)/lib" --prefix="$$(COSMOS)"\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/nettle,$(NETTLE_SRC)))
$(eval $(call SPECIFY_DEPS,lib/nettle,lib/gmp))
$(eval $(call AUTOTOOLS_BUILD,lib/nettle,$(NETTLE_CONFIG_ARGS),$(NETTLE_CONFIG_ARGS)))

o/lib/nettle/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
