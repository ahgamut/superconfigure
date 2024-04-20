
GIT_SRC := https://github.com/git/git/archive/refs/tags/v2.42.0.tar.gz 
GIT_DEPS := lib/openssl \
			web/curl lib/libexpat \
			lib/certs \
			cosmo-repo/base cosmo-repo/compress

$(eval $(call DOWNLOAD_SOURCE,web/git,$(GIT_SRC)))
$(eval $(call SPECIFY_DEPS,web/git,$(GIT_DEPS)))

o/web/git/setup: o/web/git/patched
	cd o/web/git/git* && autoconf || true
	touch $@

o/web/git/configured.x86_64: o/web/git/setup
o/web/git/configured.aarch64: o/web/git/setup

# the config-wrapper itself does the build
# so BUILD_COMMAND and INSTALL_COMMAND are dummies

o/web/git/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/web/git/config-wrapper
o/web/git/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/web/git/config-wrapper

o/web/git/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/web/git/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)

o/web/git/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)
o/web/git/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/web/git/built.fat: FATTEN_COMMAND = $(BASELOC)/web/git/fatten
git: o/web/git/built.fat
.PHONY: git
