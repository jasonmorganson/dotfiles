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

