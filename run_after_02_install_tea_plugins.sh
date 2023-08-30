#!/bin/sh
set -eu

# Install tea plugins
TEA_DIR="$HOME" tea --env --sync --silent
