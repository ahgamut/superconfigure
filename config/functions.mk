
# We would like to specify deps and build rules with less text.
# here are text substitution functions that may help with that.

define DOWNLOAD_SOURCE =
o/$(1)/.downloaded: DL_FILE = $(2);
o/$(1)/.patched: PATCH_FILE = $$(BASELOC)/$(1)/minimal.diff;
endef

define SPECIFY_DEPS =
o/$(1)/.deps.x86_64: $(patsubst %, o/%/.built.x86_64, $(2)) o/$(1)/.patched;
o/$(1)/.deps.aarch64: $(patsubst %, o/%/.built.aarch64, $(2)) o/$(1)/.patched;
endef

define AUTOTOOLS_BUILD =
o/$(1)/.configured.x86_64: CONFIG_COMMAND = ../../$(notdir $(1))*/configure $(2);
o/$(1)/.configured.aarch64: CONFIG_COMMAND = ../../$(notdir $(1))*/configure $(3);
endef
