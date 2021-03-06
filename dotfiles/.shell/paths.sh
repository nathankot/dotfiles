export DEVELOPMENT_SRC_PATH=$HOME/Development/src

# home bin
export PATH="$HOME/bin:$PATH"
# local bin
export PATH="/usr/local/bin:$PATH"
export PATH="./.bin:$PATH"
export PATH="./bin:$PATH"

# haskell
if command -v stack > /dev/null; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# go
if command -v go > /dev/null; then
  export GOPATH="$HOME/Development"
  export PATH="$GOPATH/bin:$PATH"
fi

# rust
if test -d $HOME/.cargo/env > /dev/null; then
  export CARGO_HOME=$HOME/.cargo
  source $CARGO_HOME/env
fi

if test -d $DEVELOPMENT_SRC_PATH/github.com/rust-lang/rust/src > /dev/null; then
  export RUST_SRC_PATH=$DEVELOPMENT_SRC_PATH/github.com/rust-lang/rust/src
fi

# virtualenv
if command -v virtualenv > /dev/null; then
  export PATH="./env/bin:$PATH"
fi

if test -d /usr/local/google-cloud-sdk > /dev/null; then
  export PATH="/usr/local/google-cloud-sdk:$PATH"
fi

# node
if command -v nodenv > /dev/null; then
  export NODENV_ROOT=$HOME/.nodenv
  export PATH=node_modules/.bin:$PATH
  eval "$(nodenv init -)"
fi
