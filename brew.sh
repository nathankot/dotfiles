#!/usr/bin/env bash

sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew
brew update

# Install more recent versions of some OS X tools
brew tap homebrew/dupes

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

brew install https://raw.github.com/jingweno/gh/master/homebrew/gh.rb

source ~/.brewery/repos.sh
source ~/.brewery/zsh.sh
source ~/.brewery/workflow.sh
source ~/.brewery/ruby.sh
source ~/.brewery/node.sh
source ~/.brewery/apps.sh

# Remove outdated versions from the cellar
brew cleanup

