#!/bin/sh
. ./.profile
set -eu

# Install tmux plugins
$XDG_CONFIG_HOME/tmux/plugins/tpm/bin/install_plugins
