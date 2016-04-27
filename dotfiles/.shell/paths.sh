# We don't need to redefine paths for bash.
# Just use boxen d(*.*)b
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

# virtualenv
if command -v virtualenv > /dev/null; then
  export PATH="./env/bin:$PATH"
fi
