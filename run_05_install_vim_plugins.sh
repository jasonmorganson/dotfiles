#!/bin/sh
. ./.profile
set -eu

# Install vim plugins
nvim --headless +PlugInstall +qall
