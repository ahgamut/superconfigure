ifeq ($(LOG),)
ERRLOG = >$(NULLFILE) 2>$(NULLFILE)
endif

ifeq ($(LOG),stdout)
ERRLOG =
endif

ifeq ($(LOG),file)
ERRLOG = >$(abspath $@).log 2>$(abspath $@).err
endif
