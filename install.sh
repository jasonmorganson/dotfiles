#!/bin/sh
set -e

curl https://mise.run | sh
export PATH="$HOME/.local/bin:$PATH"
mise bootstrap \
    --adopt "https://github.com/${GITHUB_USER:-jasonmorganson}/dotfiles.git" \
    --update \
    --yes \
    --force-dotfiles
