#!/bin/sh

. ./.profile

# Add stable repo
helm repo add stable https://charts.helm.sh/stable

# Install helm plugins
helm plugin install https://github.com/nouney/helm-gcs
helm plugin install https://github.com/aslafy-z/helm-git
helm plugin install https://github.com/databus23/helm-diff
helm plugin install https://github.com/jkroepke/helm-secrets
