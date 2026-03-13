#!/bin/sh
set -eu

cd "${XDG_DATA_HOME:-$HOME/.local/share}/symphony/elixir"

mise install
mise exec -- mix setup
mise exec -- mix build
