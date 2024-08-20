LIBVORBIS_SRC := https://downloads.xiph.org/releases/vorbis/libvorbis-1.3.7.tar.xz

LIBVORBIS_DEPS := lib/libogg

LIBVORBIS_CONFIG_ARGS = --prefix=$$(COSMOS)\
    --disable-shared --disable-dependency-tracking\
    --build=$$(ARCH)-linux-gnu

$(eval $(call DOWNLOAD_SOURCE,lib/libvorbis,$(LIBVORBIS_SRC)))
$(eval $(call SPECIFY_DEPS,lib/libvorbis,$(LIBVORBIS_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,lib/libvorbis,$(LIBVORBIS_CONFIG_ARGS),$(LIBVORBIS_CONFIG_ARGS)))

o/lib/libvorbis/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
