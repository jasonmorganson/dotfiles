#!/bin/sh
. ./.profile
set -eu

# Install tea plugins
TEA_DIR="$HOME" tea --sync --silent
