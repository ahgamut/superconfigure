# `superconfigure`

`superconfigure` is a collection of programs ported to run as fat binaries using
[Cosmopolitan Libc][cosmo]. This repository includes build scripts for popular
software such as `bash`, `lua`, `emacs`, GNU Coreutils, `sed`, `gcc-12`, `curl`,
and others. For each of these, the source code is downloaded from the upstream
sources, compiled for `x86_64` and `aarch64`, and finally combined into a fat
binary using Cosmopolitan Libc's `apelink` program.

# What's included in the build
The built software is split into the following zip files:  
**compress.zip**  
contains `tar`, `zip`, `unzip`, `bzip2`, `zstd`, `xz`, `brotli`, `gzip`.  
**cli.zip**  
contains `bash`, `zsh`, `grep`, `less`, `lua`, `find`, GNU coreutils, and `ninja`.  
**editor.zip**  
contains `vim`, `nano`, and `emacs`.  
**x86_64-gcc.zip**  
contains the `gcc-14.1` and `binutils-2.42` tools targeting (x86-64-linux-cosmo).  
**aarch64-gcc.zip**  
contains the `gcc-14.1` and `binutils-2.42` tools targeting (aarch64-linux-cosmo).  
**datasette.zip**  
contains `datasette` a build of CPython 3.11 with the datasette library.  
**pypack1.zip**  
contains `python`, a build of CPython 3.11 with a bunch of cli libraries like `black`, `cookiecutter`.  
**lang.zip**  
contains languages [`berry`](https://berry-lang.github.io/), [`janet`](https://janet-lang.org/), [`lua`](https://www.lua.org/), [`php`](https://www.php.net/), and Python 3.12.

# Where can I download the built software?

The  [`Releases` page](https://github.com/ahgamut/superconfigure/releases)
should have the most recent builds of executables in this repo, built via Github
Actions. 

If you'd like to add your own software build scripts, submit a PR! Read up
`config/README.md` how all of this works.

> [!TIP]
> If you're on Windows, after downloading the zip files you should rename the executables inside to end with `.exe` in order to run them.

# How can I build these locally?

The build scripts assume Debian/Ubuntu, and also use things like `bash`,
`find`, `wget`, `cat`, `sed`, `git`, GNU `make`, `patch`, `cp`, `mkdir` etc.
(you also need sudo access to setup a `/zip` folder).  You can follow the steps
in `.github/workflows/release.yml` on your machine:

- clone this repository
- create a folder `/zip` on your system that provides read/write access to
  everyone
- install necessary build dependencies:
    - `qemu` to run aarch64 ELF binaries
    - SSL certificates
- clone the cosmopolitan libc repository within this repository
- build the `cosmopolitan` toolchain by running `./.github/scripts/cosmo`

```sh
git clone https://github.com/ahgamut/superconfigure
cd superconfigure
git clone --depth=1 https://github.com/jart/cosmopolitan
# install build dependencies
bash ./.github/scripts/setup
bash ./.github/scripts/cosmo
```

## Building the executable collections

* to build `bash`, `less`, `find`, `tree`, and GNU coreutils run `make -j4 cli`
* to build `vim`, `emacs`, and `nano` run `make -j4 editor`
* to build CPython3.11.4 with [`datasette` 1.0.0a6][datasette] run `make -j4
  datasette`
* to build the GCC collection for `x86_64` run `make -j4 x86_64-gcc`

you can run `./.github/scripts/collectzip` to store all build results in a
ZIP file.

## Building collections via `make`

You can build fat binaries using the Makefile as well! After setting up the
toolchain, if you want to get the binaries for the `web` folder, run 

```sh
# assume ./.github/scripts/setup has already been run
# assume ./.github/scripts/cosmo has already been run
export MAXPROC=4
make -j4 web
ls -al results/bin/*
```

## Building individual targets without `make`

Let's say you wanted to build `bash`. The steps are:

```sh
# assume ./.github/scripts/setup has already been run
# assume ./.github/scripts/cosmo has already been run
export MAXPROC=4
make -j2 o/cli/bash/built.fat
ls -al results/bin/bash*
```

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
