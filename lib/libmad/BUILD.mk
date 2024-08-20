

LIBMAD_SRC := https://sourceforge.net/projects/mad/files/libmad/0.15.1b/libmad-0.15.1b.tar.gz/download

LIBMAD_CONFIG_ARGS = --prefix=$$(COSMOS)\
    --disable-shared --disable-dependency-tracking\
    --build=$$(ARCH)-linux-gnu

o/lib/libmad/setup: o/lib/libmad/patched
	@cd $(BASELOC)/o/lib/libmad/libmad*/ && autoreconf -fvi || true
	touch $@

o/lib/libmad/configured.x86_64: o/lib/libmad/setup
o/lib/libmad/configured.aarch64: o/lib/libmad/setup

$(eval $(call DOWNLOAD_SOURCE,lib/libmad,$(LIBMAD_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/libmad,$(LIBMAD_CONFIG_ARGS),$(LIBMAD_CONFIG_ARGS)))

o/lib/libmad/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
