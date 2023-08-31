#!/bin/sh
set -eu

# Install tea plugins
TEA_DIR="$HOME" "$HOME/.tea/tea.xyz/v0/bin/tea" --env --sync --silent
