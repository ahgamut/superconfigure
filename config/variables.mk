NULLFILE := /dev/null
APELINKPLS := $(BASELOC)/config/default_apelink.sh
DUMMYLINK0 := echo ""
MAXPROC := ${MAXPROC}

ifeq ($(MAXPROC),)
export MAXPROC:=4
ifneq (${GITHUB_ACTIONS},)
export MAXPROC:=2
endif
endif

MKDIR:=$(shell which mkdir) -p

DL_DEFAULT := $(BASELOC)/config/default_dl.sh
# if DL_FILE is not provided, this will error out

CHECK_DEFAULT := $(BASELOC)/config/check_sha.sh

PATCH_DEFAULT := $(BASELOC)/config/default_patch.sh
# PATCH_FILE defaults to minimal.diff in the right spot
# if minimal.diff doesn't exist, the above script is ok

DEPS_DEFAULT := echo
CONFIG_DEFAULT := $(BASELOC)/config/fail_config.sh
BUILD_DEFAULT := make -j$(MAXPROC)
INSTALL_DEFAULT := make install -j$(MAXPROC)
FATTEN_DEFAULT := $(APELINKPLS)

# Specifying SECONDARY means none of the intermediate stuff
# will get deleted (hopefully).
.SECONDARY:;

# Specifying SILENT means we don't have to keep the @ to
# mute any of the recipes with @
.SILENT:;

# Specifying .ONESHELL means commands inside a target will
# occur as part of the same shell, one after the other. We
# do this to make it easier to write steps of the recipes.
# .ONESHELL:

# I'd like to enable .SHELLFLAGS but I don't get how it works
# .SHELLFLAGS = -e
