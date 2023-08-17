#!/bin/bash

# Install python2
wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tar.xz
tar -xvf Python-2.7.18.tar.xz
cd Python-2.7.18/
./configure --with-pydebug --with-ssl
make -s -j$(nproc)
sudo make install
python --version

cd ..

#hg clone --config ui.clonebundles=false https://hg.mozilla.org/releases/mozilla-esr60/
wget https://ftp.mozilla.org/pub/firefox/releases/60.9.0esr/source/firefox-60.9.0esr.source.tar.xz
tar -vxf firefox-60.9.0esr.source.tar.xz

pip3 install --user MozPhab --break-system-packages

cd firefox-60.9.0
./mach bootstrap

rustup install 1.32.0
rustup default 1.32.0

# Install build deps
sudo apt install libgtk2.0-dev libgtk-3-dev libgconf2-dev libdbus-glib-1-dev yasm libpulse-dev libxt-dev libpango1.0-dev libx11-dev libx11-xcb-dev

./mach build
