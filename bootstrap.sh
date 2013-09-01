#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

function doIt() {
  rsync -av ~/.tmuxinator .
  rsync -av ~/lib/iterm2/com.googlecode.iterm2.plist ./lib/iterm2/com.googlecode.iterm2.plist
  rsync -av ~/Library/Preferences/org.pqrs.KeyRemap4MacBook.plist ./Library/Preferences/org.pqrs.KeyRemap4MacBook.plist

  rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "bootstrap.sh" \
        --exclude "install.sh" \
        --exclude "brew.sh" \
        --exclude "osx.sh" \
        Make boostrap script simpler.
        --exclude "README.md" \
        -av --no-perms . ~
}

doIt
unset doIt

if [ ! -d "$HOME/.vim/bundle/vundle" ]; then
  git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
fi
