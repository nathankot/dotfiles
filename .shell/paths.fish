# **Don't forget to update paths.sh for VIM**

# PythonTests: 89, Assertions: 192, Errors: 2. scripts (For Powerline)
set -x PYTHONPATH /usr/local/lib/python2.7/site-packages $PYTHONPATH

# Add ~/bin to path
set -x PATH ./bin $HOME/bin $PATH

# Homebrew executables
set -x PATH /usr/local/bin /usr/local/sbin $PATH

# Heroku toolbelt
set -x PATH /usr/local/heroku/bin $PATH

# PHP
set -x PATH /usr/local/Cellar/php54/5.4.26/bin $PATH

# NPM
set -x PATH ./node_modules/.bin /usr/local/share/npm/bin $PATH

# RBENV
set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# PYENV
#set -x PATH "$HOME/.pyenv/shims" $PATH
#. (pyenv init - | psub)

# Hackage
set -x PATH /Users/nathan/.cabal/bin $PATH

