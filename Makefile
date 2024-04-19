
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
include config/common.mk
include config/functions.mk

# recipes for each subfolder
include cosmo-repo/BUILD.mk
include lib/BUILD.mk
include cli/BUILD.mk
include compiler/BUILD.mk
include compress/BUILD.mk
include editor/BUILD.mk
include web/BUILD.mk
include python/BUILD.mk
include gui/BUILD.mk
include lang/BUILD.mk

# recipe for cosmos
include cosmo-repo/cosmos.mk

# custom recipes here
include custom.mk

zipclean:
	find /zip -mindepth 1 -delete

clean: zipclean
	rm -rf o/
	find cosmos -type f -delete
	rm -rf results/bin results/libexec

build-clean: zipclean
	find cosmos -type f -delete
	rm -rf results/bin results/libexec
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

distclean: clean zipclean
	git clean -f -d -x

.PHONY: clean distclean zipclean build-clean
