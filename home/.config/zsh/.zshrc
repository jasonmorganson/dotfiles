# Activate the standard user-local mise installation before generated tool
# integrations are sourced.
eval "$("$HOME/.local/bin/mise" activate zsh)"

[[ -f "$HOME/.config/zsh/rc" ]] && . "$HOME/.config/zsh/rc"
[[ -f "$HOME/.config/zsh/preferences.zsh" ]] && . "$HOME/.config/zsh/preferences.zsh"
