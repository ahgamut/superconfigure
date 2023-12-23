
NANO_SRC := https://www.nano-editor.org/dist/v7/nano-7.2.tar.gz 

$(eval $(call DOWNLOAD_SOURCE,editor/nano,$(NANO_SRC)))
$(eval $(call SPECIFY_DEPS,editor/nano,lib/ncurses lib/readline))

o/editor/nano/.configured.x86_64:\
	CONFIG_COMMAND = $(BASELOC)/editor/nano/config-wrapper

o/editor/nano/.configured.aarch64:\
	CONFIG_COMMAND = $(BASELOC)/editor/nano/config-wrapper

o/editor/nano/.built.fat: \
	BINS = nano
