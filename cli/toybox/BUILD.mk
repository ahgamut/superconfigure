TOYBOX_SRC := https://landley.net/toybox/downloads/toybox-0.8.12.tar.gz

$(eval $(call DOWNLOAD_SOURCE,cli/toybox,$(TOYBOX_SRC)))

o/cli/toybox/setup: o/cli/toybox/patched
	cp $(BASELOC)/cli/toybox/cosmo.config $(BASELOC)/o/cli/toybox/toybox-0.8.12/.config

o/cli/toybox/configured.x86_64: o/cli/toybox/setup
o/cli/toybox/configured.aarch64: o/cli/toybox/setup

o/cli/toybox/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/cli/toybox/config-wrapper
o/cli/toybox/built.x86_64: BUILD_COMMAND = make V=1 toybox
o/cli/toybox/installed.x86_64: INSTALL_COMMAND = cp toybox $(COSMOS)/bin/toybox

o/cli/toybox/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/cli/toybox/config-wrapper
o/cli/toybox/built.aarch64: BUILD_COMMAND = make V=1 toybox
o/cli/toybox/installed.aarch64: INSTALL_COMMAND = cp toybox $(COSMOS)/bin/toybox

o/cli/toybox/built.fat: BINS = toybox
