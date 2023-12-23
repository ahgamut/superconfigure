

include config/common.mk
include config/functions.mk

include lib/BUILD.mk
include compress/BUILD.mk
include editor/BUILD.mk

include cli/less/BUILD.mk

clean:
	rm -rf o/
