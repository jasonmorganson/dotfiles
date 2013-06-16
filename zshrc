export LANG=en_US.utf8

export TERM=xterm-256color

export PAGER="/usr/bin/w3m"
export EDITOR="/usr/bin/vi"
export VISUAL="/usr/bin/vi"
export IRC_CLIENT="/usr/bin/irssi"

export VMAIL_BROWSER='w3m'
export VMAIL_HTML_PART_READER='w3m -dump'

alias fresh='~/.fresh/source/freshshell/fresh/bin/fresh'
alias dotfiles='git --git-dir=$HOME/.fresh/source/jasonmorganson/dotfiles/.git/ --work-tree=$HOME/.fresh/build'
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
# Ruby GEMs in user directory:
#   ~/.gem/ruby/current/bin
# /usr/local/bin
# /usr/local/sbin
# /opt/bin
# /usr/bin
# /bin
# $GCC_PATH
CURRENT_DIR_PATH=./bin:./.bin
USER_DIR_PATH=~/bin:~/.bin:~/.local/bin
USER_GEM_PATH=~/.gem/ruby/current/bin
USR_LOCAL_PATH=/usr/local/bin:/usr/local/sbin
OPT_PATH=/opt/bin
BIN_PATH=/usr/bin:/bin
GCC_PATH=/usr/x86_64-pc-linux-gnu/gcc-bin/4.5.4
export PATH="$CURRENT_DIR_PATH":"$USER_DIR_PATH":"$USER_GEM_PATH":"$USR_LOCAL_PATH":"$OPT_PATH":"$BIN_PATH":"$GCC_PATH"

# VI-mode
bindkey -v

# The time the shell waits, in hundredths of seconds, for another key
# to be pressed when reading bound multi-character sequences.
#
# Set to shortest possible delay is 1/100 second.
# This allows escape sequences like cursor/arrow keys to work,
# while eliminating the delay exiting vi insert mode.
KEYTIMEOUT=1  # 10ms for key sequences

source ~/.antigen/antigen.zsh

source ~/.fresh/build/shell.sh

# Load the oh-my-zsh's library.
antigen-use oh-my-zsh

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

[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh  # This loads NVM
