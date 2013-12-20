# Python scripts (For Powerline)
set PYTHONPATH /usr/local/lib/python2.7/site-packages $PYTHONPATH

# Add ~/bin to path
set PATH ./bin $HOME/bin $PATH

# Homebrew executables
set PATH /usr/local/bin:/usr/local/sbin $PATH

# Heroku toolbelt
set PATH /usr/local/heroku/bin $PATH

# NPM
set PATH ./node_modules/.bin:/usr/local/share/npm/bin $PATH

# RBENV
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1
