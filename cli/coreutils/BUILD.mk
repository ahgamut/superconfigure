COREUTILS_SRC := https://mirrors.ocf.berkeley.edu/gnu/coreutils/coreutils-9.4.tar.gz 
COREUTILS_DEPS := lib/gmp lib/ncurses cosmo-repo/base

COREUTILS_BINS := [ b2sum base32 base64 basename basenc cat chcon chgrp chmod \
	chown chroot cksum comm cp csplit cut date dd df dir dircolors dirname du echo \
	env expand expr factor false fmt fold groups head id install join kill link ln \
	logname ls md5sum mkdir mkfifo mknod mktemp mv nice nl nohup nproc numfmt od \
	paste pathchk pinky pr printenv printf ptx pwd readlink realpath rm rmdir \
	runcon seq sha1sum sha224sum sha256sum sha384sum sha512sum shred shuf sleep \
	sort split stat stty sum sync tac tail tee test timeout touch tr true truncate \
	tsort tty uname unexpand uniq unlink uptime users vdir wc who whoami yes

$(eval $(call DOWNLOAD_SOURCE,cli/coreutils,$(COREUTILS_SRC)))
$(eval $(call SPECIFY_DEPS,cli/coreutils,$(COREUTILS_DEPS)))

o/cli/coreutils/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/cli/coreutils/config-wrapper
o/cli/coreutils/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/cli/coreutils/config-wrapper

o/cli/coreutils/built.fat: BINS = $(COREUTILS_BINS)
