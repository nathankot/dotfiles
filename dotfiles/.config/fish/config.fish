set -x SHELL /usr/local/bin/fish

# Paths
source ~/.shell/paths.fish

# Environment
source ~/.shell/environments.fish

if test -f ~/.shell/private.fish
  source ~/.shell/private.fish
end

# Functions
source ~/.shell/functions.fish

# Aliases
source ~/.shell/aliases.fish
