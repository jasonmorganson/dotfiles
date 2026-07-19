#!/bin/sh

set -eu

CDPATH= cd -P "$(dirname "$0")"
export MISE_GLOBAL_CONFIG_FILE="$PWD/home/.config/mise/config.toml" MISE_GLOBAL_CONFIG_ROOT="$PWD"
exec ./home/.local/bin/mise bootstrap --yes --force-dotfiles
