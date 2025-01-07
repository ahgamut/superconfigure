o/%/downloaded: DL_COMMAND = $(DL_DEFAULT)
o/%/downloaded: DL_FILE = 
o/%/downloaded: %
	echo $* ": downloading" $(DL_FILE)
	$(MKDIR) o/$< && \
		cd o/$< && \
		$(DL_COMMAND) $(DL_FILE) $(ERRLOG)
	touch $@

o/%/checked: CHECK_COMMAND = $(CHECK_DEFAULT)
o/%/checked: o/%/downloaded %/check.signature
	echo $* ": checking sha256 signature"
	$(MKDIR) $(dir $<) && \
		cp $(word 2,$^) $(dir $<) && \
		cd $(dir $<) && \
		$(CHECK_COMMAND) $(ERRLOG)
	touch $@

o/%/patched: PATCH_COMMAND = $(PATCH_DEFAULT)
o/%/patched: o/%/checked
	echo $* ": patching with " $(PATCH_FILE)
	$(MKDIR) $(dir $<) && \
		cd $(dir $<) && \
		$(PATCH_COMMAND) $(PATCH_FILE) $(ERRLOG)
	touch $@

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
	echo $* ": checking x86_64 deps"
	$(DEPS_COMMAND) $^ $(ERRLOG)
	touch $@

o/%/deps.aarch64: DEPS_COMMAND = $(DEPS_DEFAULT)
o/%/deps.aarch64: o/%/patched
	echo $* ": checking aarch64 deps"
	$(DEPS_COMMAND) $^ $(ERRLOG)
	touch $@ $(ERRLOG)

o/%/configured.x86_64: CONFIG_COMMAND = $(CONFIG_DEFAULT)
o/%/configured.x86_64: o/%/deps.x86_64
	echo $* ": configuring x86_64"
	source $(BASELOC)/config/vars-x86_64 && \
		rm -rf $(dir $<)/build/x86_64 && \
		$(MKDIR) $(dir $<)/build/x86_64 && \
		cd $(dir $<)/build/x86_64 && \
		$(CONFIG_COMMAND) $(ERRLOG)
	touch $@

o/%/configured.aarch64: CONFIG_COMMAND = $(CONFIG_DEFAULT)
o/%/configured.aarch64: o/%/deps.aarch64
	echo $* ": configuring aarch64"
	source $(BASELOC)/config/vars-aarch64 && \
		rm -rf $(dir $<)/build/aarch64 && \
		$(MKDIR) $(dir $<)/build/aarch64 && \
		cd $(dir $<)/build/aarch64 && \
		$(CONFIG_COMMAND) $(ERRLOG)
	touch $@

o/%/built.x86_64: BUILD_COMMAND = $(BUILD_DEFAULT)
o/%/built.x86_64: o/%/configured.x86_64
	echo $* ": building x86_64"
	source $(BASELOC)/config/vars-x86_64 && \
		cd $(dir $<)/build/x86_64 && \
		$(BUILD_COMMAND) $(ERRLOG)
	touch $@

o/%/installed.x86_64: INSTALL_COMMAND = $(INSTALL_DEFAULT)
o/%/installed.x86_64: o/%/built.x86_64
	echo $* ": installing x86_64"
	source $(BASELOC)/config/vars-x86_64 && \
		cd $(dir $<)/build/x86_64 && \
		$(INSTALL_COMMAND) $(ERRLOG)
	touch $@

o/%/built.aarch64: BUILD_COMMAND = $(BUILD_DEFAULT)
o/%/built.aarch64: o/%/configured.aarch64
	echo $* ": building aarch64"
	source $(BASELOC)/config/vars-aarch64 && \
		cd $(dir $<)/build/aarch64 && \
		$(BUILD_COMMAND) $(ERRLOG)
	touch $@

o/%/installed.aarch64: INSTALL_COMMAND = $(INSTALL_DEFAULT)
o/%/installed.aarch64: o/%/built.aarch64
	echo $* ": installing aarch64"
	source $(BASELOC)/config/vars-aarch64 && \
		cd $(dir $<)/build/aarch64 && \
		$(INSTALL_COMMAND) $(ERRLOG)
	touch $@

o/%/built.fat: FATTEN_COMMAND = $(APELINKPLS)
o/%/built.fat: BINS =
o/%/built.fat: o/%/installed.x86_64 o/%/installed.aarch64
	echo $* ": creating fat binary"
	$(MKDIR) $(RESULTS)/bin $(RESULTS)/libexec
	source $(BASELOC)/config/vars-fat && \
		$(FATTEN_COMMAND) $(BINS) $(ERRLOG)
	touch $@

o/%: o/%/built.fat
