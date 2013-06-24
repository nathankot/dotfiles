# Install Bash 4
brew install bash

git clone https://github.com/nojhan/liquidprompt.git ~/bin/liquidprompt

sudo echo /usr/local/bin/bash >> /etc/shells

chsh -s /usr/local/bin/bash
