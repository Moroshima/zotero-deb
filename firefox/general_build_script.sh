#!/bin/bash
set -euo pipefail

## Clone code repo use mercurial
#hg clone --config ui.clonebundles=false https://hg.mozilla.org/releases/mozilla-esr60/
#cd mozilla-esr60

## Download source code tarball from mozilla ftp is faster
wget https://ftp.mozilla.org/pub/firefox/releases/60.9.0esr/source/firefox-60.9.0esr.source.tar.xz
tar -vxf firefox-60.9.0esr.source.tar.xz
cd firefox-60.9/

## Prepare build environment
./mach bootstrap

## LLVM and Clang is also needed but are not installed during bootstrap
#sudo apt install llvm clang

## Build and run
./mach build
#./mach run
