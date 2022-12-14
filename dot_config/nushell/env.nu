
# Language
#export LANG=en_US.UTF-8
#export LANGUAGE=en_US

# XDG
#export XDG_CACHE_HOME="$HOME/.cache"
#export XDG_CONFIG_HOME="$HOME/.config"
#export XDG_DATA_HOME="$HOME/.local/share"
#export XDG_DESKTOP_DIR="$HOME/Desktop"
#export XDG_DOCUMENTS_DIR="$HOME/Documents"
#export XDG_DOWNLOAD_DIR="$HOME/Downloads"
#export XDG_MUSIC_DIR="$HOME/Music"
#export XDG_PICTURES_DIR="$HOME/Pictures"
#export XDG_PUBLICSHARE_DIR="$HOME/Public"
#export XDG_TEMPLATES_DIR="$HOME/Templates"
#export XDG_VIDEOS_DIR="$HOME/Videos"

# Homebrew
let-env PATH = ($env.PATH | prepend '/opt/homebrew/bin')
#let-env PATH = ($env.PATH | prepend '/home/linuxbrew/.linuxbrew/bin')

# Configure brew bundle
let-env HOMEBREW_BUNDLE_FILE = $"($env.HOME)/.Brewfile"
let-env HOMEBREW_BUNDLE_NO_LOCK = true

# asdf
let-env ASDF_DIR = $"($env.HOMEBREW_PREFIX)/opt/asdf/libexec"
let-env ASDF_DATA_DIR = $env.ASDF_DIR

# Paths
let-env PATH = ($env.PATH | prepend $"($env.ASDF_DIR)/shims" | prepend $"($env.ASDF_DIR)/bin")
#export FPATH="$ASDF_DIR/completions:$HOMEBREW_PREFIX/share/zsh/site-functions:$FPATH"

let-env LS_COLORS = (vivid generate molokai | str trim)

let-env PROMPT_INDICATOR = { "" }
let-env PROMPT_INDICATOR_VI_INSERT = { "" }
let-env PROMPT_INDICATOR_VI_NORMAL = { "" }
let-env PROMPT_MULTILINE_INDICATOR = { "" }
