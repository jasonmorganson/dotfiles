#!/bin/sh
set -eu

# Install tea plugins
TEA_DIR="$HOME" "/usr/local/bin/tea" --update --sync --silent
