
BASH_SRC := https://ftp.gnu.org/gnu/bash/bash-5.2.tar.gz 
BASH_DEPS := lib/ncurses lib/readline

$(eval $(call DOWNLOAD_SOURCE,cli/bash,$(BASH_SRC)))
$(eval $(call SPECIFY_DEPS,cli/bash,$(BASH_DEPS)))

o/cli/bash/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/cli/bash/config-wrapper
o/cli/bash/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/cli/bash/config-wrapper

o/cli/bash/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/cli/bash/built.fat: BINS = bash usr/share/terminfo
