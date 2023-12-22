

include config/common.mk
include config/functions.mk

include lib/ncurses/BUILD.mk
include lib/readline/BUILD.mk

clean:
	rm -rf o/
