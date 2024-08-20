
LAME_SRC := https://sourceforge.net/projects/lame/files/lame/3.100/lame-3.100.tar.gz/download

LAME_CONFIG_ARGS = --prefix=$$(COSMOS)\
    --disable-shared --disable-dependency-tracking\
	--disable-nasm --without-pic\
	--with-fileio=lame\
    --build=$$(ARCH)-linux-gnu

$(eval $(call DOWNLOAD_SOURCE,lib/lame,$(LAME_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/lame,$(LAME_CONFIG_ARGS),$(LAME_CONFIG_ARGS)))

o/lib/lame/built.fat: BINS = lame
