brew install git
brew install hub

brew install tmux
brew install reattach-to-user-namespace --wrap-pbcopy-and-pbpaste

brew install gpg
brew install pass
brew install offlineimap
brew install w3m
brew install urlview
brew install contacts
brew install curl-ca-bundle
brew install msmtp
brew install mutt --sidebar-patch
brew install fzf

brew install macvim --override-system-vim
brew install ack
brew install the_silver_searcher
brew install ctags
brew install editorconfig
brew install todo-txt

# Install Heroku
brew install wget
wget -qO- https://toolbelt.heroku.com/install.sh | sh
heroku plugins:install https://github.com/tpope/heroku-binstubs.git
heroku plugins:install https://github.com/tpope/heroku-wildcards.git
heroku plugins:install git://github.com/ddollar/heroku-config.git
heroku plugins:install https://github.com/heroku/heroku-repo.git
