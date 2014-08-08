#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

source sync.sh
source osx.sh

# Okay defer to boxen
git submodule init
git submodule update

sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
cd /opt/boxen
ln -s /opt/boxen/repo "$(dirname "${BASH_SOURCE}")/boxen"
cd /opt/boxen/repo

# script/boxen

