#!/bin/sh
. ./.profile
set -eu

# Link teas
sudo ln -sf ~/.tea/tea.xyz/v0/bin/tea /usr/local/bin/tea
sudo ln -sf ~/.tea/nushell.sh/v0.77/bin/nu /usr/local/bin/nu

# Link rtxs
sudo ln -sf ~/.local/share/rtx/installs/zellij/0.35.2/bin/zellij /usr/local/bin/zellij
