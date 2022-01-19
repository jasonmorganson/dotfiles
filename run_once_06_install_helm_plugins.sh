#!/bin/sh
. ./.profile
set -eu

helm_plugin_install() {
    # Exit code 1 indicates the plugin is already installed so test and exit
    # successfully if that is the error code.
    helm plugin install $1 || test $? = 1
}

# Add stable repo
helm repo add stable https://charts.helm.sh/stable

# Install helm plugins
helm_plugin_install https://github.com/nouney/helm-gcs
helm_plugin_install https://github.com/aslafy-z/helm-git
helm_plugin_install https://github.com/databus23/helm-diff
helm_plugin_install https://github.com/jkroepke/helm-secrets
