#!/bin/sh

# Install helm plugins
helm plugin install https://github.com/nouney/helm-gcs
helm plugin install https://github.com/aslafy-z/helm-git
helm plugin install https://github.com/databus23/helm-diff
helm plugin install https://github.com/futuresimple/helm-secrets
helm repo add stable https://kubernetes-charts.storage.googleapis.com