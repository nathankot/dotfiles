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
# Everything except .config is symlinked as a whole top-level entry.
FILES_SOURCE=$(find "$ROOT/home" -depth 1 -not -name .config)
FILES_DEST=${FILES_SOURCE//$ROOT\/home/$HOME}
cd "$HOME" || exit
xargs -n 1 rm -rf <<<"$FILES_DEST"
xargs -n 1 ln -s <<<"$FILES_SOURCE"

# ~/.config must be a REAL directory, linked one child at a time. Some apps
# canonicalize their config path and refuse to run when it resolves elsewhere
# (AWS VPN Client 6.x aborts with "Path is not canonical"). Linking per-child
# also means unmanaged state under ~/.config (e.g. ~/.config/AWSVPNClient)
# survives a re-run of this script.
mkdir -p "$HOME/.config"
while IFS= read -r src; do
  dest="$HOME/.config/$(basename "$src")"
  rm -rf "$dest"
  ln -s "$src" "$dest"
done < <(find "$ROOT/home/.config" -depth 1)

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
