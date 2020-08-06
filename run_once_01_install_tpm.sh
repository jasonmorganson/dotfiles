#!/bin/sh

. ./.env

TMUX_PLUGIN_MANAGER_PATH=$HOME/.tmux/plugins/

if [ ! -d $TMUX_PLUGIN_MANAGER_PATH/tpm ]
then
    # Install tpm
    git clone https://github.com/tmux-plugins/tpm $TMUX_PLUGIN_MANAGER_PATH/tpm
fi
