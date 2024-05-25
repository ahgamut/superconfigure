
include cli/bash/BUILD.mk
include cli/bc/BUILD.mk
include cli/coreutils/BUILD.mk
include cli/dash/BUILD.mk
include cli/diffutils/BUILD.mk
include cli/findutils/BUILD.mk
include cli/grep/BUILD.mk
include cli/jq/BUILD.mk
include cli/less/BUILD.mk
include cli/make/BUILD.mk
include cli/ninja/BUILD.mk
include cli/patch/BUILD.mk
include cli/sed/BUILD.mk
include cli/tmux/BUILD.mk
include cli/zsh/BUILD.mk

cli: \
	o/cosmo-repo/cli/built.fat\
	o/cli/bash/built.fat \
	o/cli/bc/built.fat \
	o/cli/coreutils/built.fat \
	o/cli/dash/built.fat \
	o/cli/diffutils/built.fat \
	o/cli/findutils/built.fat \
	o/cli/grep/built.fat \
	o/cli/jq/built.fat \
	o/cli/less/built.fat \
	o/cli/make/built.fat \
	o/cli/ninja/built.fat \
	o/cli/patch/built.fat \
	o/cli/sed/built.fat \
	o/cli/tmux/built.fat \
	o/cli/zsh/built.fat

.PHONY: cli
