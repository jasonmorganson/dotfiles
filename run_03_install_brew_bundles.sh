#!/bin/sh

. ./.env

# FIXME: MacOS is getting a conflict on 2to3 in the python install
# This forces brew to overwrite the links
brew install python
brew link --overwrite python

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
