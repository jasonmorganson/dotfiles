#!/bin/sh
. ./.profile
set -eu

TMP="$(mktemp -d -t helix-runtime-XXXXXXXXXX)"
HELIX_RUNTIME="$HOME/.config/helix/runtime"

mkdir -p "$HELIX_RUNTIME"
git clone https://github.com/helix-editor/helix "$TMP"
cd "$TMP"
cp -r runtime/* "$HELIX_RUNTIME"

hx --grammar fetch
hx --grammar build
