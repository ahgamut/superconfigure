

LIBEVENT_SRC := \
	https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz 

LIBEVENT_CONFIG_ARGS = --cache-file=config.cache --prefix=$$(COSMOS)\
    --disable-shared --disable-dependency-tracking\
    --disable-silent-rules --without-pic\
    --disable-libevent-regress --disable-verbose-debug\
    --disable-samples\
    --disable-malloc-replacement --disable-openssl\
    --disable-debug-mode --enable-function-sections\
    --build=$$(ARCH)-linux-gnu

$(eval $(call DOWNLOAD_SOURCE,lib/libevent,$(LIBEVENT_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/libevent,$(LIBEVENT_CONFIG_ARGS),$(LIBEVENT_CONFIG_ARGS)))

o/lib/libevent/.built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
