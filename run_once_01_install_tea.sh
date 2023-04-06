#!/bin/sh
. ./.profile
set -eu

# Install tea
curl tea.xyz | sh -s -- --yes
