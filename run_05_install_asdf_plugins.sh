#!/bin/sh

. ./.profile

# Add asdf plugins
while read plugin version
do
    if ! asdf plugin list | grep --silent $plugin
    then
        asdf plugin add $plugin
    else
        asdf plugin update $plugin
    fi
done < ~/.tool-versions

# Install asdf packages
asdf install
