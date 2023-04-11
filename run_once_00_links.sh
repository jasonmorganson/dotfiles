#!/bin/sh
. ./.profile
set -eu

# Link teas
sudo ln -sf "~/.tea/nushell.sh/v*/bin/nu" /usr/local/bin/nu

# Link rtxs
sudo ln -sf ~/.local/share/rtx/installs/zellij/latest/bin/zellij /usr/local/bin/zellij

# FIXME: Needed for delta as a workaround for cargo install
sudo ln -sf ~/.tea/zlib.net/v1.2.13/lib/libz.1.2.13.dylib /usr/local/lib/libz.1.2.13.dylib
