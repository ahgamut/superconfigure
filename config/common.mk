# Common Configuration Variables

APELINKPLS := $(BASELOC)/config/default_apelink.sh
DUMMYLINK0 := echo ""
MAXPROC := ${MAXPROC}

ifeq ($(MAXPROC),)
export MAXPROC:=4
ifneq (${GITHUB_ACTIONS},)
export MAXPROC:=2
endif
endif

MKDIR:=$(shell which mkdir) -p

DL_DEFAULT := $(BASELOC)/config/default_dl.sh
# if DL_FILE is not provided, this will error out

CHECK_DEFAULT := $(BASELOC)/config/check_sha.sh

PATCH_DEFAULT := $(BASELOC)/config/default_patch.sh
# PATCH_FILE defaults to minimal.diff in the right spot
# if minimal.diff doesn't exist, the above script is ok

DEPS_DEFAULT := echo
CONFIG_DEFAULT := $(BASELOC)/config/fail_config.sh
BUILD_DEFAULT := make -j$(MAXPROC)
INSTALL_DEFAULT := make install -j$(MAXPROC)
FATTEN_DEFAULT := $(APELINKPLS)

# Specifying SECONDARY means none of the intermediate stuff
# will get deleted (hopefully).
.SECONDARY:


# Specifying .ONESHELL means commands inside a target will
# occur as part of the same shell, one after the other. We
# do this to make it easier to write steps of the recipes.
# .ONESHELL:

# I'd like to enable .SHELLFLAGS but I don't get how it works
# .SHELLFLAGS = -e

o/%/downloaded: DL_COMMAND = $(DL_DEFAULT)
o/%/downloaded: DL_FILE = 
o/%/downloaded: %
	@echo "downloading" $(DL_FILE)
	@$(MKDIR) o/$< && \
		cd o/$< && \
		$(DL_COMMAND) $(DL_FILE)  
	@touch $@

o/%/checked: CHECK_COMMAND = $(CHECK_DEFAULT)
o/%/checked: o/%/downloaded %/check.signature
	@echo "checking" $(dir $<)
	@$(MKDIR) $(dir $<) && \
		cp $(word 2,$^) $(dir $<) && \
		cd $(dir $<) && \
		$(CHECK_COMMAND)
	@touch $@

o/%/patched: PATCH_COMMAND = $(PATCH_DEFAULT)
o/%/patched: o/%/checked
	@echo "patching " $(PATCH_FILE)
	@$(MKDIR) $(dir $<) && \
		cd $(dir $<) && \
		$(PATCH_COMMAND) $(PATCH_FILE) 
	@touch $@

o/%.x86_64: COSMOS=$(COSMOS_X86_64)
o/%.x86_64: ARCH=x86_64
o/%.x86_64: MODE=x86_64
o/%.x86_64: CC=$(COSMOCC)/bin/x86_64-unknown-cosmo-cc
o/%.x86_64: CXX=$(COSMOCC)/bin/x86_64-unknown-cosmo-c++
o/%.x86_64: LD=$(COSMOCC)/bin/x86_64-unknown-cosmo-ld
o/%.x86_64: AR=$(COSMOCC)/bin/x86_64-unknown-cosmo-ar
o/%.x86_64: STRIP=$(COSMOCC)/bin/x86_64-unknown-cosmo-strip
o/%.x86_64: OBJCOPY=$(COSMOCC)/bin/x86_64-unknown-cosmo-objcopy

o/%.aarch64: COSMOS=$(COSMOS_AARCH64)
o/%.aarch64: ARCH=aarch64
o/%.aarch64: MODE=aarch64
o/%.aarch64: CC=$(COSMOCC)/bin/aarch64-unknown-cosmo-cc
o/%.aarch64: CXX=$(COSMOCC)/bin/aarch64-unknown-cosmo-c++
o/%.aarch64: LD=$(COSMOCC)/bin/aarch64-unknown-cosmo-ld
o/%.aarch64: AR=$(COSMOCC)/bin/aarch64-unknown-cosmo-ar
o/%.aarch64: STRIP=$(COSMOCC)/bin/aarch64-unknown-cosmo-strip
o/%.aarch64: OBJCOPY=$(COSMOCC)/bin/aarch64-unknown-cosmo-objcopy

o/%/deps.x86_64: DEPS_COMMAND = $(DEPS_DEFAULT)
o/%/deps.x86_64: o/%/patched
	@$(DEPS_COMMAND) $^ 
	@touch $@

o/%/deps.aarch64: DEPS_COMMAND = $(DEPS_DEFAULT)
o/%/deps.aarch64: o/%/patched
	@$(DEPS_COMMAND) $^ 
	@touch $@

o/%/configured.x86_64: CONFIG_COMMAND = $(CONFIG_DEFAULT)
o/%/configured.x86_64: o/%/deps.x86_64
	@source $(BASELOC)/config/vars-x86_64 && \
		rm -rf $(dir $<)/build/x86_64 && \
		$(MKDIR) $(dir $<)/build/x86_64 && \
		cd $(dir $<)/build/x86_64 && \
		$(CONFIG_COMMAND) 
	@touch $@

o/%/configured.aarch64: CONFIG_COMMAND = $(CONFIG_DEFAULT)
o/%/configured.aarch64: o/%/deps.aarch64
	@source $(BASELOC)/config/vars-aarch64 && \
		rm -rf $(dir $<)/build/aarch64 && \
		$(MKDIR) $(dir $<)/build/aarch64 && \
		cd $(dir $<)/build/aarch64 && \
		$(CONFIG_COMMAND) 
	@touch $@

o/%/built.x86_64: BUILD_COMMAND = $(BUILD_DEFAULT)
o/%/built.x86_64: o/%/configured.x86_64
	@source $(BASELOC)/config/vars-x86_64 && \
		cd $(dir $<)/build/x86_64 && \
		$(BUILD_COMMAND) 
	@touch $@

o/%/installed.x86_64: INSTALL_COMMAND = $(INSTALL_DEFAULT)
o/%/installed.x86_64: o/%/built.x86_64
	@source $(BASELOC)/config/vars-x86_64 && \
		cd $(dir $<)/build/x86_64 && \
		$(INSTALL_COMMAND) 
	@touch $@

o/%/built.aarch64: BUILD_COMMAND = $(BUILD_DEFAULT)
o/%/built.aarch64: o/%/configured.aarch64
	@source $(BASELOC)/config/vars-aarch64 && \
		cd $(dir $<)/build/aarch64 && \
		$(BUILD_COMMAND) 
	@touch $@

o/%/installed.aarch64: INSTALL_COMMAND = $(INSTALL_DEFAULT)
o/%/installed.aarch64: o/%/built.aarch64
	@source $(BASELOC)/config/vars-aarch64 && \
		cd $(dir $<)/build/aarch64 && \
		$(INSTALL_COMMAND) 
	@touch $@

o/%/built.fat: FATTEN_COMMAND = $(APELINKPLS)
o/%/built.fat: BINS =
o/%/built.fat: o/%/installed.x86_64 o/%/installed.aarch64
	@$(MKDIR) $(RESULTS)/bin $(RESULTS)/libexec
	@source $(BASELOC)/config/vars-fat && \
		echo "running apelink for a list of files" && \
		$(FATTEN_COMMAND) $(BINS) 
	@touch $@

o/%: o/%/built.fat
