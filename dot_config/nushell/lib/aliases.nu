export alias l = lsd
export alias ls = lsd
export alias la = lsd -a
export alias ll = lsd -l
export alias lla = lsd -la
export alias lt = lsd --tree

export alias ag = rg

export alias g = git
export alias a = git add -p
export alias b = git branch
export alias c = git commit -m
export alias s = git status
export alias m = git merge
export alias p = git push
export alias u = git pull
export alias r = git reset

export alias cl = git clone
export alias co = git checkout
export alias pf = git push --force-with-lease
export alias gb = git branch
export alias gf = git fetch
export alias gl = git log

export alias cob = git checkout -b
export alias gcp = git cherry-pick
export alias gbd = git branch -d
export alias gbD = git branch -D

export alias tig = gitui

export alias diff = git diff
export alias reset = git reset
export alias revert = git revert
export alias rebase = git rebase
export alias stash = git stash
export alias wip = git commit -am "WIP"
export alias fixup = git commit --fixup
export alias unpushed = git log --branches --not --remotes --no-walk --decorate --oneline

export alias vi = hx
export alias vim = vi
export alias nvim = vi

export alias py = python
export alias pip = python -m pip

export alias k = kubectl
export alias kns = kubens
export alias kctx = kubectx

export alias dotfiles = chezmoi
