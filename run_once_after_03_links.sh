#!/bin/sh
. ./.profile
set -eu

# Link tea bins to usr local so Alacritty can use the known path
sudo ln -sf "$HOME/.tea/nushell.sh/v*/bin/nu" /usr/local/bin/nu
sudo ln -sf "$HOME/.tea/crates.io/zellij/v*/bin/zellij" /usr/local/bin/zellij

# Link the tea bins to the local tea bin path as a workaround to tea not doing this
# automatically when running as root
mkdir -p "$HOME/.tea/.local/bin"
ln -sf "$HOME/.tea/tea.xyz/v*/bin/tea" "$HOME/.tea/.local/bin/tea"
ln -sf tea "$HOME/.tea/.local/bin/nu"
ln -sf tea "$HOME/.tea/.local/bin/zellij"
