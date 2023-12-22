
LESS_SRC := https://ftp.gnu.org/gnu/less/less-643.tar.gz 

LESS_CONFIG_ARGS = --prefix=$$(COSMOS) CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,cli/less-643,$(LESS_SRC)))
$(eval $(call SPECIFY_DEPS,cli/less-643,lib/readline lib/ncurses))
$(eval $(call AUTOTOOLS_BUILD,cli/less-643,$(LESS_CONFIG_ARGS),$(LESS_CONFIG_ARGS)))
