#!/bin/sh

repo=$(cd "$(dirname "$0")" && pwd) || exit

curl https://mise.run | sudo env MISE_INSTALL_PATH=/usr/local/bin/mise sh &&
	MISE_GLOBAL_CONFIG_FILE="$repo/home/.config/mise/config.toml" \
		MISE_DOTFILES_ROOT="$repo/home" \
		MISE_IGNORED_CONFIG_PATHS="${MISE_IGNORED_CONFIG_PATHS:+${MISE_IGNORED_CONFIG_PATHS}:}$HOME/.local/share/dotfiles/home/.config/mise/config.toml" \
		/usr/local/bin/mise bootstrap --yes --force-dotfiles
