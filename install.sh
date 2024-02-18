#!/usr/bin/env bash
set -e

if [[ "$1" == "" ]]; then
  echo Please provide 'user' or 'admin' as the first argument
  exit
fi

# Support the new homebrew path if it is available:
export PATH="$PATH:/opt/homebrew/bin"

# Try to grab api token from fish private env file
if [[ "$GITHUB_API_TOKEN" == "" ]]; then
  export GITHUB_API_TOKEN=$(tac ./home/.shell/private.fish | grep -m 1 GITHUB_API_TOKEN | awk '{ print $4 }')
fi

# If we still don't have it, ask for it
if [[ "$GITHUB_API_TOKEN" == "" ]]; then
  read -p "Enter github access token: " GITHUB_API_TOKEN
  export GITHUB_API_TOKEN
  echo "set -x GITHUB_API_TOKEN $GITHUB_API_TOKEN" >> ./home/.shell/private.fish
fi

cd "$(dirname "${BASH_SOURCE}")"

ROOT=$PWD
FILES_SOURCE=$(find "$ROOT/home" -depth 1)
FILES_DEST=${FILES_SOURCE//$ROOT\/home/$HOME}
cd "$HOME" || exit
xargs -n 1 rm -rf <<<"$FILES_DEST"
xargs -n 1 ln -s <<<"$FILES_SOURCE"
chmod 700 ~/.gnupg

cd "$ROOT/workstation"
../env/bin/pip install -r ../requirements.txt
../env/bin/ansible-galaxy install -r ./requirements.yml

if [[ "$1" == "user" ]]; then
  ../env/bin/ansible-playbook install_user.yml -e "github_access_token=$GITHUB_API_TOKEN"
elif [[ "$1" == "admin" ]]; then
  ANSIBLE_BECOME_ASK_PASS=True ../env/bin/ansible-playbook install.yml -e "github_access_token=$GITHUB_API_TOKEN"
fi

cd - || exit
