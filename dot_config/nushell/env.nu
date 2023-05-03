source ~/.cache/nushell/xdg.nu

let-env PATH = ($env.PATH | split row (char esep) | prepend '/usr/local/bin' | prepend $"($env.HOME)/.tea/tea.xyz/v*/bin")

let-env LS_COLORS = (tea vivid generate snazzy | str trim)

let-env RTX_DATA_DIR = ~/.asdf
