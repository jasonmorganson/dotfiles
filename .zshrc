autoload -Uz compinit && compinit

# Make sure that antibody is installed
(( $+commands[antibody] )) || curl -sL git.io/antibody | sh -s

# Initialize antibody
source <(antibody init)

# Bundle plugins
antibody bundle < ~/.zsh-plugins

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

. /home/linuxbrew/.linuxbrew/opt/asdf/asdf.sh

. /home/linuxbrew/.linuxbrew/opt/asdf/etc/bash_completion.d/asdf.bash

