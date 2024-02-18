# This is usually loaded by Vim
# Only include whats necessary.
source ~/.shell/paths.sh

if [ -f ~/.shell/private.sh ]; then
  source ~/.shell/private.sh
fi
. "$HOME/.cargo/env"
