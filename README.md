# .dotfiles

Documentation on the specifics of my $HOME "dot files" setup
===============================================================

I grew tired of starting from scratch every time when setting up.

## Setup ##

> `git clone https://github.com/jasonmorganson/dotfiles.git ~/.dotfiles`
> `cp ~/.dotfiles/.* .

## Usage ##

The alias is `dotfiles`. Use this just like `git`.

> `dotfiles status`
> `dotfiles diff`
> `dotfiles add -p`
> `dotfiles commit -m`
> `dotfiles push`

## How it works ##

Adds `dotfiles` alias for the dotfiles repo, but uses the home directory as the
working tree in git so that the files can be managed in place.

> `alias dotfiles='git --git-dir=$HOME/dotfiles/.git --work-tree=$HOME'`

See http://silas.sewell.org/blog/2009/03/08/profile-management-with-git-and-github/

