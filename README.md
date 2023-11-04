# `superconfigure`

this repo contains shell scripts that wrap `./configure` to build software with
[Cosmopolitan Libc][cosmo]. The executables that are built on this repo are [fat
APE binaries](https://github.com/jart/cosmopolitan#amd64--arm64-fat-ape-binaries).

Currently available:

* GNU `bash-5.2`, `findutils-4.9.0`, `coreutils-9.4`
* `vim-9.0.1670`, `emacs-29.1`, `nano-7.2`
* CPython3.11.4
* `wget-1.21`, `curl-8.4.0`, `git-2.42.0`
* [`gcc-11.2.0`][portcosmo] and `binutils-2.35.2` targeting `x86_64-linux-cosmo`
* [`gcc-11.2.0`][portcosmo] and `binutils-2.35.2` targeting `aarch64-linux-cosmo`
* a collection of binaries built from the [`third_party` folder][cosmo-3p] of the
  Cosmopolitan Libc repo

# How can I get these?

The  [`Releases` page](https://github.com/ahgamut/superconfigure/releases)
should have the most recent builds of executables in this repo, built via Github
Actions. If you'd like to build these executables yourself, here's how:

* Clone this repository
* install necessary build dependencies (most notably `qemu` and SSL certs) -- see
  `./.github/scripts/setup` for details
* build the [Cosmopolitan Libc repository][cosmo] for `MODE=` and `MODE=aarch64`
  -- see `.github/scripts/cosmo`
* to build `bash`, `less`, `find`, `tree`, and GNU coreutils run `./.github/scripts/cli`
* to build `vim`, `emacs`, and `nano` run `./.github/scripts/editor`
* to build CPython3.11.4 [`datasette` 1.0.0a6][datasette] run `./.github/scripts/datasette`
* to build CPython3.11.4 with CLI utilities like `black` and `cookiecutter` run `./.github/scripts/pypack1`

The build scripts assume `bash`/Debian/Ubuntu. 
If you'd like to add your own software build scripts, submit a PR!

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
