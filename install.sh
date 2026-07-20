#!/bin/sh

cd "$(dirname "$0")" &&
    curl https://mise.run | sudo env MISE_INSTALL_PATH=/usr/local/bin/mise sh &&
    MISE_GLOBAL_CONFIG_FILE="$PWD/home/.config/mise/config.toml" \
        MISE_GLOBAL_CONFIG_ROOT="$PWD" \
        /usr/local/bin/mise bootstrap --yes --force-dotfiles
