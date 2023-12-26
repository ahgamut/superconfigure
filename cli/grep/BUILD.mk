
GREP_SRC := https://ftp.gnu.org/gnu/grep/grep-3.11.tar.gz 
GREP_DEPS := lib/ncurses lib/readline lib/pcre
GREP_CONFIG_ARGS =  --prefix="$$(COSMOS)"\
    CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,cli/grep,$(GREP_SRC)))
$(eval $(call SPECIFY_DEPS,cli/grep,$(GREP_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,cli/grep,$(GREP_CONFIG_ARGS),$(GREP_CONFIG_ARGS)))

o/cli/grep/built.fat: BINS = grep
