#!/usr/bin/env bash

# Keep a single file for both .bash_profile and .bashrc
# See http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi


export TODO="t"
export TODO_DIR="."

### Bash It ###

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
#export BASH_IT_THEME='bobby'

# Load Bash It
source $BASH_IT/bash_it.sh
