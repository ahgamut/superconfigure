NCURSES_SRC := https://mirrors.ocf.berkeley.edu/gnu/ncurses/ncurses-6.4.tar.gz

NCURSES_CONFIG_ARGS = --without-libtool --without-shared\
	--with-normal --without-debug\
	--disable-relink --disable-rpath\
	--disable-termcap --disable-mixed-case\
    --without-ada --without-cxx --without-cxx-binding\
    --without-tests --with-termlib --with-ticlib\
    --without-dlsym --without-pcre2 --with-sysmouse\
    --without-manpages --without-tests --without-tack\
    --with-curses-h --disable-stripping --enable-widec\
	--enable-ext-colors --enable-ext-mouse --enable-sp-funcs\
	--enable-colorfgbg --enable-tcap-names\
	--with-pkg-config --enable-pc-files\
	--with-fallbacks=xterm,xterm-256color,screen-256color,linux,vt100,ansi77\
    --prefix=$$(COSMOS)\
	--with-default-terminfo-dir=$$(COSMOS)/share/terminfo\
	--with-pkgconfig-libdir=$$(COSMOS)/lib/pkgconfig\
    CFLAGS="-Os"


$(eval $(call DOWNLOAD_SOURCE,lib/ncurses,$(NCURSES_SRC)))
# no deps for ncurses except cosmo repo
$(eval $(call AUTOTOOLS_BUILD,lib/ncurses,$(NCURSES_CONFIG_ARGS),$(NCURSES_CONFIG_ARGS)))

o/lib/ncurses/installed.x86_64: INSTALL_COMMAND = $(BASELOC)/lib/ncurses/install-wrapper

o/lib/ncurses/installed.aarch64: INSTALL_COMMAND = $(BASELOC)/lib/ncurses/install-wrapper

o/lib/ncurses/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
