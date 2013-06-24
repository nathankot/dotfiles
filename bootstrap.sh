#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"

function doIt() {
  rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude ".vim/backups/" \
        --exclude ".vim/swaps" \
        -av --no-perms . ~
}

doIt
unset doIt

if [ ! -d "$HOME/.vim/bundle/vundle" ]; then
  git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
fi
