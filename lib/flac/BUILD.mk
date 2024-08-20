
FLAC_SRC := https://downloads.xiph.org/releases/flac/flac-1.4.3.tar.xz

FLAC_CONFIG_ARGS = --prefix=$$(COSMOS)\
    --disable-shared --enable-static --disable-dependency-tracking\
	--disable-asm-optimizations\
	--disable-stack-smash-protection\
    --build=$$(ARCH)-linux-gnu\
	CFLAGS="-Os" CXXFLAGS="-Os -frtti"

$(eval $(call DOWNLOAD_SOURCE,lib/flac,$(FLAC_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/flac,$(FLAC_CONFIG_ARGS),$(FLAC_CONFIG_ARGS)))

o/lib/flac/built.fat: BINS = flac metaflac
