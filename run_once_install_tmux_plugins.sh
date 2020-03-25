export TMUX_PLUGIN_MANAGER_PATH=~/.tmux/plugins/

# Install tpm
git clone https://github.com/tmux-plugins/tpm $TMUX_PLUGIN_MANAGER_PATH/tpm

# Install tmux plugins
$TMUX_PLUGIN_MANAGER_PATH/tpm/bin/install_plugins