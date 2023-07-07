#!/bin/sh
. ./.profile
set -eu

# Link teas
sudo ln -sf "$HOME/.tea/nushell.sh/v*/bin/nu" /usr/local/bin/nu
sudo ln -sf "$HOME/.tea/crates.io/zellij/v*/bin/zellij" /usr/local/bin/zellij

mkdir -p "$HOME/.tea/.local/bin"
ln -sf "$HOME/.tea/tea.xyz/v*/bin/tea" "$HOME/.tea/.local/bin/tea"
ln -sf "$HOME/.tea/nushell.sh/v*/bin/nu" "$HOME/.tea/.local/bin/nu"
ln -sf "$HOME/.tea/crates.io/zellij/v*/bin/zellij" "$HOME/.tea/.local/bin/zellij"
