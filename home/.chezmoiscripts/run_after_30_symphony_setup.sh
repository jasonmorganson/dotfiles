#!/bin/sh
set -eu

cd "${HOME}/.local/share/symphony/elixir"

mise install
mise exec -- mix setup
mise exec -- mix build
