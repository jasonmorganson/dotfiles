export LANG=en_US.utf8

export TERM=xterm-256color

export PAGER="/usr/bin/w3m"
export EDITOR="/usr/bin/vi"
export VISUAL="/usr/bin/vi"
export IRC_CLIENT="/usr/bin/irssi"

export VMAIL_BROWSER='w3m'
export VMAIL_HTML_PART_READER='w3m'

alias fresh='~/.fresh/source/freshshell/fresh/bin/fresh'
alias dotfiles='git --git-dir=$HOME/.fresh/source/jmorganson/dotfiles/.git/ --work-tree=$HOME'

# our own bin dir at the highest priority, followed by /usr/local/bin
export PATH=.bin:.node_modules:/usr/local/bin:/usr/local/sbin:/opt/bin:"$PATH"

source ~/.antigen/antigen.zsh

source ~/.fresh/build/shell.sh

# Load the oh-my-zsh's library.
antigen-lib
#
# # Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen-bundle command-not-found
antigen-bundle coffee
antigen-bundle extract
antigen-bundle git
antigen-bundle github
antigen-bundle git-extras
antigen-bundle git-flow
antigen-bundle git-remote-branch
antigen-bundle heroku
antigen-bundle node
antigen-bundle npm
antigen-bundle urltools
antigen-bundle ssh-agent
antigen-bundle taskwarrior
antigen-bundle vi-mode

#
# # Syntax highlighting bundle.
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-completions
antigen-bundle zsh-users/zaw

# # Load the theme.
antigen-theme arrow
#
# # Tell antigen that you're done.
antigen-apply

source ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zaw.git/zaw.zsh
