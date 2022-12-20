#!/bin/sh
. ./.profile
set -eu

asdf_plugin_add() {
    # Exit code 2 indicates the plugin is already installed so test and exit
    # sucessfully if that is the error code.
    asdf plugin add "$1" "${2:-}" || test $? = 2
}

asdf_plugin_add ag
asdf_plugin_add chezmoi
asdf_plugin_add deno
asdf_plugin_add direnv
asdf_plugin_add exa
asdf_plugin_add fzf
asdf_plugin_add gcloud
asdf_plugin_add git
asdf_plugin_add golang
asdf_plugin_add hasura-cli
asdf_plugin_add helm
asdf_plugin_add helmfile
asdf_plugin_add hub
asdf_plugin_add k9s
asdf_plugin_add krew
asdf_plugin_add kubectl
asdf_plugin_add kubectx
asdf_plugin_add kubie
asdf_plugin_add kustomize
asdf_plugin_add neovim
asdf_plugin_add nodejs
asdf_plugin_add poetry
asdf_plugin_add postgres
asdf_plugin_add python
asdf_plugin_add rust
asdf_plugin_add shellcheck
asdf_plugin_add shfmt
asdf_plugin_add skaffold
asdf_plugin_add sops
asdf_plugin_add tmux
asdf_plugin_add vim
asdf_plugin_add yq

asdf_plugin_add gcloud https://github.com/jasonmorganson/asdf-gcloud.git

