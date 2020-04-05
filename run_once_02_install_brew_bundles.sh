#!/bin/bash

# Install brew
if [[ "$OSTYPE" == "darwin"* ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH
fi

# Make sure brew is up to date
brew update

# Install gcc
HOMEBREW_NO_ENV_FILTERING=1 brew install --force-bottle glibc make

# Install brew bundles
brew bundle install