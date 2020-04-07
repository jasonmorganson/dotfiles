#!/bin/sh

. ./.env

# Install vim plugins
nvim --headless +PlugInstall +qall
