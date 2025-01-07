
TMUX_SRC := https://github.com/tmux/tmux/archive/refs/tags/3.3a.tar.gz 
TMUX_DEPS := lib/ncurses lib/libevent

$(eval $(call DOWNLOAD_SOURCE,cli/tmux,$(TMUX_SRC)))
$(eval $(call SPECIFY_DEPS,cli/tmux,$(TMUX_DEPS)))

o/cli/tmux/setup: o/cli/tmux/patched
	cd $(BASELOC)/o/cli/tmux/tmux* && ./autogen.sh $(ERRLOG)
	touch $@

o/cli/tmux/configured.x86_64: o/cli/tmux/setup
o/cli/tmux/configured.aarch64: o/cli/tmux/setup

o/cli/tmux/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/cli/tmux/config-wrapper
o/cli/tmux/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/cli/tmux/config-wrapper

o/cli/tmux/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/cli/tmux/built.fat: BINS = tmux usr/share/terminfo
