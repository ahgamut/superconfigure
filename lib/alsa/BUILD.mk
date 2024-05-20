ALSA_SRC := https://github.com/alsa-project/alsa-lib/archive/refs/tags/v1.2.11.tar.gz

ALSA_CONFIG_ARGS = --enable-static --disable-shared\
    --sysconfdir=/zip/etc --datarootdir=/zip/usr/share\
	--disable-aload --disable-mixer \
	--disable-pcm --disable-rawmidi \
	--disable-hwdep --disable-seq \
	--disable-ucm --disable-topology \
	--disable-python --disable-old-symbols \
    --prefix=$$(COSMOS) CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/alsa,$(ALSA_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/alsa,$(ALSA_CONFIG_ARGS),$(ALSA_CONFIG_ARGS)))

o/lib/alsa/setup: o/lib/alsa/patched
	cd $(BASELOC)/o/lib/alsa/alsa* && autoreconf -fi
	touch $@

o/lib/alsa/configured.x86_64: o/lib/alsa/setup
o/lib/alsa/configured.aarch64: o/lib/alsa/setup

o/lib/alsa/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
