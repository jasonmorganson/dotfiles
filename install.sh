#!/bin/sh

curl https://mise.run | sudo env MISE_INSTALL_PATH=/usr/local/bin/mise sh &&
	MISE_GLOBAL_CONFIG_FILE="$(dirname "$0")/home/.config/mise/config.toml" \
		MISE_IGNORED_CONFIG_PATHS="${MISE_IGNORED_CONFIG_PATHS:+${MISE_IGNORED_CONFIG_PATHS}:}$HOME/.local/share/dotfiles/home/.config/mise/config.toml" \
		/usr/local/bin/mise bootstrap --yes --force-dotfiles
