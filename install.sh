#!/bin/sh
set -e

cd "$(dirname "$0")"
curl https://mise.run | sudo env MISE_INSTALL_PATH=/usr/local/bin/mise sh
MISE_GLOBAL_CONFIG_FILE="$PWD/home/.config/mise/config.toml" \
MISE_DOTFILES_ROOT="$PWD/home" \
MISE_IGNORED_CONFIG_PATHS="${MISE_IGNORED_CONFIG_PATHS:+$MISE_IGNORED_CONFIG_PATHS:}$HOME/.local/share/dotfiles/home/.config/mise/config.toml" \
/usr/local/bin/mise bootstrap --yes --force-dotfiles
