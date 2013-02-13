export LANG=en_US.utf8

export TERM=xterm-256color

export PAGER="/usr/bin/w3m"
export EDITOR="/usr/bin/vi"
export IRC_CLIENT="/usr/bin/irssi"

export VMAIL_BROWSER='w3m'
export VMAIL_HTML_PART_READER='w3m'

alias dotfiles='git --git-dir=$HOME/.fresh/source/jmorganson/dotfiles/.git/ --work-tree=$HOME'

# our own bin dir at the highest priority, followed by /usr/local/bin
export PATH=.bin:.node_modules:/usr/local/bin:/usr/local/sbin:/opt/bin:"$PATH"

source ~/.fresh/build/shell.sh
