# Paths
source ~/.shell/paths.sh

# Terminal Environment
source ~/.shell/shell_env.sh

# Bash Env
source ~/.shell/bash_env.sh

# System-Specific Settings
source ~/.shell/specific.sh

# Private Settings
if [ -f ~/.shell/private.sh ]; then
  source ~/.shell/private.sh
fi

# Functions
source ~/.shell/functions.sh

# Environments
source ~/.shell/environments.sh


