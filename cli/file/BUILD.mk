FILE_SRC := https://github.com/file/file/archive/refs/tags/FILE5_46.tar.gz

$(eval $(call DOWNLOAD_SOURCE,cli/file,$(FILE_SRC)))

o/cli/file/setup: o/cli/file/patched
	cd $(BASELOC)/o/cli/file/file-* && autoreconf -fi $(ERRLOG) && autoconf $(ERRLOG)
	touch $@

o/cli/file/configured.x86_64: o/cli/file/setup
o/cli/file/configured.aarch64: o/cli/file/setup

FILE_CONFIG_ARGS = --disable-shared --prefix=$$(COSMOS)

$(eval $(call AUTOTOOLS_BUILD,cli/file,$(FILE_CONFIG_ARGS),$(FILE_CONFIG_ARGS)))

o/cli/file/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/cli/file/built.fat: BINS = file share/misc
