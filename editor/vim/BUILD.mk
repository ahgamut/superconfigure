
VIM_SRC := https://github.com/vim/vim/archive/refs/tags/v9.0.1670.tar.gz 

$(eval $(call DOWNLOAD_SOURCE,editor/vim,$(VIM_SRC)))
$(eval $(call SPECIFY_DEPS,editor/vim,lib/ncurses lib/readline))

o/editor/vim/configured.x86_64:\
	CONFIG_COMMAND = $(BASELOC)/editor/vim/config-wrapper

o/editor/vim/configured.aarch64:\
	CONFIG_COMMAND = $(BASELOC)/editor/vim/config-wrapper

o/editor/vim/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/editor/vim/built.fat: \
	BINS = vim usr/share/terminfo usr/share/vim
