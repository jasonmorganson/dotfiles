autoload -Uz compinit compdef && compinit
zmodload -i zsh/complist

source ~/.zpath

# Make sure ls is colorized
alias ls='ls --color -C'


export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"

# Make sure that antibody is installed
(( $+commands[antibody] )) || curl -sL git.io/antibody | sh -s

# Initialize antibody
source <(antibody init)

# Bundle plugins
antibody bundle < ~/.zsh-plugins

unset zle_bracketed_paste

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
# zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

source <(stern --completion=zsh)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(hub alias -s)"

. $HOME/.asdf/asdf.sh

