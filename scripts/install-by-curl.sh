#! /usr/bin/env bash

VERSION=$(curl -s "https://github.com/giovannicaligaris/firefox-phosh-theme/releases/latest/download" 2>&1 | sed "s/^.*download\/\([^\"]*\).*/\1/")
FILENAME=firefox-phosh-theme-$VERSION.tar.gz
FOLDERPATH=$PWD/firefox-phosh-theme

if [ -d "$FOLDERPATH" ]; then rm -Rf $FOLDERPATH; fi

mkdir $FOLDERPATH

cd $FOLDERPATH

curl -LJo $FILENAME https://github.com/giovannicaligaris/firefox-phosh-theme/tarball/$VERSION

tar -xzf $FILENAME --strip-components=1
rm $FILENAME

chmod +x scripts/auto-install.sh

./scripts/auto-install.sh

if [ -d "$FOLDERPATH" ]; then rm -Rf $FOLDERPATH; fi
