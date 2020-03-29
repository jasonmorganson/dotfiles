#!/bin/sh

# Ensure asdf is installed
brew install asdf

# Add asdf plugins
asdf plugin add k9s
asdf plugin add helm
asdf plugin add shfmt
asdf plugin add nodejs
asdf plugin add python
asdf plugin add kubectx
asdf plugin add helmfile
asdf plugin add postgres
asdf plugin add shellcheck
asdf plugin add stern https://github.com/looztra/asdf-stern
asdf plugin add yq https://github.com/sudermanjr/asdf-yq.git
asdf plugin add sops https://github.com/feniix/asdf-sops.git
asdf plugin add kubectl https://github.com/Banno/asdf-kubectl.git
asdf plugin add gcloud https://github.com/jthegedus/asdf-gcloud.git
asdf plugin add skaffold https://github.com/kristoflemmens/asdf-skaffold.git

# Import the Node.js release team's OpenPGP keys to main keyring
# SEE: https://github.com/asdf-vm/asdf-nodejs/issues/138
$ASDF_DIR/plugins/nodejs/bin/import-release-team-keyring

# FIXME: Installing python first as a workaround to gcloud requiring it 
# SEE: https://github.com/jthegedus/asdf-gcloud/blob/master/bin/exec-env#L6
asdf install python 3.6.8

# Install asdf packages
asdf install