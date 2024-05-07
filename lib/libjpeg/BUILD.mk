
# Independent JPEG Group http://www.ijg.org/
LIBJPEG_SRC := http://www.ijg.org/files/jpegsrc.v9f.tar.gz

LIBJPEG_CONFIG_ARGS = --enable-static --disable-shared\
    --prefix=$(COSMOS) --sysconfdir=/zip/etc --datarootdir=/zip/usr/share\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/libjpeg,$(LIBJPEG_SRC)))

o/lib/libjpeg/configured.x86_64: \
	CONFIG_COMMAND = ../../jpeg-*/configure $(LIBJPEG_CONFIG_ARGS)
o/lib/libjpeg/configured.aarch64: \
	CONFIG_COMMAND = ../../jpeg-*/configure $(LIBJPEG_CONFIG_ARGS)

o/lib/libjpeg/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
