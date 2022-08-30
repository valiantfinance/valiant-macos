# ---------------------------------------------------------------------------- #
# Valiant macOS setup script.
# ---------------------------------------------------------------------------- #

# curl -fsSL 'https://raw.githubusercontent.com/valiantfinance/valiant-macos/master/setup.sh' | bash

# Install Homebrew.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew doctor

# Install m-cli.
brew install m-cli

# Install Homebrew services & bundle
brew tap homebrew/core
brew tap homebrew/services
brew tap homebrew/bundle
brew tap caskroom/cask

# Enable Firewall.
m firewall enable

# Set up the Dock.
m dock magnification YES
m dock position BOTTOM
m dock prune

# Install default apps & add to Dock.
brew cask install google-chrome
brew cask install dropbox
brew cask install quip
brew cask install slack

# Add default apps to Dock.
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Slack.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Quip.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/System Preferences.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
killall Dock

# Enable Screen Sharing.
sudo defaults write /var/db/launchd.db/com.apple.launchd/overrides.plist com.apple.screensharing -dict Disabled -bool false
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.screensharing.plist

# Create required user.
m user create
