#!/bin/sh

. ./.profile

# FIXME: Installing node first as a workaround to having to import pgp keys
asdf plugin add nodejs
asdf install nodejs 13.0.1

# Import the Node.js release team's OpenPGP keys to main keyring
# SEE: https://github.com/asdf-vm/asdf-nodejs/issues/138
$ASDF_DIR/plugins/nodejs/bin/import-release-team-keyring
