
LESS_SRC := https://ftp.gnu.org/gnu/less/less-643.tar.gz 

LESS_CONFIG_ARGS = --prefix=$$(COSMOS) CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,cli/less,$(LESS_SRC)))
$(eval $(call SPECIFY_DEPS,cli/less,lib/readline lib/ncurses))
$(eval $(call AUTOTOOLS_BUILD,cli/less,$(LESS_CONFIG_ARGS),$(LESS_CONFIG_ARGS)))

o/cli/less/.built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/cli/less/.built.fat: BINS = less usr/share/terminfo
