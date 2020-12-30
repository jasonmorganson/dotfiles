#!/bin/sh

. ./.profile

# Install vim plugins
nvim --headless +PlugInstall +qall
