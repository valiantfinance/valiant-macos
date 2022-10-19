#!/usr/bin/env bash

# ---------------------------------------------------------------------------- #
# Valiant Platform Development Environment Setup Script
#
# You should run this as part of the setup process described here:
# https://www.notion.so/valiant/Development-Environment-Setup-9ce1f474312241dbb11ad52bf95320ab
# ---------------------------------------------------------------------------- #

function append_config() {
  if [ ! -f $1 ]
  then
    return
  fi
  if grep -q "$2" "$1"
  then
    return
  fi
  echo "Appending to $1: $2"
  echo >> "$1"
  echo "# Added by platform_setup.sh" >> "$1"
  echo "$2" >> "$1"
}

function append_file() {
  append_config "$HOME/.zshrc" "$1"
  append_config "$HOME/.bash_profile" "$1"
}

if pkgutil --pkg-info=com.apple.pkg.CLTools_Executables | grep -q "version"
then
  echo "XCode CLI Tools already installed!"
else
  echo "Installing XCode CLI Tools..."
  sudo xcode-select --install
fi

if command -v brew | grep -q "brew"
then
  echo "Homebrew already installed!"
else
  echo "Installing Homebrew..."
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o brew.sh
  source brew.sh
fi

echo "Load Homebrew when the shell starts..."
append_file 'eval "$(/opt/homebrew/bin/brew shellenv)"'
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing Brewfile..."
brew bundle

echo "Add Heroku Multiple Accounts Plugin..."
heroku plugins:install heroku-accounts

echo "Copying pry config..."
cp -np .pryrc ~

echo "(Re)starting PostgreSQL and Redis..."
brew services restart postgresql
brew services restart redis
