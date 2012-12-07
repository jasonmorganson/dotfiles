# .dotfiles

Documentation on the specifics of my $HOME "dot files" setup
===============================================================

I grew tired of starting from scratch every time when setting up.

*Getting started*

1. Create `dotfiles` alias for git

        alias dotfiles='git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

    See http://silas.sewell.org/blog/2009/03/08/profile-management-with-git-and-github/

2. Have `.bash_profile` source `.bashrc`

        if [ -f ~/.bashrc ]; then
           source ~/.bashrc
        fi

    See http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html


