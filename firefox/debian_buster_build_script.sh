#!/bin/bash
set -euo pipefail

#apt install mercurial
#hg clone --config ui.clonebundles=false https://hg.mozilla.org/releases/mozilla-esr60/

wget https://ftp.mozilla.org/pub/firefox/releases/60.9.0esr/source/firefox-60.9.0esr.source.tar.xz
tar -xvf firefox-60.9.0esr.source.tar.xz

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo apt install llvm clang

cd firefox-60.9.0 || exit

./mach bootstrap

rustup install 1.32.0
rustup default 1.32.0

./mach build
#./mach run
