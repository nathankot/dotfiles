### This stuff is generated by Boxen, but they don't support
### fish so it's c&p'd here manually.
#############################################################
set -x BOXEN_HOME /opt/boxen
set -x BOXEN_BIN_DIR /opt/boxen/bin
set -x BOXEN_CONFIG_DIR /opt/boxen/config
set -x BOXEN_DATA_DIR /opt/boxen/data
set -x BOXEN_ENV_DIR /opt/boxen/env.d
set -x BOXEN_SRC_DIR $HOME/Development/Workflow
set -x BOXEN_LOG_DIR /opt/boxen/log
set -x BOXEN_SOCKET_DIR /opt/boxen/data/project-sockets
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
# Heroku
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
# Docker
for line in (boot2docker shellinit 2>/dev/null)
  eval $line
end
# MONGODB
set -x BOXEN_MONGODB_HOST 127.0.0.1
set -x BOXEN_MONGODB_PORT 27017
set -x BOXEN_MONGODB_URL mongodb://$BOXEN_MONGODB_HOST:$BOXEN_MONGODB_PORT/
# REDIS
set -x BOXEN_REDIS_HOST 127.0.0.1
set -x BOXEN_REDIS_PORT 16379
set -x BOXEN_REDIS_URL "redis://$BOXEN_REDIS_HOST:$BOXEN_REDIS_PORT/"
############################################################
# End of boxen stuff

# Virtualenv
set -x PATH ./env/bin $PATH
# Haskell
set -x PATH ./.cabal-sandbox/bin $PATH
set -x PATH ~/Library/Haskell/bin $PATH
# Home bin
set -x PATH $HOME/bin $PATH
# ./bin should take precedence
set -x PATH ./.bin $PATH
set -x PATH ./bin $PATH
# Browser testing
set -x CHROME_BIN /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
# Ledger
set -x LEDGER ~/Documents/Personal/Accounts/current.ledger
set -x LEDGER_PRICE_DB ~/Documents/Personal/Accounts/prices.db
