
NANO_SRC := https://www.nano-editor.org/dist/v8/nano-8.4.tar.gz 

$(eval $(call DOWNLOAD_SOURCE,editor/nano,$(NANO_SRC)))
$(eval $(call SPECIFY_DEPS,editor/nano,lib/ncurses lib/readline))

o/editor/nano/configured.x86_64:\
	CONFIG_COMMAND = $(BASELOC)/editor/nano/config-wrapper

o/editor/nano/configured.aarch64:\
	CONFIG_COMMAND = $(BASELOC)/editor/nano/config-wrapper

o/editor/nano/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/editor/nano/built.fat: \
	BINS = nano share/terminfo share/nano
