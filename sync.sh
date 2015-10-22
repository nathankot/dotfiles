#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

rsync --exclude ".git/" \
      --exclude ".DS_Store" \
      --exclude "tags" \
      -av --no-perms ./dotfiles/ ~
