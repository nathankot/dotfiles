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
