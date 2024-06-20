
LZIP_SRC := https://download.savannah.gnu.org/releases/lzip/lzip-1.24.tar.gz

$(eval $(call DOWNLOAD_SOURCE,compress/lzip,$(LZIP_SRC)))

LZIP_CONFIG_ARGS =  --prefix=$$(COSMOS)\
    --sysconfdir=/zip --datarootdir=/zip/usr/share\
    CC="$$(CC)" CXX="$$(CXX)" CXXFLAGS="-Os -fexceptions"

$(eval $(call AUTOTOOLS_BUILD,compress/lzip,$(LZIP_CONFIG_ARGS),$(LZIP_CONFIG_ARGS)))

o/compress/lzip/built.fat: BINS = lzip
