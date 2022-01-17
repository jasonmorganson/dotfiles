#!/bin/sh

. ./.profile

asdf_plugin_add() {
    # Exit code 2 indicates the plugin is already installed so test and exit
    # sucessfully if that is the error code.
    asdf plugin add $1 $2 || test $? = 2
}

asdf_plugin_add deno
asdf_plugin_add direnv
asdf_plugin_add gcloud
asdf_plugin_add golang
asdf_plugin_add helm
asdf_plugin_add helmfile
asdf_plugin_add krew
asdf_plugin_add kubectl
asdf_plugin_add kubectx
asdf_plugin_add nodejs
asdf_plugin_add poetry
asdf_plugin_add postgres
asdf_plugin_add python
asdf_plugin_add shellcheck
asdf_plugin_add shfmt
asdf_plugin_add skaffold
asdf_plugin_add sops
asdf_plugin_add yq