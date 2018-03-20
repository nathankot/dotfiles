set fish_greeting "Let's go."

set -x DEVELOPMENT_SRC_PATH $HOME/Development/src

set -x FISH_CLIPBOARD_CMD pbcopy
set -x TERM screen-256color

set -x CFLAGS "-I$HOMEBREW_ROOT/include" $CFLAGS
set -x LDFLAGS "-L$HOMEBREW_ROOT/lib" $LDFLAGS

set -x GPG_TTY (tty)

set -x HOMEBREW_ROOT /usr/local
set -x HOMEBREW_NO_ANALYTICS 1

# Add homebrew'd stuff to the path.
set -x PATH $HOMEBREW_ROOT/bin $PATH
set -x PATH $HOMEBREW_ROOT/sbin $PATH
set -x MANPATH $HOMEBREW_ROOT/share/man $MANPATH

# Emacs
if command -v emacs > /dev/null
  set -x EDITOR emacs
  set -x GIT_EDITOR emacs
  set -x ALTERNATIVE_EDITOR vim
end

# Ledger
if command -v ledger > /dev/null
  set -x LEDGER_BASE_CURRENCY NZD
end

# NODE
if command -v nodenv > /dev/null
  set -x NODENV_ROOT $HOME/.nodenv
  set -x PATH node_modules/.bin $PATH
  . (nodenv init -|psub)
end

# RUBY
if test -d ~/.rbenv > /dev/null
  set -x RBENV_ROOT $HOME/.rbenv
  set -x RUBY_BUILD_ROOT $HOME/.ruby-build
  set -x PATH $RBENV_ROOT/shims $RBENV_ROOT/bin $PATH
  rbenv rehash >/dev/null ^&1
end

# Virtualenv
if command -v virtualenv > /dev/null
  set -x PATH ./env/bin $PATH
end

# Haskell
if command -v stack > /dev/null
  set -x PATH $HOME/.local/bin $PATH
end

# Rust
if test -d $HOME/.cargo/bin > /dev/null
  set -x CARGO_HOME $HOME/.cargo
  set -x PATH $CARGO_HOME/bin $PATH
end

if test -d $DEVELOPMENT_SRC_PATH/github.com/rust-lang/rust/src > /dev/null
  set -x RUST_SRC_PATH $DEVELOPMENT_SRC_PATH/github.com/rust-lang/rust/src
end

# GO
if command -v go > /dev/null
  set -x GOPATH $HOME/Development
  set -x GO15VENDOREXPERIMENT 1
  set -x PATH $GOPATH/bin $PATH
end

# ./bin should take precedence
set -x PATH ./.bin $PATH
set -x PATH ./bin $PATH

# Browser testing
set -x CHROME_BIN /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome

# Ledger
set -x LEDGER ~/Google\ Drive/Documents/Accounting/current.ledger
set -x LEDGER_PRICE_DB ~/Google\ Drive/Documents/Accounting/prices.db
set -x LEDGER_PRICE_FORMAT 'P %{date} %{symbol} %{price}'

# Google cloud
if test -d /usr/local/google-cloud-sdk
  set -x PATH /usr/local/google-cloud-sdk/bin $PATH
end

# openssl include dir
set -x OPENSSL_INCLUDE_DIR $HOMEBREW_ROOT/opt/openssl/include
set -x OPENSSL_LIB_DIR $HOMEBREW_ROOT/opt/openssl/lib
set -x DEP_OPENSSL_INCLUDE $HOMEBREW_ROOT/opt/openssl/include
