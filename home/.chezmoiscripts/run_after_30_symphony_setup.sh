#!/bin/sh
set -eu

cd "${HOME}/.local/share/symphony/elixir" 2>/dev/null || exit 0

~/.local/bin/mise install
~/.local/bin/mise exec -- mix setup
~/.local/bin/mise exec -- mix build
