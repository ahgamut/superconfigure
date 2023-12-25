
include cli/less/BUILD.mk

cli: \
	o/cosmo-repo/cli/built.fat\
	o/cli/less/built.fat

.PHONY: cli
