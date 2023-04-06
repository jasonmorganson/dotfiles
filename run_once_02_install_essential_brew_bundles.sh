#!/bin/sh
. ./.profile
set -eu

# Ensure essential bundles are installed
brew bundle --file=/dev/stdin << EOF
brew "git"
brew "nvim"
EOF
