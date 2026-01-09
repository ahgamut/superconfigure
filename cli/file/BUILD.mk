FILE_SRC := https://github.com/file/file/archive/refs/tags/FILE5_46.tar.gz

$(eval $(call DOWNLOAD_SOURCE,cli/file,$(FILE_SRC)))

o/cli/file/setup:
	cd $(BASELOC)/o/cli/file/file-* && autoreconf -fi $(ERRLOG) && autoconf $(ERRLOG)
	touch $@

o/cli/file/configured.x86_64: o/cli/file/setup
o/cli/file/configured.aarch64: o/cli/file/setup

o/cli/file/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/cli/file/config-wrapper
o/cli/file/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/cli/file/config-wrapper

o/cli/file/installed.x86_64: INSTALL_COMMAND = $(BASELOC)/cli/file/install-wrapper
o/cli/file/installed.aarch64: INSTALL_COMMAND = $(BASELOC)/cli/file/install-wrapper

o/cli/file/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/cli/file/built.fat: BINS = file share/misc
