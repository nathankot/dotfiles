set -x SHELL /usr/local/bin/fish

# Paths
source ~/.shell/paths.fish

# Language Environments
source ~/.shell/environments.fish

if test -f ~/.shell/private.fish
  source ~/.shell/private.fish
end

# Terminal Environment
source ~/.shell/shell_env.fish

# Functions
source ~/.shell/functions.fish

# Aliases
source ~/.shell/aliases.fish

