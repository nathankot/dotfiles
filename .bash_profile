# Paths
source ~/.bash/paths.sh

# Terminal Environment
source ~/.bash/shell_env.sh

# System-Specific Settings
source ~/.bash/specific.sh

# Private Settings
if [ -f ~/.bash/private.sh ]; then
  source ~/.bash/private.sh
fi

# Functions
source ~/.bash/functions.sh

# Environments
source ~/.bash/environments.sh


