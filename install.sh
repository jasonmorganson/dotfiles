#!/bin/sh

set -eu

case $0 in
    */*) self=$0 ;;
    *) self=$(command -v "$0") ;;
esac

repo_dir="$(CDPATH= cd -P "$(dirname "$self")" && pwd -P)"
export MISE_GLOBAL_CONFIG_FILE="$repo_dir/home/.config/mise/config.toml"
export MISE_GLOBAL_CONFIG_ROOT="$repo_dir"

exec "$repo_dir/home/.local/bin/mise" -C "$repo_dir" bootstrap --yes --force-dotfiles
