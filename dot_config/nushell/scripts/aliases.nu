export alias l = ls
export alias ls = ls
export alias la = ls -a
export alias ll = ls -l
export alias lla = ls -la

export alias ag = rg

export alias g = git
export alias gg = git

export alias tig = gitui

export alias unpushed = git log --branches --not --remotes --no-walk --decorate --oneline
export def unclean [] { gfold -d json ~/Code | from json | where status != Clean }

export alias vi = hx
export alias vim = vi
export alias nvim = vi

export alias py = python
export alias pip = python -m pip

export alias k = kubectl
export alias kns = kubens
export alias kctx = kubectx

alias ze = zellij
alias zea = zellij attach
alias zead = zellij attach --create default
alias zekas = zellij kill-all-sessions
alias zeks = zellij kill-session
alias zels = zellij list-sessions

export alias dotfiles = chezmoi
