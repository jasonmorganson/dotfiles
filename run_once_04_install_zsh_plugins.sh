#!/bin/sh

. ./.env

# Use antibody static loading
antibody bundle < ~/.zsh-plugins > ~/.zsh-plugins.sh

