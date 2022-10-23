#!/usr/bin/env bash
set -e

# Please ensure you have the following requirements before
# running this script:
#
# * Homebrew
# * Python: `brew install python3` (probably not necessary anymore)
# * Setup Virtual Env: `/usr/bin/python3 -m venv env`

cd "$(dirname "${BASH_SOURCE}")"

ROOT=$PWD
FILES_SOURCE=$(find "$ROOT/dotfiles" -depth 1)
FILES_DEST=${FILES_SOURCE//$ROOT\/dotfiles/$HOME}
cd "$HOME" || exit
xargs -n 1 rm -rf <<<"$FILES_DEST"
xargs -n 1 ln -s <<<"$FILES_SOURCE"

cd "$ROOT/workstation"
../env/bin/pip install -r ../requirements.txt
../env/bin/ansible-galaxy install -r ./requirements.yml
../env/bin/ansible-playbook -v install.yml -e "github_access_token=$GITHUB_API_TOKEN"
cd - || exit
