
o/cosmo-repo/cli/downloaded: DL_COMMAND = $(DUMMYLINK0)
o/cosmo-repo/cli/checked: CHECK_COMMAND = $(DUMMYLINK0)
o/cosmo-repo/cli/patched: PATCH_COMMAND = $(DUMMYLINK0)

$(eval $(call SPECIFY_DEPS,cosmo-repo/cli,cosmo-repo/base))

o/cosmo-repo/cli/configured.x86_64: CONFIG_COMMAND = $(DUMMYLINK0)
o/cosmo-repo/cli/configured.aarch64: CONFIG_COMMAND = $(DUMMYLINK0)

o/cosmo-repo/cli/built.x86_64: BUILD_COMMAND = $(BASELOC)/cosmo-repo/cli/build-wrapper
o/cosmo-repo/cli/built.aarch64: BUILD_COMMAND = $(BASELOC)/cosmo-repo/cli/build-wrapper

o/cosmo-repo/cli/built.aarch64: o/cosmo-repo/cli/installed.x86_64

o/cosmo-repo/cli/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)
o/cosmo-repo/cli/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/cosmo-repo/cli/built.fat: BINS = 	greenbean life nesemu1 script \
	rusage hangman whois romanize \
	ttyinfo wall awk \
	ctags lua make \
	tree tidy assimilate sqlite3 \
	mktemper cpuid blackholed art \
	pledge verynice redbean printimage printvideo
