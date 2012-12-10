#!/usr/bin/env bash

# Keep a single file for both .bash_profile and .bashrc
# See http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

export EDITOR="/usr/bin/vi"

export TODO="t"
export TODO_DIR="."

### Bash It ###

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
#export BASH_IT_THEME='clean'

# Load Bash It
source $BASH_IT/bash_it.sh


# Create a flexible, responsive prompt.
# Based on the Responsive Prompt
# http://jondavidjohn.com/blog/2012/12/how-to-accomplish-a-responsive-bash-prompt


working_directory() {
    dir=`pwd`
    in_home=0
    if [[ `pwd` =~ ^$HOME($|\/) ]]; then
        dir="~${dir#$HOME}"
        in_home=1
    fi

    if [[ `tput cols` -lt 110 ]]; then  # <-- Checking the term width
        first="/`echo $dir | cut -d / -f 2`"
        letter=${first:0:2}
        if [[ $in_home == 1 ]]; then
            letter="~$letter"
        fi
        proj=`echo $dir | cut -d / -f 3`
        beginning="$letter/$proj"
        end=`echo "$dir" | rev | cut -d / -f1 | rev`

        if [[ $proj == "" ]]; then
            echo $dir
        elif [[ $proj == "~" ]]; then
            echo $dir
        elif [[ $dir =~ "$first/$proj"$ ]]; then
            echo $beginning
        elif [[ $dir =~ "$first/$proj/$end"$ ]]; then
            echo "$beginning/$end"
        else
            echo "$beginning/…/$end"
        fi
    else
        echo $dir
    fi
}

parse_git_branch() {
    if [[ -f /usr/local/etc/bash_completion.d/git-completion.bash ]]; then
        branch=`__git_ps1 "%s"`
    else
        ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
        branch="${ref#refs/heads/}"
    fi

    if [[ `tput cols` -lt 110 ]]; then  # <---- Again checking the term width
        branch=`echo $branch | sed s/feature/f/1`
        branch=`echo $branch | sed s/hotfix/h/1`
        branch=`echo $branch | sed s/release/\r/1`
        branch=`echo $branch | sed s/master/mstr/1`
        branch=`echo $branch | sed s/develop/dev/1`
    fi

    if [[ $branch != "" ]]; then
        echo "$branch "
    fi
}

prompt() {
    if [[ $? -eq 0 ]]; then
        exit_status='\[\e[0;34m\]› \[\e[00m\]'
    else
        exit_status='\[\e[0;31m\]› \[\e[00m\]'
    fi

    prompt='\[\e[0;33m\]$(working_directory)\[\e[00m\]\[\e[0;32m\] $(parse_git_branch)\[\e[00m\]'
    PS1=$prompt$exit_status
}
PROMPT_COMMAND=prompt
