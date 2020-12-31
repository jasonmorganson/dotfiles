#!/bin/sh

. ./.profile

# Add asdf plugins
while read plugin version
do
    if ! asdf plugin list | grep --silent $plugin
    then
        asdf plugin update $plugin
    fi
done < ~/.tool-versions
