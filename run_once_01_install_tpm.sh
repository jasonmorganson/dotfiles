#!/bin/sh

. ./.profile

# Install tpm
[ -d $XDG_CONFIG_HOME/tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm $XDG_CONFIG_HOME/tmux/plugins/tpm
