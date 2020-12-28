#!/bin/sh

set -e # -e: exit on error

if ! command -v chezmoi > /dev/null
then
  curl -sfL https://git.io/chezmoi | sh
  PATH=./bin:$PATH
fi

if [ -d ~/.local/share/chezmoi/.git ]
then
  chezmoi update --apply
else
  chezmoi init --apply https://github.com/jasonmorganson/dotfiles.git
fi
