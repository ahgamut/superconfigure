
PINENTRY_SRC := https://gnupg.org/ftp/gcrypt/pinentry/pinentry-1.3.1.tar.bz2

PINENTRY_DEPS := lib/npth lib/libgpg-error lib/libgcrypt \
	lib/libksba lib/libassuan lib/ncurses

PINENTRY_CONFIG_ARGS = --prefix="$$(COSMOS)"\
					CFLAGS="-Os -I$$(COSMOS)/include/ncurses" \
					LIBCURSES="-lncursesw -ltinfow"\
					LIBNCURSES="-lncursesw -ltinfow"\
					--enable-static --disable-shared \
					--without-pic --disable-doc \
					--disable-pinentry-tty \
					--disable-pinentry-efl \
					--disable-pinentry-gtk2 \
					--disable-pinentry-gnome3 \
					--disable-pinentry-qt4 \
					--disable-pinentry-qt5 \
					--disable-pinentry-qt \
					--disable-pinentry-tqt \
					--disable-pinentry-fltk \
					--disable-libsecret

$(eval $(call DOWNLOAD_SOURCE,lib/pinentry,$(PINENTRY_SRC)))
$(eval $(call SPECIFY_DEPS,lib/pinentry,$(PINENTRY_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,lib/pinentry,$(PINENTRY_CONFIG_ARGS),$(PINENTRY_CONFIG_ARGS)))

o/lib/pinentry/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
