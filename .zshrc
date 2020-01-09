# zmodload zsh/zprof

# Start a timer
timer=$(($(date +%s%N)/1000000))

#
# https://gist.github.com/ctechols/ca1035271ad134841284
#
# On slow systems, checking the cached .zcompdump file to see if it must be
# regenerated adds a noticable delay to zsh startup.  This little hack restricts
# it to once a day.  It should be pasted into your own completion file.
#
# The globbing is a little complicated here:
# - '#q' is an explicit glob qualifier that makes globbing work within zsh's [[ ]] construct.
# - 'N' makes the glob pattern evaluate to nothing when it doesn't match (rather than throw a globbing error)
# - '.' matches "regular files"
# - 'mh+24' matches files (or directories or whatever) that are older than 24 hours.
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit;
else
  compinit -C;
fi;

zmodload -i zsh/complist

# Make sure that antibody is installed
(( $+commands[antibody] )) || curl -sL git.io/antibody | sh -s

# Automatic antibody static loading
if [[ ! -e "~/.zsh-plugins" ]] || [[ "~/.zsh-plugins" -nt "~/.zsh-plugins.sh" ]]; then
  antibody bundle < ~/.zsh-plugins > ~/.zsh-plugins.sh
fi

source ~/.zsh-plugins.sh

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category

source <(stern --completion=zsh)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(hub alias -s)"

# Overrides an alias from oh-my-zsh git plugin so has to be set after that loads
alias co='fzf-git::checkout_branch'

eval $(brew shellenv)

# Show loading time
now=$(($(date +%s%N)/1000000))
elapsed=$(($now-$timer))
echo "Loaded ZSH in $elapsed seconds"

# zprof
