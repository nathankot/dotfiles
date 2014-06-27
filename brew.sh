#!/usr/bin/env bash

sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# install homebrew if it doesn't exist
command -v brew >/dev/null 2>&1 || ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# Make sure we’re using the latest Homebrew
brew update

# Install more recent versions of some OS X tools
brew tap homebrew/dupes

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

source ~/.brewery/workflow.sh
source ~/.brewery/ruby.sh
source ~/.brewery/python.sh
source ~/.brewery/node.sh
source ~/.brewery/apps.sh
source ~/.brewery/repos.sh

# Remove outdated versions from the cellar
brew cleanup

