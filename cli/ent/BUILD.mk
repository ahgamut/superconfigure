
o/cli/ent/downloaded: \
	DL_COMMAND = rm -rf ent_random_sequence_tester \
	&& git clone --quiet --depth=1 https://github.com/Fourmilab/ent_random_sequence_tester

o/cli/ent/checked: CHECK_COMMAND = $(DUMMYLINK0)
o/cli/ent/patched: PATCH_FILE = $(BASELOC)/cli/ent/minimal.diff

o/cli/ent/configured.x86_64: CONFIG_COMMAND = cp -r $(BASELOC)/o/cli/ent/ent_random_sequence_tester/src/* .
o/cli/ent/installed.x86_64: INSTALL_COMMAND = cp ./ent $(COSMOS)/bin

o/cli/ent/configured.aarch64: CONFIG_COMMAND = cp -r $(BASELOC)/o/cli/ent/ent_random_sequence_tester/src/* .
o/cli/ent/installed.aarch64: INSTALL_COMMAND = cp ./ent $(COSMOS)/bin

o/cli/ent/built.fat: BINS = ent
