#!/bin/sh

. ./.profile

# Ensure essential bundles are installed
brew bundle --file=/dev/stdin <<EOF
brew "asdf"
brew "git"
brew "antibody"
brew "krew"
brew "nvim"
brew "tmux"
brew "vivid"
EOF
