autoload -Uz compinit && compinit

# Make sure that antibody is installed
(( $+commands[antibody] )) || curl -sL git.io/antibody | sh -s

# Initialize antibody
source <(antibody init)

# Bundle plugins
antibody bundle < ~/.zsh-plugins
