#!/bin/sh
set -eu

repo_root="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
platform_config="$repo_root/home/.config/mise/config.macos.toml"
source_file="$repo_root/home/.config/mise/files/etc/pam.d/sudo_local"
dotfiles="$repo_root/home/.config/mise/conf.d/30-dotfiles.toml"
miserc="$repo_root/home/.config/mise/miserc.toml"

grep -Fxq 'auto_env = true' "$miserc" ||
    { echo "mise must enable platform-specific configuration" >&2; exit 1; }

grep -Fq '[bootstrap.files."/etc/pam.d/sudo_local"]' "$platform_config" ||
    { echo "Touch ID sudo override must be managed by bootstrap.files" >&2; exit 1; }
grep -Fxq 'source = "files/etc/pam.d/sudo_local"' "$platform_config" ||
    { echo "Touch ID sudo override must use the checked-in source" >&2; exit 1; }
grep -Fxq 'owner = "root"' "$platform_config" ||
    { echo "Touch ID sudo override must be root-owned" >&2; exit 1; }
grep -Fxq 'group = "wheel"' "$platform_config" ||
    { echo "Touch ID sudo override must use macOS wheel group" >&2; exit 1; }
grep -Fxq 'mode = "0444"' "$platform_config" ||
    { echo "Touch ID sudo override must preserve Apple template permissions" >&2; exit 1; }
grep -Fxq 'auth       sufficient     pam_tid.so' "$source_file" ||
    { echo "Touch ID sudo override must enable pam_tid" >&2; exit 1; }
grep -Fq '"~/.config/mise/config.macos.toml" = { mode = "symlink" }' "$dotfiles" ||
    { echo "macOS mise config must be dotfiles-managed" >&2; exit 1; }
grep -Fq '"~/.config/mise/miserc.toml" = { mode = "symlink" }' "$dotfiles" ||
    { echo "mise early-init config must be dotfiles-managed" >&2; exit 1; }

echo "Touch ID sudo bootstrap fixtures passed"
