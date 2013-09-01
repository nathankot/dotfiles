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

installcask keyremap4macbook
installcask iterm2
installcask slate
installcask amethyst
installcask kaleidoscope

installcask google-chrome

installcask app-cleaner
installcask the-unarchiver
installcask caffeine
installcask f-lux
installcask alfred
installcask shortcat

installcask dropbox
installcask skype

# Link all the above apps to alfred
brew cask linkapps
brew cask alfred link

