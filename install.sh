#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

FILES_SOURCE=$(find "$PWD/dotfiles" -depth 1)
FILES_DEST=${FILES_SOURCE//$PWD\/dotfiles/$HOME}
cd "$HOME" || exit
xargs -n 1 rm -r <<<"$FILES_DEST"
xargs -n 1 ln -s <<<"$FILES_SOURCE"
cd - || exit
