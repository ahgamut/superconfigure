
LIBGC_SRC := https://github.com/ivmai/bdwgc/releases/download/v8.2.4/gc-8.2.4.tar.gz 

LIBGC_CONFIG_ARGS =  --prefix=$(COSMOS)\
    --disable-shared --enable-static\
    --without-pic --disable-cplusplus\
    --disable-gcj-support --enable-threads=posix\
    --enable-mmap --disable-dynamic-loading\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/libgc,$(LIBGC_SRC)))

o/lib/libgc/configured.x86_64:\
	CONFIG_COMMAND = $(BASELOC)/o/lib/libgc/gc*/configure $(LIBGC_CONFIG_ARGS)

o/lib/libgc/configured.aarch64:\
	CONFIG_COMMAND = $(BASELOC)/o/lib/libgc/gc*/configure $(LIBGC_CONFIG_ARGS)


o/lib/libgc/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
