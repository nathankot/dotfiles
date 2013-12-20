#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

# Keys
if [ ! -d "$HOME/.gnupg" ]; then
  ln -s /Volumes/NK ~/.gnupg
fi

if [ "$1" == "update" ]; then
  rsync -av ~/.tmuxinator .
  rsync -av ~/.gitconfig .
  rsync -av ~/.git_template .
  rsync -av ~/.vim/snippets ./.vim/
  rsync -av ~/.config/fish/fish.config ./.config/fish/
  rsync -av ~/.config/fish/functions ./.config/fish/
  rsync -av ~/lib/iterm2/com.googlecode.iterm2.plist ./lib/iterm2/com.googlecode.iterm2.plist
fi

rsync --exclude ".git/" \
      --exclude ".DS_Store" \
      --exclude "bootstrap.sh" \
      --exclude "install.sh" \
      --exclude "brew.sh" \
      --exclude "osx.sh" \
      --exclude "README.md" \
      -av --no-perms . ~

if [ ! -d "$HOME/.vim/bundle/vundle" ]; then
  git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
fi
