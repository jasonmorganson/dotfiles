#!/bin/sh
. ./.profile
set -eu

# Link teas
sudo ln -sf "$HOME/.tea/nushell.sh/v*/bin/nu" /usr/local/bin/nu
sudo ln -sf "$HOME/.tea/crates.io/zellij/v*/bin/nu" /usr/local/bin/nu

