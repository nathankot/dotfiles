export SHELL=/usr/local/bin/zsh

# Paths
source ~/.shell/paths.sh

# Language Environments
source ~/.shell/environments.sh

if [ -f ~/.shell/private.sh ]; then
  source ~/.shell/private.sh
fi

if [ -f ~/.bash_private ]; then
  source ~/.bash_private
fi
