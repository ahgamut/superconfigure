
READLINE_SRC := https://mirrors.ocf.berkeley.edu/gnu/readline/readline-8.2.tar.gz

READLINE_CONFIG_ARGS = --disable-shared --enable-static\
    --enable-multibyte --prefix=$$(COSMOS)\
    --with-curses\
    CFLAGS="-Os -I$$(COSMOS)/include/ncurses"

$(eval $(call DOWNLOAD_SOURCE,lib/readline,$(READLINE_SRC)))
$(eval $(call SPECIFY_DEPS,lib/readline,lib/ncurses))
$(eval $(call AUTOTOOLS_BUILD,lib/readline,$(READLINE_CONFIG_ARGS),$(READLINE_CONFIG_ARGS)))

o/lib/readline/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
