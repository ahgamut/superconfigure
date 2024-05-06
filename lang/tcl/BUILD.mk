
TCL_SRC := https://github.com/tcltk/tcl/archive/refs/tags/core-8-6-14.tar.gz
TCL_DEPS := cosmo-repo/base

TCL_CONFIG_ARGS = --prefix=$(COSMOS) --disable-shared \
				  --enable-static --enable-threads \
				  --disable-rpath --disable-load \
				  --enable--symbols --disable-langinfo \
				  --disable-dll-unloading

$(eval $(call DOWNLOAD_SOURCE,lang/tcl,$(TCL_SRC)))
$(eval $(call SPECIFY_DEPS,lang/tcl,$(TCL_DEPS)))

o/lang/tcl/configured.x86_64: \
	CONFIG_COMMAND = cp -r $(BASELOC)/o/lang/tcl/tcl*/* ./ && ./unix/configure $(TCL_CONFIG_ARGS)
o/lang/tcl/configured.aarch64: \
	CONFIG_COMMAND = cp -r $(BASELOC)/o/lang/tcl/tcl*/* ./ && ./unix/configure $(TCL_CONFIG_ARGS)

o/lang/tcl/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/lang/tcl/built.fat: BINS = tclsh8.6 tcl tcl8
