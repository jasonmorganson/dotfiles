alias l = ls
alias ls = exa
alias la = ls -a
alias ll = ls -l
alias ll = exa --long --header --git

alias g = git
alias c = git-smart-commit
alias co = fzf-git::checkout_branch
alias a = git-smart-add -p
alias p = git-smart-push seletskiy
alias u = git-smart-pull
alias r = git-smart-remote

alias gl = git log

alias diff = git diff
alias wip = git commit -am "WIP"
alias unpushed = git log --branches --not --remotes --no-walk --decorate --oneline

alias vi = nvim
alias vim = nvim

alias py = python
alias python = python3
alias pip = pip3

alias k = kubectl
alias kfwd = kubefwd
alias kubens = kubie ns
alias kubectx = kubie ctx

alias dotfiles = chezmoi

