FILE_SRC := https://github.com/file/file/archive/refs/tags/FILE5_46.tar.gz

$(eval $(call DOWNLOAD_SOURCE,cli/file,$(FILE_SRC)))

o/cli/file/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/cli/file/config-wrapper
o/cli/file/installed.x86_64: INSTALL_COMMAND = cp ./file $(COSMOS)/bin

o/cli/file/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/cli/file/config-wrapper
o/cli/file/installed.aarch64: INSTALL_COMMAND = cp ./file $(COSMOS)/bin

o/cli/file/built.fat: BINS = file
