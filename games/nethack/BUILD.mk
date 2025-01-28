
NETHACK_SRC := https://www.nethack.org/download/3.6.7/nethack-367-src.tgz
NETHACK_DEPS := lib/ncurses

$(eval $(call DOWNLOAD_SOURCE,games/nethack,$(NETHACK_SRC)))
$(eval $(call SPECIFY_DEPS,games/nethack,$(NETHACK_DEPS)))

o/games/nethack/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/games/nethack/config-wrapper minimal_x86.diff
o/games/nethack/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/games/nethack/config-wrapper minimal_aarch64.diff

o/games/nethack/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/games/nethack/built.fat: BINS = nethack share/terminfo sysconf nhdat
