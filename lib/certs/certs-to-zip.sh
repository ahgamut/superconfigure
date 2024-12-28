#!/bin/sh
set -e

cd "$COSMOS"
mkdir -p ./share/ssl/certs
cp /etc/ssl/certs/*.* ./share/ssl/certs || true
cp "$BASELOC"/web/wget/wgetrc "$COSMOS"/share
