# `superconfigure`

this repo contains shell scripts that wrap `./configure` to build software with
[Cosmopolitan Libc][cosmo]. Here's how you use these scripts:

* Setup the `/opt/cosmo` and `/opt/cosmos` variables from the Cosmopolitan Libc
  README
* export necessary environment variables and libraries

```
export COSMO=/opt/cosmo
cd $COSMO
make toolchain
make o//third_party/zlib
make o//third_party/bzip2
make o//third_party/zstd
# edit sqlite.mk and remove OMIT_SHARED_CACHE
make o//third_party/libsqlite3.a

export COSMOS=/opt/cosmos
mkdir -p /opt/cosmos/bin
cp $COSMO/tool/scripts/cosmocc $COSMOS/bin/
cp $COSMO/tool/scripts/cosmoc++ $COSMOS/bin/
export CC=$COSMOS/bin/cosmocc
export CXX=$COSMOS/bin/cosmoc++
export LD=$COSMOS/bin/cosmoc++

mkdir /opt/cosmos/lib
cp $COSMO/o/third_party/zlib/zlib.a $COSMOS/lib/libz.a
cp $COSMO/o/third_party/zstd/zstd.a $COSMOS/lib/libzstd.a
cp $COSMO/o/third_party/bzip2/bzip2.a $COSMOS/lib/libbz2.a
cp $COSMO/o/third_party/sqlite3/libsqlite3.a $COSMOS/lib/libsqlite3.a
```

* Let's take `ncurses` as an example -- download the `ncurses` source,
  copy the `ncurses` shell script as `superconfigure` into the folder containing
  the `configure` script. 

* `./superconfigure; make; make install`

* repeat for all other libs

[cosmo]: https://github.com/jart/cosmopolitan
