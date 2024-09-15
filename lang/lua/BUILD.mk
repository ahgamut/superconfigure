LUA_DEPS := lib/ncurses lib/readline

$(eval $(call SPECIFY_DEPS,lang/lua,$(LUA_DEPS)))

o/lang/lua/downloaded: \
	DL_COMMAND = rm -rf lua && git clone --quiet --depth=1 --branch=v5.4.6 https://github.com/lua/lua lua

o/lang/lua/checked: CHECK_COMMAND = $(DUMMYLINK0)
o/lang/lua/patched: PATCH_COMMAND = patch -p0 -i
o/lang/lua/patched: PATCH_FILE = $(BASELOC)/lang/lua/minimal.diff

o/lang/lua/configured.x86_64: \
	CONFIG_COMMAND = cp -r $(BASELOC)/o/lang/lua/lua/* ./

o/lang/lua/configured.aarch64: \
	CONFIG_COMMAND = cp -r $(BASELOC)/o/lang/lua/lua/* ./

o/lang/lua/installed.x86_64: \
	INSTALL_COMMAND = cp lua $(COSMOS)/bin
o/lang/lua/installed.aarch64: \
	INSTALL_COMMAND = cp lua $(COSMOS)/bin

o/lang/lua/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/lang/lua/built.fat: BINS = lua usr/share/terminfo
