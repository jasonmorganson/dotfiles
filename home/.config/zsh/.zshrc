# Keep the machine-wide mise entrypoint stable; mise then selects the current
# user-managed tools before their generated integrations are sourced.
eval "$(/usr/local/bin/mise activate zsh)"

[[ -f "$HOME/.config/zsh/rc" ]] && . "$HOME/.config/zsh/rc"
[[ -f "$HOME/.config/zsh/preferences.zsh" ]] && . "$HOME/.config/zsh/preferences.zsh"
