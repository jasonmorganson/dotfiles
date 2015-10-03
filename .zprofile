
#
# Editors
#

export EDITOR="/usr/local/bin/nvim"
export VISUAL="/usr/local/bin/nvim"
export MANPAGER="/bin/sh -c \"col -b | nvim -c 'set ft=man ts=8 nomod nolist nonu noma nonumber norelativenumber laststatus=0 colorcolumn=0' -\""

export NVIM_TUI_ENABLE_TRUE_COLOR=true

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  ./bin
  ./.bin
  ~/bin
  ~/.bin
  ~/.local/bin
  ~/.nvm/current/bin
  ~/.gem/ruby/current/bin
  $(brew --prefix homebrew/php/php56)/bin
  $(brew --prefix coreutils)/libexec/gnubin
  /usr/local/bin
  /usr/local/sbin
  /usr/local/{bin,sbin}
  /opt/bin
  /usr/bin
  /sbin
  /bin
  /usr/x86_64-pc-linux-gnu/gcc-bin/4.5.4
  $path
)

