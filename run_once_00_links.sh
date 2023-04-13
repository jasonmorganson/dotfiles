#!/bin/sh
. ./.profile
set -eu

# Link teas
sudo ln -sf "$HOME/.tea/nushell.sh/v*/bin/nu" /usr/local/bin/nu

# Link rtxs
sudo ln -sf "$HOME/.local/share/rtx/installs/zellij/latest/bin/zellij" /usr/local/bin/zellij

