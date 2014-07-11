brew install git
brew install hub

brew install tmux
brew install reattach-to-user-namespace --wrap-pbcopy-and-pbpaste

brew install gpg
brew install pass
brew install contacts
brew install curl-ca-bundle
brew install fzf

brew install macvim --with-cscope --with-lua --HEAD --override-system-vim
brew install ack
brew install the_silver_searcher
brew install ctags
brew install editorconfig
brew install todo-txt
brew install ledger

# Install Heroku
brew install wget
wget -qO- https://toolbelt.heroku.com/install.sh | sh
heroku plugins:install https://github.com/tpope/heroku-binstubs.git
heroku plugins:install https://github.com/tpope/heroku-wildcards.git
heroku plugins:install git://github.com/ddollar/heroku-config.git
heroku plugins:install https://github.com/heroku/heroku-repo.git

# Fish
brew install fish --head
sudo echo '/usr/local/bin/fish' >> /etc/shells
chsh -s /user/local/bin/fish
