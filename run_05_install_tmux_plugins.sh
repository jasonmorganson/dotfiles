#!/bin/sh

. ./.env

TMUX_PLUGIN_MANAGER_PATH=$HOME/.tmux/plugins/

# Install tmux plugins
$TMUX_PLUGIN_MANAGER_PATH/tpm/bin/install_plugins
