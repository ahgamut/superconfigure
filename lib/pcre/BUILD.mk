
PCRE_SRC := https://github.com/PCRE2Project/pcre2/archive/refs/tags/pcre2-10.42.tar.gz 

# no $$ because we're not calling the AUTOTOOLS_BUILD function

PCRE_CONFIG_ARGS = --disable-shared --enable-static\
    --without-pic --prefix=$$(COSMOS)\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/pcre,$(PCRE_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/pcre,$(PCRE_CONFIG_ARGS),$(PCRE_CONFIG_ARGS)))

o/lib/pcre/setup: o/lib/pcre/patched
	cd $(BASELOC)/o/lib/pcre/pcre* && ./autogen.sh
	touch $@

o/lib/pcre/configured.x86_64: o/lib/pcre/setup
o/lib/pcre/configured.aarch64: o/lib/pcre/setup

o/lib/pcre/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
