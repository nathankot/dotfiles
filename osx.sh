#!/usr/bin/env bash

sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Higher max open files.
launchctl limit maxfiles 10480 10480

# Use ligher font smoothing (default is 2)
defaults write -g AppleFontSmoothing -int 1

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Fast dialogs
defaults write NSGlobalDomain NSWindowResizeTime .001

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Enable the MacBook Air SuperDrive on any Mac
sudo nvram boot-args="mbasd=1"

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the ~/Applications folder
chflags nohidden ~/Applications

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Use multi list view in finder as default
defaults write com.apple.Finder FXPreferredViewStyle clmv

# Set help-viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# Avoid creating .DS_Store on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: Set faster speed
defaults write -g com.apple.trackpad.scaling -int 3

# Disbale mission control zoom effect
defaults write com.apple.dock expose-animation-duration -int 0

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Display sleep in 5
systemsetup -setdisplaysleep 5

# Wake on network access
systemsetup -setwakeonnetworkaccess on

# Turn on assistive devices
sudo touch /private/var/db/.AccessibilityAPIEnabled

### LOGIN ITEMS (Need to run this after installation.)
osascript -e "tell app \"System Events\"
                make login item at end with properties {path:\"/Applications/Amethyst.app\", hidden:true}
                make login item at end with properties {path:\"/Applications/Dropbox.app\", hidden:true}
                make login item at end with properties {path:\"/Applications/Shortcat.app\", hidden:true}
                make login item at end with properties {path:\"/Applications/Flux.app\", hidden:true}
                make login item at end with properties {path:\"/Applications/Alfred 2.app\", hidden:true}
              end tell"

echo "Done. Please restart computer for change to take effect."
