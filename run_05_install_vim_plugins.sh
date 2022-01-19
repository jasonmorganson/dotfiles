#!/bin/sh
set -eu
. ./.profile

# Install vim plugins
nvim --headless +PlugInstall +qall
