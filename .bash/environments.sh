### Terminal Environment

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Like to use vim?
export EDITOR=vim

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Assumes Liquid Prompt
source ~/bin/liquidprompt/liquidprompt

# Enable shell coloring
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Git completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Pass completion
if [ -f $(brew --prefix)/etc/bash_completion.d/password-store ]; then
  source $(brew --prefix)/etc/bash_completion.d/password-store
fi

###


### Ruby Environment

export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)";

# Fix for some compiled gems
# export CC=gcc

###
