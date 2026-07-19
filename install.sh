#!/bin/sh

set -eu

case $0 in
    */*) self=$0 ;;
    *) self=$(command -v "$0") ;;
esac

repo_dir="$(CDPATH= cd -P "$(dirname "$self")" && pwd -P)"
canonical_dir="$HOME/.local/share/dotfiles"

mkdir -p "$HOME/.local/share"

if [ -e "$canonical_dir" ] && [ ! -L "$canonical_dir" ]; then
    [ "$(CDPATH= cd -P "$canonical_dir" && pwd -P)" = "$repo_dir" ] || {
        echo "$canonical_dir exists and is not this repository" >&2
        exit 1
    }
else
    ln -sfn "$repo_dir" "$canonical_dir"
fi

exec "$repo_dir/mise" -C "$repo_dir" bootstrap --yes --force-dotfiles
