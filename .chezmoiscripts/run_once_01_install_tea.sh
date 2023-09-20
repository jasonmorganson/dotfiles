#!/bin/sh
set -eu

# Install tea
curl https://github.com/teaxyz/setup/releases/download/v0.18.3/install.sh | TEA_YES=1 SHELL=bash sh
