# Python scripts (For Powerline)
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

# Add ~/bin to path
export PATH="./bin:$HOME/bin:$PATH"

# Homebrew executables
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Heroku toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# NPM
export PATH="./node_modules/.bin:/usr/local/share/npm/bin:$PATH"

# RBENV
eval "$(rbenv init -)"

# PHP
export PATH="$(brew --prefix josegonzalez/php/php55)/bin:$PATH"
