# Install native apps
# =============================================================================

brew tap phinze/homebrew-cask
brew install brew-cask

function installcask() {
  if brew cask info "${@}" | grep "Not installed" > /dev/null; then
    brew cask install "${@}"
  else
    echo "${@} is already installed."
  fi
}

installcask iterm2
installcask slate
installcask sequel-pro
installcask kaleidoscope

installcask google-chrome
installcask firefox
installcask opera

installcask dropbox
installcask bit-torrent-sync
installcask app-cleaner
installcask the-unarchiver
installcask caffeine
installcask f-lux

installcask hiss
installcask alfred
installcask skype
installcask rdio

# Link all the above apps to alfred
brew cask alfred link
