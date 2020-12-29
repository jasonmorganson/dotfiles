#!/bin/sh

. ./.env

# Add asdf plugins
while read plugin
do
    if ! asdf plugin list | grep --slient $plugin
    then
        asdf plugin add $plugin
    fi
done < ~/.tool-versions

# Install asdf packages
asdf install
