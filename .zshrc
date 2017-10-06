#zmodload zsh/zprof

# Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
else
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# ZPlug
if [[ -s "${ZDOTDIR:-$HOME}/.zplug/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zplug/init.zsh"
else
  git clone https://github.com/zplug/zplug "${ZDOTDIR:-$HOME}/.zplug"
  source "${ZDOTDIR:-$HOME}/.zplug/init.zsh"
fi

# NVM
if [[ ! -s "${ZDOTDIR:-$HOME}/.nvm/nvm.zh" ]]; then
  git clone https://github.com/creationix/nvm.git "${ZDOTDIR:-$HOME}/.nvm"
fi

nvm() {
  source "${ZDOTDIR:-$HOME}/.nvm/nvm.sh"
  nvm "$@"
}

#zprof
