
ZLIB_SRC := https://github.com/madler/zlib/releases/download/v1.3/zlib-1.3.tar.gz 

ZLIB_CONFIG_ARGS = --static --64 --prefix=$$(COSMOS)\
    --includedir=$$(COSMOS)/include\
    --eprefix=$$(COSMOS)/bin --libdir=$$(COSMOS)/lib\
    --archs="-arch $$(ARCH)"

$(eval $(call DOWNLOAD_SOURCE,compress/zlib,$(ZLIB_SRC)))

$(eval $(call AUTOTOOLS_BUILD,compress/zlib,$(ZLIB_CONFIG_ARGS),$(ZLIB_CONFIG_ARGS)))

o/compress/zlib/.built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
