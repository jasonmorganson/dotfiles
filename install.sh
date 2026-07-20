#!/bin/sh

set -eu

CDPATH= cd -P "$(dirname "$0")"
export MISE_GLOBAL_CONFIG_FILE="$PWD/home/.config/mise/config.toml" MISE_GLOBAL_CONFIG_ROOT="$PWD"
curl -fsSL https://mise.run | sudo env MISE_INSTALL_PATH=/usr/local/bin/mise sh
exec /usr/local/bin/mise bootstrap --yes --force-dotfiles
