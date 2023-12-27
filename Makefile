
export SHELL:=bash
export BASELOC:=$(shell pwd)
export COSMO:=$(BASELOC)/cosmopolitan
export COSMOCC:=$(COSMO)/cosmocc
export COSMOS_X86_64:=$(BASELOC)/cosmos/x86_64
export COSMOS_AARCH64:=$(BASELOC)/cosmos/aarch64
export RESULTS:=$(BASELOC)/results
export ZIPCOPY:=$(COSMO)/o/tool/build/zipcopy.com
export APELINK:=$(COSMO)/o/tool/build/apelink.com

include config/common.mk
include config/functions.mk

include cosmo-repo/BUILD.mk
include lib/BUILD.mk

include cli/BUILD.mk
include compiler/BUILD.mk
include compress/BUILD.mk
include editor/BUILD.mk
include web/BUILD.mk
include python/BUILD.mk
include gui/BUILD.mk

clean:
	rm -rf o/
