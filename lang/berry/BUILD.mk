
BERRY_DEPS := lib/ncurses lib/readline

$(eval $(call SPECIFY_DEPS,lang/berry,$(BERRY_DEPS)))

o/lang/berry/downloaded: \
	DL_COMMAND = rm -rf berry && git clone --quiet --depth=1 https://github.com/berry-lang/berry

o/lang/berry/checked: CHECK_COMMAND = $(DUMMYLINK0)
o/lang/berry/patched: PATCH_COMMAND = patch -p1 -i
o/lang/berry/patched: PATCH_FILE = $(BASELOC)/lang/berry/minimal.diff

o/lang/berry/configured.x86_64: CONFIG_COMMAND = cp -r $(BASELOC)/o/lang/berry/berry/* .
o/lang/berry/installed.x86_64: INSTALL_COMMAND = cp ./berry $(COSMOS)/bin

o/lang/berry/configured.aarch64: CONFIG_COMMAND = cp -r $(BASELOC)/o/lang/berry/berry/* .
o/lang/berry/installed.aarch64: INSTALL_COMMAND = cp ./berry $(COSMOS)/bin

o/lang/berry/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/lang/berry/built.fat: BINS = berry usr/share/terminfo
