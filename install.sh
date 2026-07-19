#!/bin/sh

set -eu

case $0 in
    */*) self=$0 ;;
    *) self=$(command -v "$0") ;;
esac

repo_dir="$(CDPATH= cd -P "$(dirname "$self")" && pwd -P)"
exec "$repo_dir/mise" -C "$repo_dir" bootstrap --yes --force-dotfiles
