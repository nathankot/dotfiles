#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

# Things that are updated from time to time
# programatically.
if [ "$1" == "update" ]; then
  rsync -av ~/.gitconfig ./dotfiles/
  rsync -av ~/.timetrap.yml ./dotfiles/
  rsync -av ~/.git_template ./dotfiles/
  rsync -av ~/.config/fish ./dotfiles/.config/ --exclude "fish_history" --exclude "generated_completions"
fi

rsync --exclude ".git/" \
      --exclude ".DS_Store" \
      -av --no-perms ./dotfiles/ ~
