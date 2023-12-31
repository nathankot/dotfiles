#!/usr/bin/env bash
set -e

# Please ensure you have the following requirements before
# running this script:
#
# * Homebrew
# * Python: `brew install python3` (probably not necessary anymore)
# * Setup Virtual Env: `/usr/bin/python3 -m venv env`

if [[ "$1" == "" ]]; then
  echo Please provide 'user' or 'admin' as the first argument
  exit
fi

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

if [[ "$1" == "user" ]]; then
  ../env/bin/ansible-playbook -v install_user.yml -e "github_access_token=$GITHUB_API_TOKEN"
elif [[ "$1" == "admin" ]]; then
  ANSIBLE_BECOME_ASK_PASS=True ../env/bin/ansible-playbook -v install.yml -e "github_access_token=$GITHUB_API_TOKEN"
fi

cd - || exit
