export DEVELOPMENT_SRC_PATH=$HOME/Development/src

# Use boxen defaults where we can
if [ -f ~/opt/boxen/env.sh ]; then
  source /opt/boxen/env.sh
fi

# home bin
export PATH="$HOME/bin:$PATH"
# local bin
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
  eval "$(nodenv init -)"
fi
