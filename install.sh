#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

source sync.sh

# Okay defer to boxen

sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
cd /opt/boxen
git clone https://github.com/nathankot/our-boxen.git ./repo
cd /opt/boxen/repo

script/boxen
