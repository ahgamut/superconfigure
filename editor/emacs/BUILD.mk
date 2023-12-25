
EMACS_SRC := https://ftp.gnu.org/gnu/emacs/emacs-28.2.tar.gz 

$(eval $(call DOWNLOAD_SOURCE,editor/emacs,$(EMACS_SRC)))
$(eval $(call SPECIFY_DEPS,editor/emacs,lib/ncurses lib/gnutls))

o/editor/emacs/configured.x86_64:\
	CONFIG_COMMAND = $(BASELOC)/editor/emacs/config-wrapper

o/editor/emacs/configured.aarch64:\
	CONFIG_COMMAND = $(BASELOC)/editor/emacs/config-wrapper

o/editor/emacs/built.fat: FATTEN_COMMAND = $(BASELOC)/editor/emacs/fatten
