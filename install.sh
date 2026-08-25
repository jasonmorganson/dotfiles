#!/bin/sh
set -e

cd "$(dirname "$0")"
if [ ! -d home/.config/mise ]; then
    mkdir -p "$HOME/.local/share"
    git clone "https://github.com/${GITHUB_USER:-jasonmorganson}/dotfiles.git" "$HOME/.local/share/dotfiles"
    exec "$HOME/.local/share/dotfiles/install.sh"
fi

curl -fsSL https://mise.run | sh
MISE_CONFIG_DIR="$PWD/home/.config/mise" \
MISE_DOTFILES_ROOT="$PWD/home" \
MISE_IGNORED_CONFIG_PATHS="$HOME/.local/share/dotfiles/home/.config/mise/config.toml" \
"$HOME/.local/bin/mise" bootstrap --yes --force-dotfiles
