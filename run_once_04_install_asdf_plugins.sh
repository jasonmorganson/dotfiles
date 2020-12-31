#!/bin/sh

. ./.profile

# Add asdf plugins
while read plugin version
do
    if ! asdf plugin list | grep --silent $plugin
    then
        asdf plugin add $plugin
    fi
done < ~/.tool-versions

# FIXME: Once node plugin auto installs keys
# Import the Node.js release team's OpenPGP keys to main keyring
# SEE: https://github.com/asdf-vm/asdf-nodejs/issues/138
if [ -d $ASDF_DIR/plugins/nodejs ]
then
    $ASDF_DIR/plugins/nodejs/bin/import-release-team-keyring
fi