#!/bin/sh

export NAME="Jason Morganson"
export EMAIL="jason@cherre.com"

if ! command -v chezmoi > /dev/null
then
  curl -sfL https://git.io/chezmoi | sh
  PATH=./bin:$PATH
fi

if [ -d ~/.local/share/chezmoi/.git ]
then
  chezmoi update --apply
else
  chezmoi init --apply https://github.com/jasonmorganson/dotfiles.git || chezmoi purge --force
fi

if [ -f ./bin/chezmoi ]
then
  rm ./bin/chezmoi
  rmdir ./bin
fi
