# ---------------------------------------------------------------------------- #
# Valiant Platform application setup script.
# ---------------------------------------------------------------------------- #

# Install packages and services
# https://www.notion.so/valiant/1-Install-packages-and-services-8a7e7d1dcaa74d829256ca4b4772fae2

# Install XCode CLI tools - We require this for GIT
sudo xcode-select --install

# Install Homebrew - Package manager for macOS https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Oh My Zsh - https://ohmyz.sh/
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Heroku CLI & Heroku Multiple Accounts Plugin
    
brew install heroku/brew/heroku
heroku plugins:install heroku-accounts

# Install PostgreSQL - Database
brew install postgresql
brew services start postgresql

# Install Redis - In-memory data structure store
brew install redis
brew services start redis

# Install NVM - Node version manager allows us to easily change node versions
brew install nvm
# Follow the instructions at the end of the installation to add to your path.
# re-source your terminal
source ~/.zshrc

# Install Node using NVM
# Install node version
nvm install 16.4.1
# Set node version
nvm use 16.4.1
# Set as system default
nvm alias default 16.4.1

# Install puma-dev - Development server with HTTPS support
brew install puma/puma/puma-dev

# Install Yarn - Package manager for Node apps
brew install yarn

# Install and configure Pry for a better rails console experience
gem install pry
# Add the following lines to the file ~/.pryrc
echo 'Pry.config.pager = false' >> ~/.pryrc
echo 'require "awesome_print"' >> ~/.pryrc
echo 'rAwesomePrint.pry!' >> ~/.pryrc