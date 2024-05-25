#!/bin/sh
set -e

# the zip folder
cd /zip
mkdir -p ./usr/share/ssl/certs
cp /etc/ssl/certs/*.* ./usr/share/ssl/certs || true

mkdir -p ./ssl/certs
cp /etc/ssl/certs/*.* ./ssl

cp "$BASELOC"/web/wget/wgetrc /zip
ls -al /zip
