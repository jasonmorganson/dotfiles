alias dotfiles='git --git-dir=$HOME/.fresh/source/jmorganson/dotfiles/.git/ --work-tree=$HOME'

# our own bin dir at the highest priority, followed by /usr/local/bin
export PATH=~/.bin:/usr/local/bin:/usr/local/sbin:"$PATH"

source ~/.fresh/build/shell.sh
