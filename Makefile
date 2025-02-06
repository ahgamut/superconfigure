
export SHELL:=bash
export BASELOC:=$(shell pwd)
export COSMO:=$(BASELOC)/cosmopolitan
export COSMOCC:=$(COSMO)/cosmocc
export COSMOS_X86_64:=$(BASELOC)/cosmos/x86_64
export COSMOS_AARCH64:=$(BASELOC)/cosmos/aarch64
export RESULTS:=$(BASELOC)/results
export ZIPCOPY:=$(COSMO)/o/tool/build/zipcopy
export APELINK:=$(COSMO)/o/tool/build/apelink

# basic functions
include config/variables.mk
include config/errlog.mk
include config/rules.mk
include config/functions.mk

# recipes for each subfolder
include cosmo-repo/BUILD.mk
include lib/BUILD.mk
include cli/BUILD.mk
include compiler/BUILD.mk
include compress/BUILD.mk
include editor/BUILD.mk
include games/BUILD.mk
include web/BUILD.mk
include python/BUILD.mk
include gui/BUILD.mk
include lang/BUILD.mk

# recipe for cosmos
include cosmo-repo/cosmos.mk

# custom recipes here
include custom.mk

clean-results:
	echo "removing APE binaries in the results/ folder"
	rm -rf results/bin results/libexec

clean-cosmos:
	echo "removing files from cosmos"
	find cosmos -type f -delete

clean: clean-cosmos clean-results
	echo "removing the o/ folder"
	rm -rf o/

build-clean: clean-cosmo clean-results
	find o -name 'x86_64' | grep 'build/x86_64' | xargs rm -rf
	find o -name 'aarch64' | grep 'build/aarch64' | xargs rm -rf
	find o -name 'deps.x86_64' -delete
	find o -name 'deps.aarch64' -delete
	find o -name 'configured.x86_64' -delete
	find o -name 'configured.aarch64' -delete
	find o -name 'built.x86_64' -delete
	find o -name 'built.aarch64' -delete
	find o -name 'installed.x86_64' -delete
	find o -name 'installed.aarch64' -delete
	find o -name 'built.fat' -delete

distclean: clean
	git clean -f -d -x

.PHONY: clean distclean build-clean clean-cosmos clean-results
