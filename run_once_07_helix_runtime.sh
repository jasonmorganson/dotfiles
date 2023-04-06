#!/bin/sh
. ./.profile
set -eu

HELIX_RUNTIME="$HOME/.config/helix/runtime"

mkdir -p "$HELIX_RUNTIME/themes"

curl -L -o "$HELIX_RUNTIME/themes/github_dark.toml" https://raw.githubusercontent.com/helix-editor/helix/master/runtime/themes/github_dark.toml

hx --grammar fetch
hx --grammar build
