# Install latest zsh
brew install zsh

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

sudo echo /usr/local/bin/zsh >> /etc/shells

chsh -s /usr/local/bin/zsh
