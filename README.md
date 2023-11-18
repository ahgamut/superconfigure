# `superconfigure`

`superconfigure` is a collection of programs ported to run as fat binaries using
[Cosmopolitan Libc][cosmo]. This repository includes build scripts for popular
software such as `bash`, `lua`, `emacs`, GNU Coreutils, `sed`, `gcc-11`, `curl`,
`clang-15`, and others. For each of these, the source code is downloaded from
the upstream sources, compiled for `x86_64` and `aarch64`, and finally combined
into a fat binary using Cosmopolitan Libc's `apelink` program.

# Where can I download the built software?

The  [`Releases` page](https://github.com/ahgamut/superconfigure/releases)
should have the most recent builds of executables in this repo, built via Github
Actions. 

# How can I build these locally?

The build scripts assume `bash`/Debian/Ubuntu (some may also need sudo access
just to setup a `/zip` folder during the build).  If you'd like to add your own
software build scripts, submit a PR!  You can follow the steps in
`.github/workflows/release.yml` on your machine:

- clone this repository
- install necessary build dependencies (most notably `qemu` and SSL certs) -- see `./.github/scripts/setup` for details
- clone the cosmopolitan libc repository within this repository
- build the `cosmopolitan` toolchain by running `./.github/scripts/cosmo`

## Building the executable collections

You can run any of the shell scripts in `./.github/scripts/build` to get a
collection of fat binaries

* to build `bash`, `less`, `find`, `tree`, and GNU coreutils run `./.github/scripts/build/cli`
* to build `vim`, `emacs`, and `nano` run `./.github/scripts/build/editor`
* to build CPython3.11.4 [`datasette` 1.0.0a6][datasette] run `./.github/scripts/build/datasette`
* to build the GCC collection for `x86_64` run `./.github/scripts/build/x86_64-gcc`

you can run `./.github/scripts/collectzip` to store all build results in a
ZIP file.

## Building collections via `make`

You can build fat binaries using the Makefile as well! After setting up the
toolchain, if you want to get the `./.github/scripts/web` collection, run 

```sh
make ARCH=x86_64 web
make ARCH=aarch64 web
```

the `./.github/scripts/web` does a little more than the Makefile (helps with
creating the fat binaries, but using the Makefile helps for debugging or just
building arch-specific binaries.

Suppose you wanted to build only a specific binary from the Makefile, instead of
the whole `cli` collection:

```sh
make ARCH=x86_64 cli/bash-5.2.built.x86_64
make ARCH=aarch64 cli/bash-5.2.built.aarch64
```

## Building individual targets without `make`

The Makefile aims to handle the dependencies between the various packages
that are currently built. If you want to build these individually (and handle
building the dependencies manually), you can do the following:

Let's say you wanted to build `bash` with Cosmopolitan Libc.
The steps are:

```sh
# assume ./.github/scripts/cosmo has already been run

# build x86_64
source vars/x86_64
cd lib/ncurses-6.4 && superconfigure && cd ../../
cd lib/readline-8.2 && superconfigure && cd ../../
cd cli/bash-5.2 && superconfigure && cd ../../

# build aarch64
source vars/aarch64
cd lib/ncurses-6.4 && superconfigure && cd ../../
cd lib/readline-8.2 && superconfigure && cd ../../
cd cli/bash-5.2 && superconfigure && cd ../../
```

Then you can use a bash function similar to `apelinkpls` in the build scripts to
create the fat binary.


## Adding to the ZIP Store

If you'd like to add new Python scripts or pure-Python packages to the `python`
executables:

```sh
mkdir -p ./Lib/site-packages
cd Lib/site-packages
# add your code
cp -r your_script.py
unzip your_lib.whl
cd ../../
zip -r ./python.com Lib/
# test if the package loads
./python.com -c "import your_lib"
```

A similar process can be followed to add your own `vimrc`, `wgetrc`, `nanorc`
etc. to the respective binaries.

[cosmo]: https://github.com/jart/cosmopolitan
[cosmo-3p]: https://github.com/jart/cosmopolitan/tree/master/third_party
[datasette]: https://github.com/simonw/datasette
[portcosmo]: https://github.com/ahgamut/gcc/tree/portcosmo-11.2
[cpy311]: https://github.com/ahgamut/cpython/tree/portcosmo
