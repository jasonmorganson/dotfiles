let-env XDG_CACHE_HOME = $"($env.HOME)/.cache"
let-env XDG_CONFIG_HOME = $"($env.HOME)/.config"
let-env XDG_DATA_HOME = $"($env.HOME)/.local/share"

# Homebrew
let-env HOMEBREW_PREFIX = "/usr/local"
let-env HOMEBREW_BUNDLE_FILE = $"($env.HOME)/.Brewfile"
let-env HOMEBREW_BUNDLE_NO_LOCK = true

let-env PATH = ($env.PATH | split row (char esep) | prepend '/usr/local/bin' | prepend '/opt/homebrew/bin' | prepend '/home/linuxbrew/.linuxbrew/bin' | prepend $"($env.HOME)/.tea/tea.xyz/v*/bin" | prepend $"($env.HOME)/.local/share/rtx/bin")

let-env LS_COLORS = (^$"($env.HOME)/.local/share/rtx/installs/rust/latest/bin/vivid" generate snazzy | str trim)

let-env CLOUDSDK_PYTHON = (^$"($env.HOME)/.local/share/rtx/bin/rtx" where python)
