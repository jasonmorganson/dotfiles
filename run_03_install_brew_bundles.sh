#!/bin/sh

. ./.profile

# FIXME: MacOS is getting a conflict on 2to3 in the python install
# This forces brew to overwrite the links
# See https://github.com/actions/virtual-environments/issues/2322
# Fixed in https://github.com/actions/virtual-environments/pull/2326
# It has not been added to the latest macos runner release (20201212.1) as of 12-30-20
brew install python@3.9 || brew link --overwrite python@3.9

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
