#!/bin/sh

. ./.env

TMUX_PLUGIN_MANAGER_PATH=$HOME/.tmux/plugins/

# Install tpm
git clone https://github.com/tmux-plugins/tpm $TMUX_PLUGIN_MANAGER_PATH/tpm
