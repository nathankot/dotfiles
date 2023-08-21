set fish_greeting "Let's go."

set -x DEVELOPMENT_SRC_PATH $HOME/Development/src

set -x FISH_CLIPBOARD_CMD pbcopy

set -x GPG_TTY (tty)

set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK 1

if command -v /usr/local/bin/brew > /dev/null
  set -x HOMEBREW_ROOT (/usr/local/bin/brew --prefix)
  # Add homebrew'd stuff to the path.
  set -x PATH $HOMEBREW_ROOT/bin $PATH
  set -x PATH $HOMEBREW_ROOT/sbin $PATH
  set -x MANPATH $HOMEBREW_ROOT/share/man $MANPATH
end

# Prefer the arm64 installation of homebrew if available
if command -v /opt/homebrew/bin/brew > /dev/null
  set -x HOMEBREW_ROOT (/opt/homebrew/bin/brew --prefix)
  # Add homebrew'd stuff to the path.
  set -x PATH $HOMEBREW_ROOT/bin $PATH
  set -x PATH $HOMEBREW_ROOT/sbin $PATH
  set -x MANPATH $HOMEBREW_ROOT/share/man $MANPATH
end

if command -v brew > /dev/null
    eval (brew shellenv)
end

set -x CFLAGS "-I$HOMEBREW_ROOT/include" $CFLAGS
set -x LDFLAGS "-L$HOMEBREW_ROOT/lib" $LDFLAGS

# Emacs
if command -v emacs > /dev/null
  set -x EDITOR "emacs"
  set -x GIT_EDITOR "emacs"
end

# Ledger
if command -v ledger > /dev/null
  set -x LEDGER_BASE_CURRENCY NZD
end

# NODE
set -x PATH node_modules/.bin $PATH

if command -v asdf > /dev/null
  source (brew --prefix asdf)/libexec/asdf.fish
end

set -x PATH ./env/bin $PATH
set -x PATH ./.env/bin $PATH

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

if test -d /Applications/Sketch.app/Contents/Resources/sketchtool/bin > /dev/null
  set -x PATH /Applications/Sketch.app/Contents/Resources/sketchtool/bin $PATH
end

# GO
if command -v go > /dev/null
  set -x GOPATH $HOME/Development
  # asdf should manage GOROOT
  # set -x GOROOT /usr/local/opt/go/libexec
  set -x GO15VENDOREXPERIMENT 1
  set -x PATH $GOPATH/bin $PATH
end

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

if test -d ~/opt/miniconda3/bin
  set -x PATH ~/opt/miniconda3/bin $PATH
end

# openssl include dir
if command -v brew > /dev/null
  set OPENSSL_PREFIX (brew --prefix openssl)
  set -x OPENSSL_INCLUDE_DIR $OPENSSL_PREFIX/include
  set -x OPENSSL_LIB_DIR $OPENSSL_PREFIX/lib
  set -x DEP_OPENSSL_INCLUDE $OPENSSL_PREFIX/include
end

# fix for pinentry not working within emacs:
set -x PINENTRY_USER_DATA "USE_CURSES=0"
