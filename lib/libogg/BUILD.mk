
LIBOGG_SRC := https://downloads.xiph.org/releases/ogg/libogg-1.3.5.tar.xz

LIBOGG_CONFIG_ARGS = --prefix=$$(COSMOS)\
    --disable-shared --disable-dependency-tracking\
    --build=$$(ARCH)-linux-gnu

$(eval $(call DOWNLOAD_SOURCE,lib/libogg,$(LIBOGG_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/libogg,$(LIBOGG_CONFIG_ARGS),$(LIBOGG_CONFIG_ARGS)))

o/lib/libogg/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
