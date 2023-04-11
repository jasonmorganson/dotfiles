#!/bin/sh
. ./.profile
set -eu

# Link teas
sudo ln -sf ~/.tea/nushell.sh/v0.77/bin/nu /usr/local/bin/nu
sudo ln -sf ~/.tea/zlib.net/v1.2.13/lib/libz.1.2.13.dylib /usr/local/lib/libz.1.2.13.dylib

# Link rtxs
sudo ln -sf ~/.local/share/rtx/installs/zellij/0.35.2/bin/zellij /usr/local/bin/zellij
