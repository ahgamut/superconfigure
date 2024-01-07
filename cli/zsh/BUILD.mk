
ZSH_SRC := https://sourceforge.net/projects/zsh/files/zsh/5.9/zsh-5.9.tar.xz/download 
ZSH_DEPS := lib/ncurses lib/readline lib/gdbm lib/pcre

$(eval $(call DOWNLOAD_SOURCE,cli/zsh,$(ZSH_SRC)))
$(eval $(call SPECIFY_DEPS,cli/zsh,$(ZSH_DEPS)))

o/cli/zsh/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/cli/zsh/config-wrapper
o/cli/zsh/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/cli/zsh/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)

o/cli/zsh/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/cli/zsh/config-wrapper
o/cli/zsh/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)
o/cli/zsh/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/cli/zsh/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/cli/zsh/built.fat: BINS = zsh\
	usr/share/terminfo usr/share/zsh\
	etc/zshinit etc/zshenv etc/zshrc\
	etc/profile etc/login etc/logout
