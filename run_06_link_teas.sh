#!/bin/sh
. ./.profile
set -eu

# Link teas
sudo ln -sf ~/.tea/nushell.sh/v0.77/bin/nu /usr/local/bin/nu
