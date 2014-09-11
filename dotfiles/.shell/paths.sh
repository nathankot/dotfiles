if [ -f ~/opt/boxen/env.sh ]; then
  source /opt/boxen/env.sh
fi

export LUA_PATH=$HOMEBREW_ROOT/lib/lua/5.2:$LUA_PATH
export LUAC_PATH=$HOMEBREW_ROOT/lib/lua/5.2:$LUAC_PATH
export CHROME_BIN=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
