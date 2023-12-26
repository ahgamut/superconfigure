
BERRY_DEPS := lib/ncurses lib/readline

$(eval $(call SPECIFY_DEPS,cli/berry,$(BERRY_DEPS)))

o/cli/berry/downloaded: \
	DL_COMMAND = rm -rf berry && git clone --depth=1 https://github.com/berry-lang/berry

o/cli/berry/patched: PATCH_COMMAND = patch -p1 -i
o/cli/berry/patched: PATCH_FILE = $(BASELOC)/cli/berry/minimal.diff

o/cli/berry/configured.x86_64: CONFIG_COMMAND = cp -r ../../berry/* .
o/cli/berry/installed.x86_64: INSTALL_COMMAND = cp ./berry $(COSMOS)/bin

o/cli/berry/configured.aarch64: CONFIG_COMMAND = cp -r ../../berry/* .
o/cli/berry/installed.aarch64: INSTALL_COMMAND = cp ./berry $(COSMOS)/bin

o/cli/berry/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/cli/berry/built.fat: BINS = berry usr/share/terminfo
