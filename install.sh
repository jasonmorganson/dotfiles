#!/bin/sh

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

if [ -f ./bin/chezmoi ]
then
  rm ./bin/chezmoi
  rmdir ./bin
fi
