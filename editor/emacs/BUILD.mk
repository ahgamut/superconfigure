
EMACS_SRC := https://ftp.gnu.org/gnu/emacs/emacs-29.3.tar.gz 

EMACS_DEPS := lib/ncurses lib/gnutls lib/libxml2 lib/jansson compress/gzip

$(eval $(call DOWNLOAD_SOURCE,editor/emacs,$(EMACS_SRC)))
$(eval $(call SPECIFY_DEPS,editor/emacs,$(EMACS_DEPS)))

o/editor/emacs/configured.x86_64:\
	CONFIG_COMMAND = $(BASELOC)/editor/emacs/config-wrapper

o/editor/emacs/configured.aarch64:\
	CONFIG_COMMAND = $(BASELOC)/editor/emacs/config-wrapper

o/editor/emacs/configured.aarch64: o/editor/emacs/built.x86_64
o/editor/emacs/built.fat: FATTEN_COMMAND = $(BASELOC)/editor/emacs/fatten
