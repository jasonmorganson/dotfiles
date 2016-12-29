#zmodload zsh/zprof

# Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
else
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Antibody
source <(antibody init)

# Antibody bundles
antibody bundle < ~/.zbundles

# Generic Colouriser
unalias gls
unalias grc
source ~/.grc/init.zsh
alias ls='grc --colour=auto gls --color'
eval $(gdircolors ~/.dircolors)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

nvm() {
  source ~/.nvm/nvm.sh
  nvm "$@"
}

eval "$(thefuck --alias)"

source ~/.fzf.zsh
source ~/.avn/bin/avn.sh
source ~/.rvm/scripts/rvm
source /usr/local/opt/autoenv/activate.sh

autoload bashcompinit
bashcompinit
_gh_completion() {
    COMPREPLY=( $( env COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   _GH_COMPLETE=complete $1 ) )
    return 0
}

complete -F _gh_completion -o default gh;

#zprof
