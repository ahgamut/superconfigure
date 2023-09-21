# `superconfigure`

this repo contains shell scripts that wrap `./configure` to build software with
[Cosmopolitan Libc][cosmo]. The executables that build on this are [fat APE
binaries](https://github.com/jart/cosmopolitan#amd64--arm64-fat-ape-binaries).

Currently available: `bash-5.2`, `wget-1.21`, `vim-9.0.1670`, `emacs-28.2`, CPython3.11.4.

# How can I get these?

The  [`Releases` page](https://github.com/ahgamut/superconfigure/releases)
should have the most recent builds of executables in this repo, built via Github
Actions. If you'd like to build these executables yourself, here's how:

* Clone this repository
* install necessary build dependencies (most notably `qemu` and SSL certs) -- see
  `./.github/scripts/setup` for details
* build the [Cosmopolitan Libc repository][cosmo] for `MODE=` and `MODE=aarch64`
  -- see `.github/scripts/cosmo`
* to build `bash`, `vim`, `emacs`, and `wget` run `./.github/scripts/cli`
* to build CPython3.11.4 [`datasette` 1.0.0a6][datasette] run `./.github/scripts/datasette`
* to build CPython3.11.4 with CLI utilities like `black` and `cookiecutter` run `./.github/scripts/pypack1`

The build scripts assume `bash`/Debian/Ubuntu, if you'd like to expand them,
submit a PR!

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

A similar process can be followed to add your own `vimrc`, `wgetrc`, or emacs
config to the respective binaries.

[cosmo]: https://github.com/jart/cosmopolitan
[datasette]: https://github.com/simonw/datasette
[patch]: https://github.com/ahgamut/gcc/tree/portcosmo-11.2
[buildpatch]: https://github.com/ahgamut/musl-cross-make
[cpy311]: https://github.com/ahgamut/cpython/tree/portcosmo
