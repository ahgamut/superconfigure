
LZLIB_SRC := https://download.savannah.gnu.org/releases/lzip/lzlib/lzlib-1.14.tar.gz

$(eval $(call DOWNLOAD_SOURCE,compress/lzlib,$(LZLIB_SRC)))

LZLIB_CONFIG_ARGS =  --prefix=$$(COSMOS)\
	--disable-shared --enable-static\
    --sysconfdir=/zip --datarootdir=/zip/usr/share\
    CC="$$(CC)" CXX="$$(CXX)" CXXFLAGS="-Os -fexceptions"

$(eval $(call AUTOTOOLS_BUILD,compress/lzlib,$(LZLIB_CONFIG_ARGS),$(LZLIB_CONFIG_ARGS)))

o/compress/lzlib/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
