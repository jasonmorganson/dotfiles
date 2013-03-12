export LANG=en_US.utf8

export TERM=xterm-256color

export PAGER="/usr/bin/w3m"
export EDITOR="/usr/bin/vi"
export VISUAL="/usr/bin/vi"
export IRC_CLIENT="/usr/bin/irssi"

export VMAIL_BROWSER='w3m'
export VMAIL_HTML_PART_READER='w3m'

alias fresh='~/.fresh/source/freshshell/fresh/bin/fresh'
alias dotfiles='git --git-dir=$HOME/.fresh/source/jmorganson/dotfiles/.git/ --work-tree=$HOME/.fresh/build'
alias vundle-update='vim +BundleInstall! +BundleClean +qall'
alias update='fresh update; antigen update; vundle-update'
alias dropbox='python ~/.dropbox-dist/dropbox.py'

# PATH search order
# Current directory:
#   ./bin
#   ./.bin
# User directory:
#   ~/bin
#   ~/.bin
# /usr/local/bin
# /usr/local/sbin
# /opt/bin
# /usr/bin
# /bin
# $GCC_PATH
CURRENT_DIR_PATH=./bin:./.bin
USER_DIR_PATH=~/bin:~/.bin:~/.local/bin
USR_LOCAL_PATH=/usr/local/bin:/usr/local/sbin
OPT_PATH=/opt/bin
BIN_PATH=/usr/bin:/bin
GCC_PATH=/usr/x86_64-pc-linux-gnu/gcc-bin/4.5.4
export PATH="$CURRENT_DIR_PATH":"$USER_DIR_PATH":"$USR_LOCAL_PATH":"$OPT_PATH":"$BIN_PATH":"$GCC_PATH"

source ~/.antigen/antigen.zsh

source ~/.fresh/build/shell.sh

# Load the oh-my-zsh's library.
antigen-lib

antigen-bundles <<EOBUNDLES

#
# # Bundles from the default repo (robbyrussell's oh-my-zsh).
command-not-found
coffee
extract
git
github
git-extras
git-flow
git-remote-branch
heroku
node
npm
urltools
ssh-agent
taskwarrior
vi-mode

#
# # Syntax highlighting bundle.
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-completions
zsh-users/zaw

EOBUNDLES

if [[ "$POWERLINE" = "yes" ]]; then
    . ~/.local/powerline/powerline/bindings/zsh/powerline.zsh
else
# # Load the theme.
antigen-theme arrow
fi

#
# # Tell antigen that you're done.
antigen-apply

source ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zaw.git/zaw.zsh

