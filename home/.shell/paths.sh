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
if command -v ghcup > /dev/null; then
  export PATH="$HOME/.ghcup/bin:$PATH"
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

export PATH="./env/bin:$PATH"

if test -d ~/opt/miniconda3/bin; then
  export PATH="~/opt/miniconda3/bin:$PATH"
fi

if test -d /usr/local/google-cloud-sdk > /dev/null; then
  export PATH="/usr/local/google-cloud-sdk:$PATH"
fi

# node
export PATH=node_modules/.bin:$PATH

if command -v asdf > /dev/null; then
  # ASDF configuration code
  if test -z $ASDF_DATA_DIR
      set _asdf_shims "$HOME/.asdf/shims"
  else
      set _asdf_shims "$ASDF_DATA_DIR/shims"
  end

  # Do not use fish_add_path (added in Fish 3.2) because it
  # potentially changes the order of items in PATH
  if not contains $_asdf_shims $PATH
      set -gx --prepend PATH $_asdf_shims
  end
  set --erase _asdf_shims
fi
