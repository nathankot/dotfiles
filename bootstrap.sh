#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

function doIt() {
  rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "bootstrap.sh" \
        --exclude "install.sh" \
        --exclude "brew.sh" \
        --exclude "osx.sh" \
        --exclude "README.md" \
        --exclude ".tmuxinator/" \
        -av --no-perms . ~

  rsync -av ~/.tmuxinator .
}

doIt
unset doIt

if [ ! -d "$HOME/.vim/bundle/vundle" ]; then
  git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
fi
