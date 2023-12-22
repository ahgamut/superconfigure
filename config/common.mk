# Common Configuration Variables

export SHELL:=bash
export BASELOC:=$(shell pwd)
export COSMO:=$(BASELOC)/cosmopolitan
export COSMOCC:=$(COSMO)/cosmocc
export COSMOS_X86_64:=$(BASELOC)/cosmos/x86_64
export COSMOS_AARCH64:=$(BASELOC)/cosmos/aarch64
export RESULTS:=$(BASELOC)/results
export ZIPCOPY:=$(COSMO)/o/tool/build/zipcopy.com
export APELINK:=$(COSMO)/o/tool/build/apelink.com

ifeq ($(MAXPROC),)
export MAXPROC:=4
ifdef GITHUB_ACTIONS
export MAXPROC:=2
endif
endif

MKDIR:=$(shell which mkdir) -p

DL_COMMAND = $(BASELOC)/config/default_dl.sh
# if DL_FILE is not provided, this will error out

PATCH_COMMAND = $(BASELOC)/config/default_patch.sh
# PATCH_FILE defaults to minimal.diff in the right spot
# if minimal.diff doesn't exist, the above script is ok

CONFIG_COMMAND = echo "need to provide a CONFIG_COMMAND!" && exit 1
BUILD_COMMAND = make
INSTALL_COMMAND = $(BUILD_COMMAND) install

APELINKPLS:= $(BASELOC)/config/default_apelink.sh

# Specifying SECONDARY means none of the intermediate stuff
# will get deleted (hopefully).
.SECONDARY:


# Specifying .ONESHELL means commands inside a target will
# occur as part of the same shell, one after the other. We
# do this to make it easier to write steps of the recipes.
.ONESHELL:

# I'd like to enable .SHELLFLAGS but I don't get how it works
# .SHELLFLAGS = -e

o/%/.downloaded: %
	echo "should be downloading" $(DL_FILE)
	$(MKDIR) o/$<
	touch $@
	cd o/$<
	$(DL_COMMAND) $(DL_FILE)

o/%/.patched: o/%/.downloaded
	echo "should be patching with" $(PATCH_FILE) 
	$(MKDIR) $(dir $<)
	touch $@
	cd $(dir $<)
	$(PATCH_COMMAND) $(PATCH_FILE)


o/%.x86_64: COSMOS=$(COSMOS_X86_64) 
o/%.x86_64: ARCH=x86_64  
o/%.x86_64: MODE=x86_64  
o/%.x86_64: CC=$(COSMOCC)/bin/x86_64-unknown-cosmo-cc 
o/%.x86_64: CXX=$(COSMOCC)/bin/x86_64-unknown-cosmo-c++
o/%.x86_64: LD=$(COSMOCC)/bin/x86_64-unknown-cosmo-cc
o/%.x86_64: AR=$(COSMOCC)/bin/x86_64-unknown-cosmo-ar 
o/%.x86_64: STRIP=$(COSMOCC)/bin/x86_64-unknown-cosmo-strip 
o/%.x86_64: OBJCOPY=$(COSMOCC)/bin/x86_64-unknown-cosmo-objcopy

o/%.aarch64: COSMOS=$(COSMOS_AARCH64) 
o/%.aarch64: ARCH=aarch64  
o/%.aarch64: MODE=aarch64  
o/%.aarch64: CC=$(COSMOCC)/bin/aarch64-unknown-cosmo-cc 
o/%.aarch64: CXX=$(COSMOCC)/bin/aarch64-unknown-cosmo-c++
o/%.aarch64: LD=$(COSMOCC)/bin/aarch64-unknown-cosmo-cc
o/%.aarch64: AR=$(COSMOCC)/bin/aarch64-unknown-cosmo-ar 
o/%.aarch64: STRIP=$(COSMOCC)/bin/aarch64-unknown-cosmo-strip 
o/%.aarch64: OBJCOPY=$(COSMOCC)/bin/aarch64-unknown-cosmo-objcopy

o/%/.deps.x86_64: o/%/.patched
	touch $@

o/%/.deps.aarch64: o/%/.patched
	touch $@

o/%/.configured.x86_64: o/%/.deps.x86_64
	touch $@
	source $(BASELOC)/config/vars-x86_64
	cd $(dir $<)
	$(MKDIR) build/x86_64 && cd build/x86_64
	$(CONFIG_COMMAND)

o/%/.built.x86_64: o/%/.configured.x86_64
	touch $@
	source $(BASELOC)/config/vars-x86_64
	cd $(dir $<)/build/x86_64
	$(BUILD_COMMAND) -j$(MAXPROC)
	$(INSTALL_COMMAND) -j$(MAXPROC)

o/%/.configured.aarch64: o/%/.deps.aarch64
	touch $@
	source $(BASELOC)/config/vars-aarch64
	cd $(dir $<)
	$(MKDIR) build/aarch64 && cd build/aarch64
	$(CONFIG_COMMAND)

o/%/.built.aarch64: o/%/.configured.aarch64
	touch $@
	source $(BASELOC)/config/vars-aarch64
	cd $(dir $<)/build/aarch64
	$(BUILD_COMMAND) -j$(MAXPROC)
	$(INSTALL_COMMAND) -j$(MAXPROC)

o/%/.built.fat: o/%/.built.x86_64 o/%/.built.aarch64
	touch $@
	$(MKDIR) $(RESULTS)/bin $(RESULTS)/libexec
	source $(BASELOC)/config/vars-fat
ifneq ($(FATTEN_SCRIPT),)
		echo "running custom fattening script"
		$(FATTEN_SCRIPT)	
else ifneq  ($(BINS),)
		echo "running apelink for a list of files"
		$(APELINKPLS) $(BINS)
else
		echo $(dir $<) " -- nothing to fatten"
endif

o/%: o/%/.built.fat
