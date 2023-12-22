

include config/common.mk
include config/functions.mk

include lib/ncurses/BUILD.mk
include lib/readline/BUILD.mk
include cli/less-643/BUILD.mk

include compress/BUILD.mk

clean:
	rm -rf o/
