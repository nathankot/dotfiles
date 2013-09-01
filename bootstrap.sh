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
        --exclude "lib/iterm2/com.googlecode.iterm2.plist" \
        --exclude "Library/Preferences/org.pqrs.KeyRemap4MacBook.plist" \
        --exclude ".tmuxinator/" \
        -av --no-perms . ~

  rsync -av ~/.tmuxinator .
  rsync -av ~/lib/iterm2/com.googlecode.iterm2.plist ./lib/iterm2/com.googlecode.iterm2.plist
  rsync -av ~/Library/Preferences/org.pqrs.KeyRemap4MacBook.plist ./Library/Preferences/org.pqrs.KeyRemap4MacBook.plist
}

doIt
unset doIt

if [ ! -d "$HOME/.vim/bundle/vundle" ]; then
  git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
fi
