NCURSES_SRC := https://ftp.gnu.org/gnu/ncurses/ncurses-6.4.tar.gz

NCURSES_CONFIG_ARGS = --without-libtool --without-shared\
    --without-manpages --without-tests --without-tack\
    --without-ada --without-cxx --without-cxx-binding\
    --without-tests --with-termlib --with-ticlib\
    --without-dlsym --without-pcre2 --without-sysmouse\
    --with-curses-h --disable-stripping --enable-widec\
    --disable-lib-suffixes\
    --prefix=$$(COSMOS)\
    --sysconfdir=/zip --datarootdir=/zip/usr/share\
    CFLAGS="-Os"


$(eval $(call DOWNLOAD_SOURCE,lib/ncurses,$(NCURSES_SRC)))
# no deps for ncurses except cosmo repo
$(eval $(call AUTOTOOLS_BUILD,lib/ncurses,$(NCURSES_CONFIG_ARGS),$(NCURSES_CONFIG_ARGS)))

o/lib/ncurses/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
