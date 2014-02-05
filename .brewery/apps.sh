# Install native apps
# =============================================================================

brew update
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
installcask amethyst
installcask kaleidoscope

installcask google-chrome
installcask google-chrome-canary

installcask app-cleaner
installcask the-unarchiver
installcask caffeine
installcask f-lux
installcask alfred
installcask shortcat
installcask authy-bluetooth

installcask google-drive
installcask dropbox
installcask layervault
installcask skype

brew cask linkapps
