### Ruby Environment

export RBENV_ROOT=/usr/local/var/rbenv
if [ -d /usr/local/var/rbenv ]; then
  eval "$(rbenv init -)";
fi

# Fix for some compiled gems
# export CC=gcc

###
