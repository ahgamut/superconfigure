
NETHACK_SRC := https://www.nethack.org/download/3.6.7/nethack-367-src.tgz
NETHACK_DEPS := lib/ncurses

$(eval $(call DOWNLOAD_SOURCE,games/nethack,$(NETHACK_SRC)))
$(eval $(call SPECIFY_DEPS,games/nethack,$(NETHACK_DEPS)))

o/games/nethack/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/games/nethack/config-wrapper
o/games/nethack/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/games/nethack/config-wrapper

o/games/nethack/installed.x86_64: \
	INSTALL_COMMAND = $(BASELOC)/games/nethack/install-wrapper
o/games/nethack/installed.aarch64: \
	INSTALL_COMMAND = $(BASELOC)/games/nethack/install-wrapper

o/games/nethack/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/games/nethack/built.fat: BINS = nethack share/terminfo share/nh
