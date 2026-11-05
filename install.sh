#!/bin/sh
set -e

curl https://mise.run | sh
export PATH="$HOME/.local/bin:$PATH"
mise bootstrap \
    --adopt "${MISE_BOOTSTRAP_REPO:-${GITHUB_USER:-jasonmorganson}/dotfiles}" \
    --update \
    --yes \
    --force-dotfiles
