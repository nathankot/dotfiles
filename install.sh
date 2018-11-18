#!/usr/bin/env bash
set -e

# Please ensure you have the following requirements before
# running this script:
#
# * Homebrew
# * Python 2: `brew install python@2`
# * Virtualenv: `pip install virtualenv`
# * Env: `virtualenv env`

cd "$(dirname "${BASH_SOURCE}")"

ROOT=$PWD
FILES_SOURCE=$(find "$ROOT/dotfiles" -depth 1)
FILES_DEST=${FILES_SOURCE//$ROOT\/dotfiles/$HOME}
cd "$HOME" || exit
xargs -n 1 rm -rf <<<"$FILES_DEST"
xargs -n 1 ln -s <<<"$FILES_SOURCE"

cd "$ROOT/workstation"
../env/bin/pip install -r ../requirements.txt
../env/bin/ansible-playbook install.yml -e "github_access_token=$GITHUB_API_TOKEN"
cd - || exit
