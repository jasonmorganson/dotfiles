setopt clobber

# Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
else
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Antibody
if [[ -s "${ZDOTDIR:-$HOME}/.antibody/antibody.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.antibody/antibody.zsh"
else
  wget -O antibody.tar.gz "http://antibody.elasticbeanstalk.com/latest/$(uname -s)/$(uname -m)"
  mkdir -p "${ZDOTDIR:-$HOME}/.antibody"
  tar xzvf antibody.tar.gz -C "${ZDOTDIR:-$HOME}/.antibody"
  source "${ZDOTDIR:-$HOME}/.antibody/antibody.zsh"
fi

# nvm
if [[ -s "${ZDOTDIR:-$HOME}/.nvm/nvm.sh" ]]; then
  source "${ZDOTDIR:-$HOME}/.nvm/nvm.sh"
else
  git clone https://github.com/creationix/nvm.git "${ZDOTDIR:-$HOME}/.nvm"
  source "${ZDOTDIR:-$HOME}/.nvm/nvm.sh"
fi

# Aliases
source "${ZDOTDIR:-$HOME}/.zaliases"

