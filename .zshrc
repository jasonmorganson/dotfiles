# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Aliases
#alias vi='nvim'
#alias vim='nvim'
alias dotfiles='git --git-dir=$HOME/dotfiles/.git --work-tree=$HOME'

# VI PROMPT
PROMPT='%(?.%F{magenta}.%F{red})${${KEYMAP/vicmd/❮%f}/(main|viins)/❯%f} '
function zle-line-init zle-keymap-select {
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Load nvm
export NVM_DIR="/Users/jasonmorganson/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
