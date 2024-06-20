
LUNZIP_SRC := https://download.savannah.gnu.org/releases/lzip/lunzip/lunzip-1.14.tar.gz

$(eval $(call DOWNLOAD_SOURCE,compress/lunzip,$(LUNZIP_SRC)))

LUNZIP_CONFIG_ARGS =  --prefix=$$(COSMOS)\
    --sysconfdir=/zip --datarootdir=/zip/usr/share\
    CC="$$(CC)" CXX="$$(CXX)" CXXFLAGS="-Os -fexceptions"

$(eval $(call AUTOTOOLS_BUILD,compress/lunzip,$(LUNZIP_CONFIG_ARGS),$(LUNZIP_CONFIG_ARGS)))

o/compress/lunzip/built.fat: BINS = lunzip
