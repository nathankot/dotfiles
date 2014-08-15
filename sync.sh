#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

if [ "$1" == "update" ]; then
  rsync -av ~/.tmuxinator ./dotfiles/
  rsync -av ~/.gitconfig ./dotfiles/
  rsync -av ~/.timetrap.yml ./dotfiles/
  rsync -av ~/.git_template ./dotfiles/
  rsync -av ~/.config/fish ./dotfiles/.config/ --exclude "fish_history" --exclude "generated_completions"
fi

rsync --exclude ".git/" \
      --exclude ".DS_Store" \
      -av --no-perms ./dotfiles/ ~
