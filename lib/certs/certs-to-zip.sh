#!/usr/bin/env bash
set -e

# the zip folder
cd /zip
mkdir -p ./usr/share/ssl/root
cp /etc/ssl/certs/*.* ./usr/share/ssl/root/ || true

mkdir -p ./ssl/
cp -r /etc/ssl/certs ./ssl

cp $BASELOC/web/wget/wgetrc /zip
ls -al /zip
