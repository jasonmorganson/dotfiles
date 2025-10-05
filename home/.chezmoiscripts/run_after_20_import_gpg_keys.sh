#!/bin/sh
set -eu

for keyfile in ~/.config/git/*.asc; do
    [ -f "$keyfile" ] || continue
    gpg --import "$keyfile" 2>/dev/null || true
    gpg --with-colons --import-options show-only --import < "$keyfile" 2>/dev/null | awk -F: '/^fpr:/{print $10":6:"}' | tail -1 | gpg --import-ownertrust 2>/dev/null || true
done
