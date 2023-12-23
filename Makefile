

include config/common.mk
include config/functions.mk

include lib/BUILD.mk
include compress/BUILD.mk

include cli/less-643/BUILD.mk

clean:
	rm -rf o/
