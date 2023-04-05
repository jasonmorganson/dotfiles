#!/bin/sh
. ./.profile
set -eu

asdf_plugin_add() {
    # Exit code 2 indicates the plugin is already installed so test and exit
    # sucessfully if that is the error code.
    asdf plugin add "$1" "${2:-}" || test $? = 2
}

asdf_plugin_add deno
asdf_plugin_add direnv
asdf_plugin_add nodejs
asdf_plugin_add python
asdf_plugin_add rust
asdf_plugin_add skaffold
asdf_plugin_add yq

asdf_plugin_add gcloud https://github.com/jasonmorganson/asdf-gcloud.git

