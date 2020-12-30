#!/bin/sh

. ./.profile

# Essential bundles
bundles="
asdf
getantibody/tap/antibody
helm
nvim
tmux
"

# Ensure essential bundles are installed
for bundle in $bundles
do
    brew install $bundle
done

# Install brew bundles
brew bundle install
