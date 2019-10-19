# .dotfiles

## Setup ##

### One time setup ###

Find a cloud drive to use. Dropbox and Google Drive both work well.

Clone this repo into a cloud drive directory:
> `git clone https://github.com/jasonmorganson/dotfiles.git $DOTFILES_DIRECTORY`

### When starting fresh on a new computer ###

Install the cloud drive. Chromebooks have Google Drive integrated.

### Run setup script ###
> `curl -sL https://git.io/JelA1 | bash`

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

