#!/bin/sh
set -eu

repo=$HOME/.local/share/dotfiles
if [ "$(CDPATH= cd -- "$(dirname "$0")" && pwd)" != "$repo" ]; then
    printf '%s\n' "dotfiles must be checked out at $repo" >&2
    exit 1
fi

cd "$repo"

mkdir -p "$HOME/.local/bin"
mise_bin=$HOME/.local/bin/mise

if [ ! -x "$mise_bin" ]; then
    curl -fsSL https://mise.run |
        env MISE_INSTALL_PATH="$mise_bin" sh
fi

PATH="$HOME/.local/bin:$PATH"
export PATH

MISE_CONFIG_DIR="$PWD/bootstrap/mise" \
"$mise_bin" bootstrap --only repos --yes

"$HOME/.local/share/etc/install.sh"

ignored_configs=$PWD/home/.config/mise/config.toml
for config in "$PWD"/home/.config/mise/conf.d/*.toml; do
    ignored_configs=$ignored_configs:$config
done

eval "$(
    MISE_CONFIG_DIR="$HOME/.local/share/etc/home/.config/mise" \
    MISE_IGNORED_CONFIG_PATHS="$ignored_configs" \
    "$mise_bin" env -s bash
)"

MISE_CONFIG_DIR="$PWD/home/.config/mise" \
MISE_DOTFILES_ROOT="$PWD/home" \
MISE_IGNORED_CONFIG_PATHS="$HOME/.local/share/dotfiles/home/.config/mise/config.toml" \
"$mise_bin" bootstrap --yes --force-dotfiles --skip task

"$mise_bin" run bootstrap
