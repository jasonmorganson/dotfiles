alias l = `ls`
alias ls = exa
alias la = ls -a
alias ll = exa --long --header --git

alias g = git
alias c = git commit -m
alias co = git checkout
alias a = git add -p
alias s = git status
alias p = git push
alias u = git pull

alias gb = git branch
alias gl = git log

alias cob = git checkout -b
alias gbd = git branch -d
alias gbD = git branch -D

alias tig = gitui

alias diff = git diff
alias reset = git reset
alias wip = git commit -am "WIP"
alias unpushed = git log --branches --not --remotes --no-walk --decorate --oneline

alias vi = hx
alias vim = vi
alias nvim = vi

alias py = python

alias k = kubectl
alias kfwd = kubefwd
alias kubens = kubie ns
alias kubectx = kubie ctx

alias dotfiles = chezmoi
