#!/bin/sh

. ./.env

# Add asdf plugins
for tool_version in $(cat ~/.tool-versions); do
    plugin=${tool_version%% *}
    asdf plugin list | grep $plugin > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        asdf plugin add $plugin
    fi
done

# Add asdf plugins
# for plugin in $(cat ~/.asdf-plugins); do
#     asdf plugin list | grep $plugin > /dev/null 2>&1
#     if [ $? -ne 0 ]; then
#         asdf plugin add $plugin
#     fi
# done

# Import the Node.js release team's OpenPGP keys to main keyring
# SEE: https://github.com/asdf-vm/asdf-nodejs/issues/138
$ASDF_DIR/plugins/nodejs/bin/import-release-team-keyring

# FIXME: Installing python first as a workaround to gcloud requiring it 
# SEE: https://github.com/jthegedus/asdf-gcloud/blob/master/bin/exec-env#L6
asdf install python 3.6.8

# Install asdf packages
asdf install
