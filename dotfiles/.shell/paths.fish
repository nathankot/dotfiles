# **Don't forget to update paths.sh for VIM**

set -x BOXEN_HOME /opt/boxen
set -x BOXEN_BIN_DIR /opt/boxen/bin
set -x BOXEN_CONFIG_DIR /opt/boxen/config
set -x BOXEN_DATA_DIR /opt/boxen/data
set -x BOXEN_ENV_DIR /opt/boxen/env.d
set -x BOXEN_LOG_DIR /opt/boxen/log
set -x BOXEN_SOCKET_DIR /opt/boxen/data/project-sockets
set -x BOXEN_SRC_DIR /Users/nathan/Development
set -x BOXEN_GITHUB_LOGIN nathankot
set -x HOMEBREW_ROOT /opt/boxen/homebrew
set -x HOMEBREW_CACHE /opt/boxen/cache/homebrew
set -x CFLAGS "-I$HOMEBREW_ROOT/include"
set -x LDFLAGS "-L$HOMEBREW_ROOT/lib"

if test -f $BOXEN_HOME/repo/.git
  set -x BOXEN_SETUP_VERSION (GIT_DIR=$BOXEN_HOME/repo/.git git rev-parse --short HEAD)
end

# Add homebrew'd stuff to the path.
set -x PATH $BOXEN_HOME/homebrew/bin $BOXEN_HOME/homebrew/sbin $PATH
set -x MANPATH $BOXEN_HOME/homebrew/share/man $MANPATH
set -x PATH $BOXEN_HOME/bin $PATH

# Add ~/bin to path
set -x PATH ./bin $HOME/bin $PATH

# Heroku toolbelt
set -x PATH $BOXEN_HOME/heroku/bin $PATH

# PHP
set -x PHPENV_ROOT $BOXEN_HOME/phpenv
set -x PATH $BOXEN_HOME/phpenv/bin $BOXEN_HOME/phpenv/plugins/php-build/bin $PATH
phpenv init

# NODE
set -x NODENV_ROOT $BOXEN_HOME/nodenv
set -x PATH $BOXEN_HOME/nodenv/bin $PATH
set -x PATH node_modules/.bin: PATH
nodenv init

# RUBY
set -x PATH /opt/boxen/ruby-build/bin:$PATH
set -x RBENV_ROOT /opt/boxen/rbenv
set -x PATH $RBENV_ROOT/bin $PATH
rbenv rehash >/dev/null ^&1

# MONGODB
set -x BOXEN_MONGODB_HOST 127.0.0.1
set -x BOXEN_MONGODB_PORT 27017
set -x BOXEN_MONGODB_URL "mongodb://$BOXEN_MONGODB_HOST:${BOXEN_MONGODB_PORT}/"
