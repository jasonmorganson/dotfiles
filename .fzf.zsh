# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/jasonmorganson/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/jasonmorganson/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/jasonmorganson/.fzf/man* && -d "/Users/jasonmorganson/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/jasonmorganson/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/jasonmorganson/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/jasonmorganson/.fzf/shell/key-bindings.zsh"

