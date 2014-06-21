#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

# Keys
if [ ! -d "$HOME/.gnupg" ]; then
  ln -s /Volumes/NK ~/.gnupg
fi

if [ "$1" == "update" ]; then
  rsync -av ~/.tmuxinator .
  rsync -av ~/.gitconfig .
  rsync -av ~/.timetrap.yml .
  rsync -av ~/.git_template .
  rsync -av ~/.vim/ultisnippets ./.vim/
  rsync -av ~/.config/fish ./.config/ --exclude "fish_history" --exclude "generated_completions"
  rsync -av ~/lib/iterm2/com.googlecode.iterm2.plist ./lib/iterm2/com.googlecode.iterm2.plist
  rsync -av ~/Library/Preferences/org.pqrs.KeyRemap4MacBook.plist ./Library/Preferences/org.pqrs.KeyRemap4MacBook.plist
  rsync -av ~/Library/Application\ Support/KeyRemap4MacBook/private.xml ./Library/Application\ Support/KeyRemap4MacBook/private.xml
fi

rsync --exclude ".git/" \
      --exclude ".DS_Store" \
      --exclude "bootstrap.sh" \
      --exclude "install.sh" \
      --exclude "brew.sh" \
      --exclude "osx.sh" \
      --exclude "README.md" \
      -av --no-perms . ~
