
SOX_SRC := https://sourceforge.net/projects/sox/files/sox/14.4.2/sox-14.4.2.tar.bz2/download

SOX_DEPS := lib/libvorbis lib/libogg lib/flac lib/lame lib/libmad

SOX_CONFIG_ARGS = --prefix=$$(COSMOS) --datarootdir=/zip/share\
    --disable-shared --enable-static --disable-dependency-tracking\
	--without-pic --disable-stack-protector\
    --build=$$(ARCH)-linux-gnu\
	CFLAGS="-Wno-implicit-function-declaration -Wno-int-conversion"

$(eval $(call DOWNLOAD_SOURCE,cli/sox,$(SOX_SRC)))
$(eval $(call SPECIFY_DEPS,cli/sox,$(SOX_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,cli/sox,$(SOX_CONFIG_ARGS),$(SOX_CONFIG_ARGS)))

o/cli/sox/built.fat: BINS = sox
