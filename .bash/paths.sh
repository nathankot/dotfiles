# The PATH, assumes homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Add ~/bin to path
export PATH="$HOME/bin:$PATH"

export PYTHONPATH="$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH"
