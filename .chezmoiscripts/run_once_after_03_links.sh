#!/bin/sh
set -eu

# Link pkgx bins to usr local so Alacritty can use the known path
sudo ln -sf "$HOME/.pkgx/nushell.sh/v0/bin/nu" /usr/local/bin/nu
sudo ln -sf "$HOME/.pkgx/crates.io/zellij/v0/bin/zellij" /usr/local/bin/zellij
