set -x BOXEN_HOME /opt/boxen
set -x BOXEN_BIN_DIR /opt/boxen/bin
set -x BOXEN_CONFIG_DIR /opt/boxen/config
set -x BOXEN_DATA_DIR /opt/boxen/data
set -x BOXEN_ENV_DIR /opt/boxen/env.d
set -x BOXEN_LOG_DIR /opt/boxen/log
set -x BOXEN_SOCKET_DIR /opt/boxen/data/project-sockets
set -x BOXEN_SRC_DIR "/Users/$DOT_USER/Development"
set -x BOXEN_GITHUB_LOGIN $GITHUB_USER
set -x HOMEBREW_ROOT /opt/boxen/homebrew
set -x HOMEBREW_CACHE /opt/boxen/cache/homebrew
set -x CFLAGS "-I$HOMEBREW_ROOT/include"
set -x LDFLAGS "-L$HOMEBREW_ROOT/lib"

if test -f $BOXEN_HOME/repo/.git
  set -x BOXEN_SETUP_VERSION (env GIT_DIR=$BOXEN_HOME/repo/.git git rev-parse --short HEAD)
end

# Add homebrew'd stuff to the path.
set -x PATH $BOXEN_HOME/homebrew/bin $BOXEN_HOME/homebrew/sbin $PATH
set -x MANPATH $BOXEN_HOME/homebrew/share/man $MANPATH
set -x PATH $BOXEN_HOME/bin $PATH

set -x PATH $HOME/bin $PATH

# Heroku toolbelt
set -x PATH $BOXEN_HOME/heroku/bin $PATH

# PHP
set -x PHPENV_ROOT $BOXEN_HOME/phpenv
set -x PATH $BOXEN_HOME/phpenv/shims $BOXEN_HOME/phpenv/bin $BOXEN_HOME/phpenv/plugins/php-build/bin $PATH
phpenv rehash >/dev/null ^&1

# NODE
set -x NODENV_ROOT $BOXEN_HOME/nodenv
set -x PATH $BOXEN_HOME/nodenv/shims $BOXEN_HOME/nodenv/bin $PATH
set -x PATH node_modules/.bin $PATH
nodenv rehash >/dev/null ^&1

# RUBY
set -x PATH $BOXEN_HOME/ruby-build/bin $PATH
set -x RBENV_ROOT /opt/boxen/rbenv
set -x PATH $RBENV_ROOT/shims $RBENV_ROOT/bin $PATH
rbenv rehash >/dev/null ^&1

# Haskell
set -x PATH ~/Library/Haskell/bin $PATH

# Virtualenv
set -x PATH ./env/bin $PATH

# Docker
set -x BOOT2DOCKER_DIR /opt/boxen/data/docker
set -x BOOT2DOCKER_PROFILE /opt/boxen/config/docker/profile
for line in (boot2docker shellinit 2>/dev/null)
  eval $line
end

# ./bin should take precedence
set -x PATH ./.bin $PATH
set -x PATH ./bin $PATH
