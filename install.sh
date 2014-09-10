#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

source sync.sh

# Okay defer to boxen

BOXEN_REPO=${BOXEN_REPO:-'https://github.com/richardrowe/our-boxen.git'}

sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
cd /opt/boxen
git clone $BOXEN_REPO ./repo
cd /opt/boxen/repo

script/boxen
