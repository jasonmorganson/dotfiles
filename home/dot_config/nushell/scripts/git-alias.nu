export alias ga = git add
export alias gb = git branch
export alias gc = git commit
export alias gd = git diff
export alias gf = git fetch
export alias gg = git grep
export alias gl = git log
export alias gm = git merge
export alias go = git checkout
export alias gp = git pull
export alias gs = git status
export alias gw = git whatchanged
export alias gaa = git add --all
export alias gap = git add --patch
export alias gau = git add --update
export alias gbm = git branch --merged
export alias gbnm = git branch --no-merged
export alias gbed = git branch --edit-description
export alias gbv = git branch --verbose
export alias gbvv = git branch --verbose --verbose
export alias gca = git commit --amend
export alias gcam = git commit --amend --message
export alias gcane = git commit --amend --no-edit
export alias gcaa = git commit --amend --all
export alias gcaam = git commit --amend --all --message
export alias gcaane = git commit --amend --all --no-edit
export alias gci = git commit --interactive
export alias gcm = git commit --message
export alias gco = git checkout
export alias gcong = git checkout --no-guess
export alias gcob = git checkout -b
export alias gcp = git cherry-pick
export alias gcpa = git cherry-pick --abort
export alias gcpc = git cherry-pick --continue
export alias gcpn = git cherry-pick --no-commit
export alias gcpnx = git cherry-pick --no-commit -x
export alias gdc = git diff --cached
export alias gds = git diff --staged
export alias gdw = git diff --word-diff
export alias gdd = git diff-deep
export alias gfa = git fetch --all
export alias gfav = git fetch --all --verbose
export alias ggn = git grep --line-number
export alias ggg = git grep-group
export alias glg = git log --graph
export alias glo = git log --oneline
export alias glor = git log --oneline --reverse
export alias glp = git log --patch
export alias glfp = git log --first-parent
export alias glto = git log --topo-order
export alias gll = git log-list
export alias glll = git log-list-long
export alias gls = git ls-files
export alias glsd = git ls-files --debug
export alias glsfn = git ls-files --full-name
export alias glsio = git ls-files --ignored --others --exclude-standard
export alias gma = git merge --abort
export alias gmc = git merge --continue
export alias gmncnf = git merge --no-commit --no-ff
export alias gpf = git pull --ff-only
export alias gpr = git pull --rebase
export alias gprp = git pull --rebase=preserve
export alias grb = git rebase
export alias grba = git rebase --abort
export alias grbc = git rebase --continue
export alias grbs = git rebase --skip
export alias grbi = git rebase --interactive
export alias grbiu = git rebase --interactive @{upstream}
export alias grl = git reflog
export alias grr = git remote
export alias grrs = git remote show
export alias grru = git remote update
export alias grrp = git remote prune
export alias grv = git revert
export alias grvnc = git revert --no-commit
export alias gsb = git show-branch
export alias gsm = git submodule
export alias gsmi = git submodule init
export alias gsma = git submodule add
export alias gsms = git submodule sync
export alias gsmu = git submodule update
export alias gsmui = git submodule update --init
export alias gsmuir = git submodule update --init --recursive
export alias gss = git status --short
export alias gssb = git status --short --branch
export alias glast-tag = git describe --tags --abbrev=0
export alias gdiff-changes = git diff --name-status -r
export alias gdiff-stat = git diff --stat --ignore-space-change -r
export alias gdiff-staged = git diff --cached
export alias gdiff-deep = git diff --check --dirstat --find-copies --find-renames --histogram --color
export alias ggrep-group = git grep --break --heading --line-number --color
export alias ggrep-ack = git     -c color.grep.linenumber="bold yellow"     -c color.grep.filename="bold green"     -c color.grep.match="reverse yellow"     grep --break --heading --line-number
export alias gorphans = git fsck --full
export alias glog-graph = git log --graph --all --oneline --decorate
export alias glog-1-hour = git log --since=1-hour-ago
export alias glog-1-day = git log --since=1-day-ago
export alias glog-1-week = git log --since=1-week-ago
export alias glog-1-month = git log --since=1-month-ago
export alias glog-1-year = git log --since=1-year-ago
export alias glog-refs = git log --all --graph --decorate --oneline --simplify-by-decoration --no-merges
export alias gctive = git files, with churn count
export alias gwho = git shortlog --summary --numbered --no-merges
export alias giniter = git init-empty
export alias gcloner = git clone --recursive
export alias gclone-lean = git clone --depth 1 --filter=combine:blob:none+tree:0 --no-checkout
export alias greset-commit = git reset --soft HEAD~1
export alias greset-commit-hard = git reset --hard HEAD~1
export alias gundo-commit = git reset --soft HEAD~1
export alias gundo-commit-hard = git reset --hard HEAD~1
export alias guncommit = git reset --soft HEAD~1
export alias gunadd = git reset HEAD
export alias gdiscard = git checkout --
export alias gcleaner = git clean -dff
export alias gcleanest = git clean -dffx
export alias gassume = git update-index --assume-unchanged
export alias gunassume = git update-index --no-assume-unchanged
export alias gbranches = git branch -a
export alias gtags = git tag -n1 --list
export alias gstashes = git stash list
export alias gtop = git rev-parse --show-toplevel
export alias gdefault-branch = git config init.defaultBranch
export alias gcurrent-branch = git rev-parse --abbrev-ref HEAD
export alias gupb = git rev-parse --abbrev-ref @{upstream}
export alias grepacker = git repack -a -d -f --depth=300 --window=300 --window-memory=1g
export alias gserve = git -c daemon.receivepack=true daemon --base-path=. --export-all --reuseaddr --verbose
export alias gcvs-i = git cvsimport -k -a
export alias gcvs-e = git cvsexportcommit -u -p
export alias gsvn-b = git svn branch
export alias gsvn-m = git merge --squash
export alias gsvn-c = git svn dcommit