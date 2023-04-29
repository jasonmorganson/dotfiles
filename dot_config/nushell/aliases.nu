alias l = `ls`
alias ls = exa
alias la = ls -a
alias ll = exa --long --header --git

alias ag = rg

alias g = git
alias a = git add -p
alias b = git branch
alias c = git commit -m
alias s = git status
alias m = git merge
alias p = git push
alias u = git pull
alias r = git reset

alias cl = git clone
alias co = git checkout
alias pf = git push --force-with-lease
alias gb = git branch
alias gf = git fetch
alias gl = git log

alias cob = git checkout -b
alias gcp = git cherry-pick
alias gbd = git branch -d
alias gbD = git branch -D

alias tig = gitui

alias diff = git diff
alias reset = git reset
alias revert = git revert
alias rebase = git rebase
alias stash = git stash
alias wip = git commit -am "WIP"
alias fixup = git commit --fixup
alias unpushed = git log --branches --not --remotes --no-walk --decorate --oneline

alias vi = hx
alias vim = vi
alias nvim = vi

alias py = python
alias pip = python -m pip

alias k = kubectl
alias kfwd = kubefwd
alias kubens = kubie ns
alias kubectx = kubie ctx

alias dotfiles = chezmoi
