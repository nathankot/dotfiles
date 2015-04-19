# We don't need to redefine paths for bash.
# Just use boxen d(*.*)b
if [ -f ~/opt/boxen/env.sh ]; then
  source /opt/boxen/env.sh
fi

# Use alernative place to store boxen source
export BOXEN_SRC_DIR=$HOME/Development/Workflow
# virtualenv
export PATH="./env/bin:$PATH"
# haskell
export PATH="$HOME/Library/Haskell/bin:$PATH"
# home bin
export PATH="$HOME/bin:$PATH"
# local bin should take precedence
export PATH="./.bin:$PATH"
export PATH="./bin:$PATH"
# Browser testing
export CHROME_BIN="/Applications/Google\ Chrome.app/Contents/MacOS/Google Chrome"
export LEDGER="$HOME/Documents/Personal/Accounts/current.ledger"
