#!/bin/sh
. ./.profile
set -eu

# Link tea bins to usr local so Alacritty can use the known path
sudo ln -sf "$HOME/.tea/nushell.sh/v*/bin/nu" /usr/local/bin/nu
sudo ln -sf "$HOME/.tea/crates.io/zellij/v*/bin/zellij" /usr/local/bin/zellij

